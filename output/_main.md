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

One of the greatest challenges of modern medicine is how to promote regneration of the central nervous system (CNS).  Compared to most other tissues and organs in the human body, the CNS has exceptionally low regenerative ability.  As a result, damage to the CNS - whether through trauma, infection, or disease - often results in lifelong disability.  In contrast, the peripheral nervous system (PNS) is capable of substantial regeneration after injury, with severed nerves able to regrow several centimeters, reach their targets, and form functional conenctions, suggesting that regeneration of the CNS might be medically possible, if we can identify the relevant factors at play.  While there has been active research in this area for decades (if not centuries), we are still a long way from what most people would consider 'successful' regeneration of damaged CNS tissues -  the regrowth of damaged neuronal processes, appropriate remodelling of the extracellular environment, and restoration of functional synaptic connections.  In this section, I will summarise our current understanding of the factors limiting CNS regeneration, as well as the particular challenges I have decided to address with this project.

[//]: # (CITE - impact on QOL years worldwide)

### Extrinsic factors

In 1980, Peter Richardson and colleagues at McGill demonstrated that axons in a severed rat spinal cord could regenerate into an implanted sciatic nerve graft, thus demonstrating that CNS neurons were at least somewhat capable of regeneration, but were inhibited by their environment [@richardsonAxonsCNSNeurones1980].  There are a variety of environmental factors that can limit CNS axon growth, ranging from differences in the cellular composition of PNS and CNS tissues, to changes in the extracellular environment and cell surface receptors that occur as an organism ages.


#### Glia

Perhaps the most prominent difference between the CNS and the regeneration-competent PNS is their respective complements of glial cells.  Peripheral glia are dominated by myelinating Schwann cells, while glia in the CNS consist largely of a mix of astrocytes, microglia, and myelinating oligodendrocytes.  As glial cells can comprise roughly half of the cells in the mammalian nervous system (estimated from the human brain) [@vonbartheldSearchTrueNumbers2016], it is clear how this difference could have a significant effect on how these tissues respond to and recover from injury.  Glia contribute to the composition and behaviour of CNS - and thus its regenerative capacity - in a variety of ways, which I will briefly summarise in this section.

##### Myelination

Axons of the PNS and CNS are myelinated by Schwann cells and oligodendrocytes, respectively.  Despite the similarity in their function, these cells are morphologically and functionally distinct, and their differences contribute substantially to the difference in axon regeneration between these tissues.  In the PNS, injury induces a change in Schwann cells to a specific, repair-oriented phenotype.  In this state, the Schwann cells function to clear myelin debris by up-regulating phagocytosis and autophagy while decreasing their expression of myelin components.  They also increase expression of various trophic factors and cytokines, and form structures known as Bands of Büngner, which serve as guidance tracts for growing axons [@jessenRepairSchwannCell2016].  In contrast, oligodendrocytes in the CNS are typically either quiescent or apoptotic after injury, resulting in slower clearance of myelin debris, and the persistence of axon-inhibitory components at the injury site for longer [@vargasWhyWallerianDegeneration2007].

###### Myelin lipids

While much research into myelin and axon regeneration has focused on the presence of axon-inhibitory proteins in the myelin (e.g. MAG), more recent work has identified a number of mechanisms through which myelin lipids contribute to secondary injury and inhibit axon regeneration in the CNS.


##### Gliosis
##### Intercellular signalling


#### Extracellular matrix
##### Mechanics

#### Immune system

#### Synaptogenesis


### Intrinsic factors


<!--chapter:end:text/Intro.Rmd-->

# Materials and Methods {.unnumbered #METHODS}

```{=latex}
\markboth{MATERIALS AND METHODS}{}
```

<!--chapter:end:text/Methods.Rmd-->

---
output:
  pdf_document: default
  html_document: default
---
# Protrudin's effect on lysosome transport in the axon



## Introduction

### The many roles of neuronal lysosomes

Lysosomes have traidtionally been understood as the degradative compartment of the cell, responsible for the breakdown and recycling of excess or damaged proteins and organelles.  While this is certainly true, more recent work has shown that they are in fact a diverse pool of complex, multi-functional organelles.  While lysosomal function is essential to cellular survival broadly, it is particularly critical in neurons, which have additional metabolic, signalling, and transport constraints imposed by their extreme morphology.

#### Lysosomes in neurodegeneration

Lysosomal dysfunction has been implicated in a wide range of neurodegenerative diseases.  

#### RNA and ribsosomes

#### Signalling platform

#### ER morphology

#### Secretion

### Lysosome transport mechanisms

#### BORC

#### Calcyon and other adaptor proteins

#### Protrudin



## Methods

General cell culture and microscopy methods can be found in section \@ref(METHODS).

### Cloning of LAMP1 construct for lysosome^[While LAMP1 labels a variety of lysosome-related organelles, ranging from late endosomes to degradative autophagosomes, I will refer to LAMP1-labelled organelles as lysosomes throughout this thesis for the sake of brevity.] labelling

The LAMP1-RFP plasmid *(Addgene, 1817)* was modified to replace the existing CMV promoter with a human synapsin promoter to improve expression level in neurons.  Primers (see table \@ref(tab:primer-table)) were designed using the NEBuilder tool (https://nebuilder.neb.com) from New England Biolabs. 

\begin{table}

\caption{(\#tab:primer-table)Gibson cloning primers.}
\centering
\begin{tabular}[t]{ll}
\toprule
  & sequence\\
\midrule
plasmid forward & GGTTTAGTGAACCGTCAG\\
plasmid reverse & CGGAACTCCATATATGGG\\
insert forward & AGCCCATATATGGAGTTCCGCTAGACTCTAGCTGCAGAGGG\\
insert reverse & ATCTGACGGTTCACTAAACCTCGACTGCGCTCTCAGGC\\
\bottomrule
\end{tabular}
\end{table}

Fragments for cloning were produced by PCR, separated on a 1% agarose TBE gel, and purified using the Wizard SV Gel and PCR Clean-Up System kit *(Promega, A9282)*. 20$\textmu$L assembly reactions were set up with Gibson master mix *(New England Biolabs, E2611S)* and an appropriate ratio of insert and vector DNA (2:1 or higher) and incubated at 50$\textdegree$ for 1.5 hours. Assembled constructs were scaled up and successful cloning confirmed with restriction digest and DNA sequencing.



## Results

### Protrudin overexpression does not increase lysosome transport in the distal axon

Based on the findings in [@raiborgRepeatedEREndosome2015], I first set out to see if protrudin could be increasing the anterograde transport of late endosomes or lysosomes into the distal axon.  However, overexpression of wither wild type or active protrudin had no significant effect on the speed, direction, or number of lysosomes in the distal axon of cortical neurons.



The experiment was then repeated using Rab7 as a marker of late endosomes.  As the mechanism set out in [@raiborgRepeatedEREndosome2015] suggests that Rab7 is directly involved in protrudin-facilitated transport of late endosomes, overexpression of Rab7 could potentially amplify any effect of protrudin overexpression on this system.  However, my results show that protrudin also has no effect on late endosome transport in cortical axons.




## Discussion

The mechanism described in [@raiborgRepeatedEREndosome2015] relies on the protein FYCO1 as an adaptor to link late endosomes to kinesin for anterograde transport.  This protein, also known as ZFYVE7 (ADD DETAILS ON STRUCTURE).  Transcriptomic data from [@kosekiSelectiveRab11Transport2017] suggests that FYCO1 is mostly absent from mature cortical neurons, which could explain why we see no effect on late endosome transport with protrudin overexpression.  (ADD MORE TRANSCRIPTOME REFS)  

While these findings can effectively rule out late endosome/lysosome transport as a mechanism through which protrudin drives regeneration, they are worth bearing in mind when it comes to clinical translation.  The differential expression of FYCO1 across cell types suggests variations in the regulation of late endosome transport between them.  While protrudin overexpression has no effect on this transport in cortical neurons, it could potentially have an impact on other populations, leading to possible off-target effects.  Any gene therapies incorporating protrudin should therefore be carefully targeted to limit expression in the PNS and non-neuronal cells.


<!--chapter:end:text/Chapters/Chapter_1/Chapter_1.Rmd-->

# Chapter 2 title here

## Introduction

<!--CHANGE- placeholder for chapter intro-->
```{=latex}
\lipsum
```


### Analysis of published protrudin proteomics










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
#elbaz_alon$SYMBOL = toupper(elbaz_alon$SYMBOL)





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




# MOUSE EXPERIMENT, BUT REPORTED HUMAN GENE NAMES
hashimoto = select(org.Hs.eg.db,
                    keys = hashimoto.data$gene,
                    columns = c("ENTREZID", "SYMBOL", "GENENAME"),
                    keytype = "SYMBOL")
```

```
## 'select()' returned 1:1 mapping between keys and columns
```

```r
# using symbols as-is
# hashimoto = data.frame(SYMBOL = toupper(hashimoto.data$gene), stringsAsFactors = F)




#uniprot set in human cells
# uniprot = select(org.Hs.eg.db,
#                  keys = uniprot.data$uniprot,
#                  columns = c("ENTREZID", "SYMBOL", "GENENAME"),
#                  keytype = "UNIPROT")
#NOTE - as of 26/08/2021, canine RAB7A is included in the interactions list for human protrudin
#This will come back as an "NA" from this query, since it's not in the human data set
#I am leaving this as-is, since we're not interested in cross-species reactivity
#(This is apparently from the Raiborg et al. 2015 paper, although I can't find any mention in the paper or supplements of using canine RAB7, so it might be a mistake.)
```



```r
#standardising gene symbols that have changed between data sets, e.g. in response to Excel issues (SEPT2 -> SEPTIN2, etc.), as well as attempting to standardise gene names between mouse and human sets

aliases.mm = select(org.Mm.eg.db, keys = matsuzaki$SYMBOL, columns = c("SYMBOL", "GENENAME", "ALIAS"), keytype = "SYMBOL")
```

```
## 'select()' returned many:many mapping between keys and columns
```

```r
#check for equivalent genes in human set by any alias - symbols uppercase in human db
aliases.hs = select(org.Hs.eg.db, keys = c(elbaz_alon$SYMBOL, hashimoto$SYMBOL, toupper(aliases.mm$ALIAS)), columns = c("SYMBOL", "GENENAME", "ALIAS"), keytype = "ALIAS")
```

```
## 'select()' returned many:many mapping between keys and columns
```

```r
#deduplicate, remove NAs
aliases.hs = aliases.hs[!duplicated(aliases.hs),]
aliases.hs = aliases.hs[!is.na(aliases.hs$SYMBOL),]

#some aliases are linked to multiple symbols; picking first symbol if this is the case
elbaz_alon$SYMBOL = sapply(elbaz_alon$SYMBOL, function(s){ if(s %in% aliases.hs$ALIAS){return(aliases.hs[aliases.hs$ALIAS == s, "SYMBOL"][1])} else{return(s)} })

matsuzaki$SYMBOL = sapply(toupper(matsuzaki$SYMBOL), function(s){ if(s %in% aliases.hs$ALIAS){return(aliases.hs[aliases.hs$ALIAS == s, "SYMBOL"][1])} else{return(s)} })#CHECK

hashimoto$SYMBOL = sapply(hashimoto$SYMBOL, function(s){ if(s %in% aliases.hs$ALIAS){return(aliases.hs[aliases.hs$ALIAS == s, "SYMBOL"][1])} else{return(s)} })


#deduplicate
elbaz_alon = elbaz_alon[!duplicated(elbaz_alon$SYMBOL),]#CHECK MANUALLY

matsuzaki = matsuzaki[!duplicated(matsuzaki$SYMBOL),]#CHECK MANUALLY

hashimoto = hashimoto[!duplicated(hashimoto$SYMBOL),]#CHECK MANUALLY
```



```r
all_sets = list(`Elbaz-Alon et al. 2020 (human)` = elbaz_alon$SYMBOL,
                   `Matsuzaki et al. 2011 (mouse)` = toupper(matsuzaki$SYMBOL),
                   `Hashimoto et al. 2014 (mouse)` = hashimoto$SYMBOL)
                   #`Uniprot (human)` = uniprot$SYMBOL)
#excluding uniprot - focus on overlap in non-biased data sets
```





```r
ggvenn(all_sets, fill_color = viridis(length(all_sets)), set_name_size = 6, text_size = 7, show_percentage = FALSE) #+ theme(plot.background = element_rect(fill = "#FDFDFD", colour = NA))
```

![](_main_files/figure-latex/venn-1.pdf)<!-- --> 

```r
#TODO - report theme
```




```r
symbols.df = data.frame(symbol = unique(unlist(all_sets)), stringsAsFactors = F)
symbols.df$in_ea = symbols.df$symbol %in% elbaz_alon$SYMBOL
symbols.df$in_m = symbols.df$symbol %in% matsuzaki$SYMBOL
symbols.df$in_h = symbols.df$symbol %in% hashimoto$SYMBOL
# symbols.df$in_u = symbols.df$symbol %in% uniprot$SYMBOL

symbols.df = symbols.df %>%  mutate(multiple = rowSums(across(where(is.logical))))

multiples.df = symbols.df[symbols.df$multiple >= 2,]
multiples.df$ENTREZID = select(org.Hs.eg.db,
                              keys = multiples.df$symbol,
                              columns = c("ENTREZID"),
                              keytype = "SYMBOL")$ENTREZID
```

```
## 'select()' returned 1:1 mapping between keys and columns
```



```r
multiples.go = goana(multiples.df$ENTREZID)
bio_proc = topGO(multiples.go, ontology = 'BP')
cell_comp = topGO(multiples.go, ontology = 'CC')#basically all ER; COP vesicles show up at end

bio_proc$n_log = -log(bio_proc$P.DE)
bio_proc$Term = factor(bio_proc$Term, levels = rev(bio_proc$Term))#I'm not 100% sure why this works but it does
```


```r
ggplot(bio_proc, aes(x = Term, y = n_log)) + geom_bar(stat='identity', fill = viridis(1)) + coord_flip() + labs(x = '', y = expression(-log[10] ~ "(p-value)"), title = "GO Biological Process") + report_theme + theme(legend.position = 'none') 
```

![](_main_files/figure-latex/GO_plots-1.pdf)<!-- --> 

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

