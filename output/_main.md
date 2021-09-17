---
title: "Insert cool thesis title here"
author: "Fiona M. Love"
college: "Pembroke"
sub_date: "??? 202?"
degree: "Doctor of Philosophy"


documentclass: book
output:
  #bookdown::gitbook: default
  bookdown::pdf_book:
    includes:
      in_header: tex/preamble.tex
      before_body: tex/title_page.tex
    #template: "personal_template.tex" #breaking bibliography
    keep_tex: true
    keep_md: true
    number_sections: true
    toc: FALSE
    #toc_bib: TRUE
    citation_package: natbib
    

bibliography: bib/THESIS.bib
csl: bib/plos.csl
---

<!--chapter:end:index.Rmd-->

# Acknowledgements {.unnumbered #ACKNOWLEDGEMENTS}

```{=latex}
\markboth{ACKNOWLEDGEMENTS}{}
```

<!--chapter:end:text/Acknowledgements.Rmd-->

# Abstract {.unnumbered #ABSTRACT}

```{=latex}
\markboth{ABSTRACT}{}
```

<!--chapter:end:text/Abstract.Rmd-->


```{=latex}

\markboth{CONTENTS}{}

\tableofcontents
```

<!--chapter:end:text/TOC_manual.Rmd-->

# Introduction {.unnumbered #INTRODUCTION}

```{=latex}
\markboth{INTRODUCTION}{}
```

## Glaucoma


## Factors limiting CNS regeneration

One of the greatest challenges of modern medicine is how to promote regneration of the CNS.  Compared to most other tissues and organs in the human body, the CNS has exceptionally low regenerative ability.  As a result, damage to the CNS - whether through trauma, infection, or disease - often results in lifelong disability.  In contrast, the peripheral nervous system (PNS) is capable of substantial regeneration after injury, with severed nerves able to regrow several centimeters, reach their targets, and form functional conenctions, suggesting that regeneration of the CNS might be medically possible, if we can identify the relevant factors at play.  While there has been active research in this area for decades (if not centuries), we are still a long way from what most people would consider 'successful' regeneration of damaged CNS tissues -  the regrowth of damaged neuronal processes, appropriate remodelling of the extracellular environment, and restoration of functional synaptic connections.  In this section, I will summarise our current understanding of the factors limiting CNS regeneration, as well as the particular challenges I have decided to address with this project.

[//]: # (CITE - impact on QOL years worldwide)

### Extrinsic factors

In 1980, Peter Richardson and colleagues at McGill demonstrated that axons in a severed rat spinal cord could regenerate into an implanted sciatic nerve graft thus demonstrating that CNS neurons were at least somewhat capable of regeneration, but were inhibited by their environment [@richardsonAxonsCNSNeurones1980].  

#### Myelination

#### Extracellular matrix
##### Mechanics

#### Glia
##### Myelin lipids

#### Immune system

#### Synaptogenesis


### Intrinsic factors


<!--chapter:end:text/Intro.Rmd-->

# Materials and Methods {.unnumbered #METHODS}

```{=latex}
\markboth{MATERIALS AND METHODS}{}
```

<!--chapter:end:text/Methods.Rmd-->

# Chapter 1 title here

## Introduction

<!--CHANGE- placeholder for chapter intro-->
```{=latex}
\lipsum
```

## Methods
\@ref(METHODS)

## Results

### Protrudin overexpression does not increase lysosome transport in the distal axon


<!--chapter:end:text/Chapters/Chapter_1/Chapter_1_placeholder.Rmd-->

# Chapter 2 title here

## Introduction

<!--CHANGE- placeholder for chapter intro-->
```{=latex}
\lipsum
```


### Analysis of published protrudin proteomics







```r
knitr::opts_chunk$set(echo = TRUE)

library(ggvenn)

#Bioconductor Orgs
library(org.Hs.eg.db)
library(org.Mm.eg.db)

#Bioconductor package for handling gene aliases
library(limma)

#for calls to uniprot REST API
library(httr)
```



```r
#TODO - FIX FILE PATHS

#From Elbaz-Alon et al. 2020, Nat Commun
#extracted from Supplementary Data Set 2 PDF
elbaz_alon.data = read.csv('C:/Users/fl299/PhD/Writing/Thesis/data/published_data_sets/Elbaz-Alon_2020_protrudin_interactions.csv', stringsAsFactors = F)

#From Matsuzaki et al. 2011, MBOC
#modified from supplementary file mc-e11-01-0068-s02.xls - removed merged cells, etc.
matsuzaki.data = read.csv('C:/Users/fl299/PhD/Writing/Thesis/data/published_data_sets/Matsuzaki_2011_protrudin_interactions.csv', stringsAsFactors = F)

#From Hashimoto et al. 2014, J Biol Chem
#transcribed and deduplicated from Table 1 - gene symbols only
hashimoto.data = read.csv('C:/Users/fl299/PhD/Writing/Thesis/data/published_data_sets/Hashimoto_2014_protrudin_interactions.csv', stringsAsFactors = F)

#From uniprot interactions for human ZFYVE27 (Q5T4F4) - curated from literature
#initial query to get up-to-date interactions, then working with fixed CSV to avoid unexpected changes
uniprot.call = GET('https://www.uniprot.org/uniprot/?query=id:Q5T4F4&columns=id,genes,organism,interactor&format=tab')
uniprot.table = read.delim(text = httr::content(uniprot.call), header = TRUE, stringsAsFactors = FALSE)
uniprot.data = data.frame(uniprot = strsplit(uniprot.table$Interacts.with, split = "; ")[[1]], stringsAsFactors = F)
uniprot.data$uniprot[uniprot.data$uniprot == "Itself"] = "Q5T4F4"
#trim isoforms - won't match in Bioconductor org
uniprot.data$uniprot = sapply(uniprot.data$uniprot, function(u){ sub("-\\d+$", "", u) })
```


```r
#Elbaz-Alon set is in human cells
elbaz_alon = select(org.Hs.eg.db,
                    keys = elbaz_alon.data$ZFYVE27,
                    columns = c("ENTREZID", "SYMBOL", "GENENAME"),
                    keytype = "SYMBOL")
```

```
## 'select()' returned many:many mapping between keys and columns
```

```r
elbaz_alon$SYMBOL = toupper(elbaz_alon$SYMBOL)


#Matsuzaki and Hashimoto sets are in mouse cells
matsuzaki = select(org.Mm.eg.db,
                    keys = as.character(matsuzaki.data$Gene),
                    columns = c("ENTREZID", "SYMBOL", "GENENAME"),
                    keytype = "ENTREZID")
```

```
## 'select()' returned many:1 mapping between keys and columns
```

```r
#change symbols to uppercase to match with human set
#TODO - check if any orthologs have different names across sets
matsuzaki$SYMBOL = toupper(matsuzaki$SYMBOL)

# hashimoto = select(org.Mm.eg.db,
#                     keys = hashimoto.data$gene,
#                     columns = c("ENTREZID", "SYMBOL", "GENENAME"),
#                     keytype = "ALIAS")
# using symbols as-is
hashimoto = data.frame(SYMBOL = toupper(hashimoto.data$gene), stringsAsFactors = F)

#uniprot set in human cells
uniprot = select(org.Hs.eg.db,
                 keys = uniprot.data$uniprot,
                 columns = c("ENTREZID", "SYMBOL", "GENENAME"),
                 keytype = "UNIPROT")
```

```
## 'select()' returned 1:1 mapping between keys and columns
```

```r
#NOTE - as of 26/08/2021, canine RAB7A is included in the interactions list for human protrudin
#This will come back as an "NA" from this query, since it's not in the human data set
#I am leaving this as-is, since we're not interested in cross-species reactivity
#(This is apparently from the Raiborg et al. 2015 paper, although I can't find any mention in the paper or supplements of using canine RAB7)

all_symbols = list(`Elbaz-Alon et al. 2020 (human)` = elbaz_alon$SYMBOL,
                   `Matsuzaki et al. 2011 (mouse)` = matsuzaki$SYMBOL,
                   `Hashimoto et al. 2014 (mouse)` = hashimoto$SYMBOL,
                   `Uniprot (human)` = uniprot$SYMBOL)
```


```r
ggvenn(all_symbols, fill_color = viridis::viridis(4), set_name_size = 6, text_size = 7) #+ theme(plot.background = element_rect(fill = "#FDFDFD", colour = NA))
```

![](_main_files/figure-latex/venn-1.pdf)<!-- --> 

```r
#TODO - report theme
```




```r
symbols.df = data.frame(symbol = unique(unlist(all_symbols)), stringsAsFactors = F)
symbols.df$in_ea = symbols.df$symbol %in% elbaz_alon$SYMBOL
symbols.df$in_m = symbols.df$symbol %in% matsuzaki$SYMBOL
symbols.df$in_h = symbols.df$symbol %in% hashimoto$SYMBOL
symbols.df$in_u = symbols.df$symbol %in% uniprot$SYMBOL
```



```r
GO = select(org.Hs.eg.db,
            keys = symbols.df$symbol,
            columns = c("GO"),
            keytype = "SYMBOL")
```

```
## 'select()' returned 1:many mapping between keys and columns
```

<!--chapter:end:text/Chapters/Chapter_2/Chapter_2_placeholder.Rmd-->

# Discussion {.unnumbered #DISCUSSION}

```{=latex}
\markboth{DISCUSSION}{}
```


<!--chapter:end:text/Discussion.Rmd-->

# Appendix {.unnumbered #APPENDIX}

```{=latex}
\markboth{APPENDIX}{}
```


<!--chapter:end:text/Appendix.Rmd-->

