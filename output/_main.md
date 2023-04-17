---
title: "Investigating protrudin's role in neuroprotection and axon regeneration in the central nervous system"
author: "Fiona M. Love"
college: "Pembroke"
sub_date: "February 2023"
degree: "Doctor of Philosophy"
#^NOT USED - superseded by title_page.tex

documentclass: book
output:
  bookdown::pdf_book:
    includes:
      in_header: tex/preamble.tex
      before_body: tex/title_page.tex
    latex_engine: xelatex
    keep_tex: true
    keep_md: true
    number_sections: true
    toc: FALSE
    toc_bib: TRUE
papersize: a4
fontsize: 12pt
linestretch: 1.5
bibliography: bib/THESIS.bib
csl: bib/plos.csl
always_allow_html: true
---
---
title: "Investigating protrudin's role in neuroprotection and axon regeneration in the central nervous system"
author: "Fiona M. Love"
college: "Pembroke"
sub_date: "February 2023"
degree: "Doctor of Philosophy"
#^NOT USED - superseded by title_page.tex

documentclass: book
output:
  bookdown::pdf_book:
    includes:
      in_header: tex/preamble.tex
      before_body: tex/title_page.tex
    latex_engine: xelatex
    keep_tex: true
    keep_md: true
    number_sections: true
    toc: FALSE
    toc_bib: TRUE
papersize: a4
fontsize: 12pt
linestretch: 1.5
bibliography: bib/THESIS.bib
csl: bib/plos.csl
always_allow_html: true
---

<!--chapter:end:index.Rmd-->

# Preface {.unnumbered #PREFACE}
```{=latex}
\markboth{PREFACE}{}
```

This thesis is the result of my own work and includes nothing which is the outcome of work done in collaboration, with the exception of section \@ref(protrudin-ONC), as specified in the text.

It is not substantially the same as any work that has already been submitted before for any degree or other qualification.

It does not exceed the prescribed word limit for the Clinical Medicine and Clinical Veterinary Medicine Degree Committee.

Studentship funding for this work was provided by Fight for Sight.

<!--chapter:end:text/Preface.Rmd-->

# Acknowledgements {.unnumbered #ACKNOWLEDGEMENTS}
```{=latex}
\markboth{ACKNOWLEDGEMENTS}{}
```

First and foremost, I would like to thank my supervisor, Dr. Richard Eva, for his teaching, guidance, and support throughout my PhD.  A project like this is difficult at the best of times, and these past few years have been anything but.  I am very grateful to have had a supervisor I could rely on while facing the unique challenges of a pandemic-era PhD.

I am grateful to all members of the Fawcett-Martin lab, past and present, for their help and advice throughout this project.  In particular, I would like to thank Vessy Petrova, Bart Nieuwenhuis, Randa Abu-Youssef, and Elise Laperrousaz, without whom I would not have been able to complete the experiments described in this thesis.  I would also like to thank James Fawcett and Keith Martin, for making this entire project possible.

I would like to thank Andras Lakatos for being my 'official' supervisor, and always being a great source of advice.

I would like to thank Jessica Kwok and Edward Avezov for their time and input in serving as my examiners for this thesis.

I would like to thank the University of Cambridge Statistics Clinic for their advice on the analyses included in this thesis.

I would like to thank my parents, sister, and grandparents, for their support and encouragement in the years it has taken me to get here.  I would not be where I am now without all of you.

Finally, I would like to thank my partner Robert May for his unwavering support throughout my PhD.  These past few years have been challenging in ways I never imagined, and I could not have achieved this without you by my side.  

<!--chapter:end:text/Acknowledgements.Rmd-->

# Abstract {.unnumbered #ABSTRACT}
```{=latex}
\markboth{ABSTRACT}{}
\setstretch{1.4} %slightly smaller spacing to fit abstract onto single page
```

Protrudin — a transmembrane scaffold protein found in tubular regions of the endoplasmic reticulum (ER) — has previously been shown to strongly promote neuronal survival and axon regeneration after central nervous system (CNS) injury.  This is in part due to increased levels of integrins in the distal axon, but this mechanism does not fully account for its beneficial effects.  We have investigated protrudin's effects on intracellular transport, morphology, and protein localisation in neurons, and found varied but specific effects on different cellular systems.  In particular, protrudin does not have any effect on the transport of late endosomes in CNS neurons — despite evidence for this mechanism in other cell types — due to the absence of key adaptor protein FYCO1 in mature neurons.  It also does not have any substantial effect on dendritic spine morphology, so it does not indiscriminately promote cellular outgrowth.  On the other hand, protrudin does interact with ER export and associated secretory machinery.  Overexpression of an active mutant of protrudin increases the amount of an ER-Golgi intermediate compartment in axon terminals, and affects the transport of Golgi satellite organelles, which we observed even in the distal axon.  Our data demonstrates that protrudin provides axons with the machinery for local membrane protein synthesis, which may play a role in neuron survival and regeneration.  This work opens up new avenues for future research into adult CNS repair.

```{=latex}
\setstretch{1.5}
```

<!--chapter:end:text/Abstract.Rmd-->


```{=latex}
\tableofcontents
\listoffigures
\listoftables
```

<!--chapter:end:text/TOC_manual.Rmd-->

---
output:
  pdf_document: default
  html_document: default
---
# Abbreviations {.unnumbered #ABBREVIATIONS}
```{=latex}
\markboth{ABBREVIATIONS}{}
```



|Abbreviation       |Meaning                                                                   |
|:------------------|:-------------------------------------------------------------------------|
|AAV                |adeno-associated virus                                                    |
|ACSL3              |acyl-CoA synthetase long chain family member 3                            |
|AKT                |AKT serine/threonine kinase; protein kinase B                             |
|ALS                |amyotrophic lateral sclerosis                                             |
|ANXA11             |annexin A11                                                               |
|ARF6               |ADP ribosylation factor 6                                                 |
|Arl8b              |ADP ribosylation factor like GTPase 8B                                    |
|ARMCX1             |armadillo repeat containing X-linked 1                                    |
|ATF3               |activating transcription factor 3                                         |
|BCAP31             |B cell receptor associated protein 31                                     |
|BODIPY             |boron-dipyrromethene                                                      |
|BORC               |BLOC1-related complex                                                     |
|BSA                |bovine serum albumin                                                      |
|cAMP               |cyclic adenosine monophosphate                                            |
|CC                 |coiled-coil (protein motif)                                               |
|c-Jun              |cellular homolog of viral oncogene v-jun                                  |
|CMV                |cytomegalovirus                                                           |
|CNS                |central nervous system                                                    |
|COPII              |coat protein complex II                                                   |
|DIV                |days in vitro                                                             |
|DRG                |dorsal root ganglion                                                      |
|EFA6               |exchange factor for ADP-ribosylation factor guanidine nucleotide factor 6 |
|EGFP               |enhanced green fluorescent protein                                        |
|ER                 |endoplasmic reticulum                                                     |
|ERES               |ER exit sites                                                             |
|ERGIC              |ER-Golgi intermediate compartment                                         |
|ERGIC53            |ERGIC protein 53; LMAN1                                                   |
|ESCargo&nbsp;(FTV) |Erv29/Surf4-dependent secretory cargo with FTV export tripeptide          |
|FFAT               |two phenylalanines (FF) in an acidic tract (protein motif)                |
|FYCO1              |FYVE and coiled-coil domain autophagy adaptor 1; ZFYVE7                   |
|FYVE               |Fab1 YOTB Vac1 EEA1 zinc finger domain (protein motif)                    |
|GAPDH              |glyceraldehyde-3-phosphate dehydrogenase                                  |
|GLG1               |Golgi glycoprotein 1                                                      |
|GO                 |gene ontology                                                             |
|GS28               |28 KDa Golgi SNARE protein; GOSR1                                         |
|GTPase             |guanosine triphosphatase                                                  |
|HeLa               |human carcinoma cell line                                                 |
|HSP                |hereditary spastic paraplegia                                             |
|JIP3/4             |JNK-interacting proteins 3/4                                              |
|KIF5               |kinesin family member 5                                                   |
|KLF                |Kr<fc>ppel-like factor                                                    |
|LAMP1              |lysosomal associated membrane protein 1                                   |
|LC3                |microtubule-associated protein 1A/1B light chain 3                        |
|LRRK2              |leucine rich repeat kinase 2                                              |
|MCS                |membrane contact sites                                                    |
|MIA3               |melanoma inhibitory activity protein 3; TANGO1                            |
|MMP-9              |matrix metalloproteinase 9                                                |
|mRFP               |monomeric red fluorescent protein                                         |
|mRNA               |messenger ribonucleic acid                                                |
|mTOR               |mechanistic/mammalian target of rapamycin kinase                          |
|mTORC1             |mTOR complex 1                                                            |
|p115               |general vesicular transport factor p115; USO1                             |
|PBS                |phosphate-buffered saline                                                 |
|PC12               |rat pheochromocytoma cell line                                            |
|PCR                |polymerase chain reaction                                                 |
|PI3K               |phosphatidylinositol-3 kinase                                             |
|PIP                |phosphatidylinositol phosphate                                            |
|PKA                |protein kinase A                                                          |
|PM                 |plasma membrane                                                           |
|PNS                |peripheral nervous system                                                 |
|Rab11              |Ras-related protein Rab-11a                                               |
|Rab7               |Ras-related protein Rab-7a                                                |
|RBD                |Rab-binding domain                                                        |
|RBPMS              |RNA binding protein with multiple splicing (RGC marker)                   |
|RGC                |retinal ganglion cell                                                     |
|RILP               |Rab interacting lysosomal protein                                         |
|ROI                |region of interest                                                        |
|RTN3               |reticulon 3                                                               |
|Sar1               |secretion associated Ras related GTPase 1                                 |
|SEC31A             |SEC31 homolog A, COPII coat complex component                             |
|shRNA              |short hairpin ribonucleic acid                                            |
|SKIP               |SifA and kinesin interacting protein; PLEKHM2                             |
|SLC38A1            |solute carrier family 38 member 1                                         |
|SOCS3              |suppressor of cytokine signalling 3                                       |
|St3Gal5            |ST3 beta-galactoside alpha-2,3-sialyltransferase 5                        |
|SURF4              |surfeit locus protein 4                                                   |
|SYN                |synapsin                                                                  |
|TANGO1             |transport and Golgi organization protein 1 homolog; MIA3                  |
|TET1               |ten-eleven translocation 1 gene protein                                   |
|TIMP1              |TIMP metallopeptidase inhibitor 1                                         |
|TRPM8              |transient receptor potential cation channel subfamily M member 8<a0>      |
|USO1               |USO1 vesicle docking protein homolog; p115                                |
|VAPA/B             |VAMP associated proteins A/B                                              |
|WT                 |wild type                                                                 |
|ZFYVE7             |zinc finger FYVE domain-containing protein 7; FYCO1                       |
|ZFYVE27            |zinc finger FYVE domain-containing protein 27; protrudin                  |

<!--chapter:end:text/Glossary.Rmd-->


# Introduction {.unnumbered #INTRODUCTION}

Placeholder


## The challenge of CNS regeneration
### Glaucoma
## Factors limiting CNS regeneration
### Synaptogenesis
### Cytoskeleton
### Signalling
#### PTEN and mTOR
#### Other signalling pathways
### Epigenetic and transcriptional regulation
### Intracellular transport
#### Recycling endosomes
#### Mitochondria
### The virtuous cycle of axon growth
## Protrudin {#intro-ptdn}
### Structure and localisation
### Cellular outgrowth, migration, and invasion
### Transport{#intro-ptdn-transport}
### ER contact sites
### Axonal ER{#intro-ptdn-axonalER}
### Previous work on protrudin

<!--chapter:end:text/Intro.Rmd-->


# Materials and Methods {.unnumbered #METHODS}

Placeholder


## Plasmids and antibodies
## Software
## Protocols
### Plasmid preparation{#plasmid-prep}
### Cortical neuron cultures
### Transfection
### Immunocytochemistry{#immuno}
### Microscopy
### Image analysis
#### Kymograph analysis{#kymo}
### Statistical analysis

<!--chapter:end:text/Methods.Rmd-->


# Is protrudin's effect on neuroprotection mediated by lysosome and/or late endosome transport?

Placeholder


## Introduction
### The many roles of neuronal lysosomes
#### RNA transport
#### Signalling platform
#### ER morphology
### Lysosome transport mechanisms
#### BORC/Arl8b/SKIP
#### Calcyon and other adaptor proteins
#### Protrudin
## Methods
### Cloning of LAMP1 construct for lysosome^[While LAMP1 labels a variety of lysosome-related organelles [@chengRevisitingLAMP1Marker2018], ranging from late endosomes to degradative autophagosomes, I will refer to LAMP1-labelled organelles as lysosomes throughout this thesis for the sake of brevity.] labelling{#cloning}
### Calcyon shRNA silencing
### Lysotracker labelling
### BORC-related constructs for lysosome/late endosome manipulation
### Transfection optimisation
## Results^[The results presented in this section largely reflect my first year of study, a time when I was also training to perform *in vivo* experiments to assess neuroprotection and regeneration in the eye and optic nerve.  My initial plan was to determine protrudin's effect on lysosome/late endosome transport, and then test a variety of different tools (e.g. calcyon shRNA, BORC overexpression, etc.) to manipulate lysosome and late endosome transport and assess their regenerative potential.  Unfortunately, the cessation of lab work during the pandemic and associated disruptions eventually led us to abandon most of these plans.]
### Protrudin overexpression is neuroprotective following axon injury *in vivo*{#protrudin-ONC}
### Protrudin overexpression does not increase lysosome or late endosome transport in the distal axon{#lyso-LE}
## Discussion{#no-FYCO}

<!--chapter:end:text/Chapter_1.Rmd-->

---
output:
  pdf_document: 
      latex_engine: xelatex
      keep_tex: true
  html_document: default
  word_document: default
bibliography: "C:/Users/fl299/PhD/Writing/Thesis/bib/THESIS.bib"
always_allow_html: true
---

# Identifying protrudin's neuronal functions

```{=latex}
\chaptermark{Neuronal functions}
```



## Introduction

As discussed previously in section \@ref(intro-ptdn), protrudin's array of binding domains allow it to participate in numerous cellular systems, with diverse effects.  To identify other mechanisms of action, we decided to take a broad approach, examining a number of different systems to identify how protrudin might influence neuronal function, either endogenously or with overexpression.

Previous work in the lab found it extremely difficult to reduce protrudin levels in neurons — either by shRNA or CRISPR — without killing the cells.  We were able to study loss of protrudin expression through overexpression of mutants with dominant negative effects, rather than protrudin deletion or silencing.

### Cellular morphology
While protrudin's role in cell outgrowth is interesting from the perspective of axon regeneration, it could potentially play a number of other roles in neuron morphology.  Petrova et al. showed that endogenous protrudin is present in both axons and dendrites, but is most abundant in the dendrites and cell bodies of mature neurons [@petrovaProtrudinFunctionsEndoplasmic2020].  Consequently, protrudin's endogenous functions may well be more apparent in the somatodendritic domain.  In fact, there are a number of published findings that suggest that protrudin may function in dendrites, either to control dendritic spine morphology or support synaptic function.  

For example, the mechanism through which protrudin promotes invadopodia formation in cancer cells is functionally similar to how lysosomal exocytosis induces dendritic spine expansion, raising the possibility that protrudin is involved in spine growth [@pedersenProtrudinmediatedEREndosome2020; @padamseyActivityDependentExocytosisLysosomes2017].  However, Pedersen et al. found that this process is dependent on FYCO1 as well as protrudin, which (as discussed in section \@ref(no-FYCO)), is largely absent in CNS neurons [@pedersenProtrudinmediatedEREndosome2020].  On the other hand, protrudin has already been shown to play a functional role at dendritic spines, mediating long term depression by allowing internalised AMPA receptors to be removed from the spine through association with KIF5 [@brachetKinesin1protrudinComplex2021].  In addition, ER tubules (or the more complicated spine apparatus) have been observed either transiently or permanently in most spines on hippocampal neurons [@perez-alvarezEndoplasmicReticulumVisits2020], which also suggests that protrudin is likely to be present in or near spines and could act on their morphology.  Given protrudin's effect in cellular outgrowth, therefore, it is reasonable to expect that protrudin overexpression might have an effect on dendritic spine morphology.

### Functional effects

To further examine protrudin's endogenous roles beyond cellular outgrowth, we turned to the literature to identify published proteomics data sets.  We identified three studies that published lists of protrudin-interacting proteins [@elbaz-alonPDZD8InteractsProtrudin2020; @hashimotoProtrudinRegulatesEndoplasmic2014; @matsuzakiProtrudinServesAdaptor2011].  Each study used a different model system and focused their analysis on different pathways, providing a variety of perspectives.  

Elbaz-Alon et al. looked at protrudin in a human epithelial cell line, where they investigated how protrudin interacts with PDZD8 and contributes to ER contact sites  [@elbaz-alonPDZD8InteractsProtrudin2020].  Hashimoto et al. used mouse brain neurons to look at interactions between protrudin and HSP-related proteins [@hashimotoProtrudinRegulatesEndoplasmic2014], while Matsuzaki et al. used a mouse neuroblast cell line to study the interaction between protrudin and KIF5 [@matsuzakiProtrudinServesAdaptor2011].  Individually, these reveal a number of interesting interactions, indicating diverse roles for protrudin that include but are not limited to axonal function.  Taken together, a substantial level of overlap between the interaction sets reveals a conserved set of cellular functions that may help explain protrudin's role in neurons.

## Methods

General cell culture and microscopy methods can be found in section \@ref(METHODS).

### Dendritic spine imaging and analysis

Neurons were co-transfected with mCherry or an mCherry-tagged protrudin construct and EGFP/Emerald.  Cells were imaged as Z-stacks at DIV15, either on the spinning disc at 100x, or confocal at 63x (see \@ref(METHODS) for microscope details).  Image stacks from the green channel were converted to maximum intensity projections, and a custom ImageJ macro was used to select and crop 20\textmu{}m sections from a dendrite.  These images were then blinded, and the Cell Counter Fiji plugin was used to count and classify spines.  For spine length, the Fiji segmented line tool was used to measure along each spine.

### Gene ontology analysis

Lists of protrudin-interacting proteins were obtained from supplementary data published with [@elbaz-alonPDZD8InteractsProtrudin2020], [@hashimotoProtrudinRegulatesEndoplasmic2014], and [@matsuzakiProtrudinServesAdaptor2011].  Gene names were standardised across experiments (and between human and mouse data sets) using Bioconductor genome annotations (`org.Hs.eg.db` version 3.15.0 and `org.Mm.eg.db` version 3.15.0).  Gene ontology analysis for biological process enrichment was carried out using the `limma` Bioconductor package in R.

### HeLa cell culture

HeLa cells were expanded before use and cryopreserved in individual vials to prevent genetic drift between batches.

HeLa cells were grown in DMEM *(Thermo Fisher, 41966-029)*, supplemented with 10% FBS *(Thermo Fisher, 10500064)* and antibiotic-antimycotic *(Thermo Fisher, 15240062)*, at 37°C, 5% CO~2~.  For each batch of cells, a single vial was thawed, passaged, and grown to 60-80% confluence before transfection.  Cells were transfected with EGFP or EGFP-tagged protrudin under a CAG promoter, using TransIT-LT1 reagent *(Mirus Bio, MIR2300)*, according to the manufacturer's protocol.  These were then passaged 24 hours after transfection to reduce overlap between cells and encourage protrusion growth.

Cells were fixed with 3% formaldehyde in PBS for 15 minutes at room temperature.  Immunochemistry was carried out according to the protocol in section \@ref(immuno).  Staining with BODIPY TR C~5~ ceramide *(Thermo Fisher, B34400)* was carried out according to the manufacturer's protocol.  Briefly, cells were incubated with 5\textmu{}M dye in DMEM for 30 minutes at 4°C.  They were then recovered in supplemented media at 37°C, 5% CO~2~ for 30 minutes before fixing as usual.

## Results

### Protrudin's effect on dendritic spine number, length, and morphology

Given protrudin's dendritic localisation and known effects on protrusion formation, we first decided to examine whether protrudin plays a role in regulating dendritic spine morphology.  Dendritic spines show diverse morphology within and between cells, which is generally considered to be reflective of the maturity, functionality, and plasticity of each spine.  While these ultimately fall on a continuous spectrum of shapes, they are conventionally grouped into four morphological classes — mushroom, thin, stubby, and filopodia [@pchitskayaDendriticSpinesShape2020].  We decided to use these classes to obtain an overview of spine morphology on cells expressing protrudin.  

We counted and manually classified dendritic spines on 20\textmu{}m sections of dendrite from DIV15 or DIV21 neurons co-expressing an EGFP/Emerald filler with an mCherry-labelled protrudin construct (figure \@ref(fig:spine-type-full-figure)).  These included WT and active protrudin, as well as a set of domain-deletion mutants to act as dominant negatives.  \textDelta{}FFAT, \textDelta{}RBD, and \textDelta{}FYVE each have a single binding motif deleted, \textDelta{}KIF5 has both the CC and FFAT domains deleted, to completely block binding to kinesin, and \textDelta{}ER mutant (\textDelta{}TM1-3) has all transmembrane domains deleted [@petrovaProtrudinFunctionsEndoplasmic2020].  The DIV15 data suggests that WT protrudin might be associated with fewer, stubbier spines, although the significant comparisons varied for each spine classification, and is inconsistent with the DIV21 data.

```{=latex}
\newgeometry{a4paper, top=40mm, left=35mm, right=35mm, bottom = 30mm} %unnecessary as long as 1.5in margins overall
```
\begin{figure}
\includegraphics{../figures/full/spine-type-full-figure-1} \caption[Protrudin effect on dendritic spine morphology]{A) Schematic showing selection of dendrite sections for analysis and basic spine morphology groups.  One dendrite section was analysed per cell.  Scale bar is 10\textmu{}m.  B-C) Total spine counts in 20\textmu{}m section for DIV15 and DIV21 groups.  D-E) Quantification of each spine type, normalised to the total number of spines in the section measured.  DIV15: n = 30 cells per condition across three independent batches; DIV21: n = 10 cells per condition in one batch.}(\#fig:spine-type-full-figure)
\end{figure}
```{=latex}
\restoregeometry
\setstretch{1.5} %not restored by \restoregeometry
```

As manual spine classification is an inherently subjective measure, and did not show any clear associations, we decided to look instead at spine length, which can be measured more objectively.  We re-analysed the initial DIV15 data, measuring the length of each spine from the edge of the dendrite.  This did yield some significant comparisons, both in spine number and length, so we followed this up with a full replication, which we analysed in the same way (figure \@ref(fig:spine-length-full-figure)).  While the replication also produced statistically significant results, they were wholly inconsistent between the two experiments.    

\begin{figure}
\includegraphics{../figures/full/spine-length-full-figure-1} \caption[Protrudin effect on dendritic spine length]{A-B) Number of dendritic spines counted per 20\textmu{}m section in cells co-expressing EGFP/Emerald with an mCherry-tagged protrudin construct.  Replicate 1: n = 30 cells per condition across three independent batches, except \textDelta{}RBD n = 29, \textDelta{}KIF5 n = 20, \textDelta{}FYVE n = 19 across two batches.  Replicate 2: n = 40 cells per condition, except WT and \textDelta{}ER n = 39, across three independent batches. C-D) Length of each spine measured, in \textmu{}m.}(\#fig:spine-length-full-figure)
\end{figure}

Taken together, these results show that protrudin overexpression does not substantially impact dendritic spine number, length, or morphology.  These measurements were highly variable between cells and between replicates, and did not show any consistent patterns that would suggest that protrudin plays any role in controlling spine outgrowth.  This obviously cannot rule out changes in spine function, but in any case such changes do not seem to be mediated by morphological changes at the micron scale.

### Protrudin's interactions with other proteins in the cell{#GO-analysis}

As our results did not indicate a clear role for protrudin in regulating dendritic spine morphology, we turned to proteomic analysis to identify other potential cellular functions, either in the somatodendritic domain or in axons.

We identified three published lists of protrudin-interacting proteins from [@elbaz-alonPDZD8InteractsProtrudin2020], [@hashimotoProtrudinRegulatesEndoplasmic2014], and [@matsuzakiProtrudinServesAdaptor2011].  As these studies used distinct methods and model systems, we were most interested in the interactions that were conserved across sets.  After standardising the data across sources, we found 46 protrudin-interacting proteins that were identified in at least two studies.  Gene ontology analysis (biological process enrichment) of this set showed a high representation of proteins involved in vesicular transport, and in particular Golgi-related transport ('intra-Golgi vesicle mediated transport', 'Golgi vesicle transport', 'ER to Golgi vesicle-mediated transport', etc.) (figure \@ref(fig:proteomics-full-figure)).   In contrast to endosomal transport, protrudin's role in Golgi-related transport has not been extensively studied, and we decided to follow this up with further experiments.

\begin{figure}
\includegraphics{../figures/full/proteomics-full-figure-1} \caption[Data set comparison and gene ontology of conserved protrudin-interacting proteins]{A) Venn diagram showing overlap between published lists of protrudin-interacting proteins. B) Top 20 hits of GO biological process enrichment, of all proteins appearing in at least two protrudin interaction sets, sorted by p-value.}(\#fig:proteomics-full-figure)
\end{figure}

### HeLa screen for changes in organelle and protein distribution

When protrudin is overexpressed in HeLa cells, it drives the growth of long cellular protrusions that superficially resemble developing neurites [@shiraneProtrudinInducesNeurite2006].  While these cells are genetically and functionally very distinct from neurons, this nevertheless provides a useful model system for examining protrudin's interactions with other cellular components.  We used this system to screen for proteins that colocalise with protrudin in these cellular outgrowths, to quickly identify organelles or complexes that might be transported into axons when protrudin is overexpressed in neurons.

Based on the results of our gene ontology analysis, we selected a panel of antibodies to screen for colocalisation with protrudin in HeLa cells.  These were primarily focused on components of the ER exit site to Golgi secretory pathway, but also included proteins involved in lipid metabolism, signalling, and amino acid transport.


Table: (\#tab:unnamed-chunk-1)Markers for HeLa screen.

|Marker                  |Description                   |
|:-----------------------|:-----------------------------|
|BCAP31                  |ER chaperone                  |
|SURF4                   |ERES cargo loading            |
|MIA3 (TANGO1)           |ERES cargo loading            |
|SEC31A                  |COPII coat component          |
|ERGIC53                 |ERGIC marker                  |
|GS28                    |Golgi SNARE                   |
|GLG1                    |Golgi glycoprotein            |
|USO1 (p115)             |ER to Golgi vesicle targeting |
|LAMP1                   |lysosome marker               |
|mTOR                    |signalling kinase             |
|ACSL3                   |fatty acid metabolism         |
|SLC38A1                 |glutamine uptake transporter  |
|LC3                     |autophagosome marker          |
|BODIPY TR C~5~ ceramide |ceramide lipid dye            |

#### ER- and Golgi-related organelles

Of the ERES-related proteins, different markers showed different levels of colocalisation with protrudin.  BCAP31 and SURF4 were consistently enriched in cellular protrusions, more so than at other areas of the cell periphery.  MIA3 and SEC31A colocalised well with protrudin in the perinuclear area, but were found at lower levels in protrusions, and were less consistent between cells.  At this stage, it was not possible to conclusively say whether these variations represented differences in how ERES proteins were transported or in how effectively the individual antibodies stained these components, so we decided to proceed with BCAP31 and SURF4, which produced more clear results. (Figure \@ref(fig:HeLa-ERES-grid-full-figure))

\begin{figure}
\includegraphics{../figures/full/HeLa-ERES-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for BCAP31, SURF4, MIA3, and SEC31A]{Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained for ER/ERES-related markers A) BCAP31, B) SURF4, C) MIA3(TANGO1), and D) SEC31A.  All scale bars are 20\textmu{}m.}(\#fig:HeLa-ERES-grid-full-figure)
\end{figure}

Of the Golgi-related proteins, GS28, GLG1, and USO1 clearly labelled the perinuclear Golgi compartment, but were either entirely absent or found only at very low levels in protrusions.  ERGIC53, on the other hand, was highly enriched in protrusions, in most cases well above the levels seen in the cell body.  This was the strongest concentration with any of the markers used in this screen, and point to the ERGIC compartment not only colocalising with protrudin, but specifically playing a role in the growth of cellular protrusions.  This marker was added to the set (along with BCAP31 and SURF4) to examine in neurons.  (Figure \@ref(fig:HeLa-Golgi-grid-full-figure))

\begin{figure}
\includegraphics{../figures/full/HeLa-Golgi-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for ERGIC53, GS28, GLG1, and USO1]{Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained for ERGIC and Golgi-related markers A) ERGIC53, B) GS28, C) GLG1, and D) USO1(p115)  E) Close up of ERGIC53 staining in the protrusion of a cell expressing WT protrudin, as shown in panel A.  F) Fluorescence profile along the protrusion shown in panel E.  All scale bars are 20\textmu{}m.}(\#fig:HeLa-Golgi-grid-full-figure)
\end{figure}

#### Lysosomes, enzymes, and transporters

LAMP1 and mTOR, which we expected to move to the cell periphery in response to protrudin overexpression, were present in protrusions at relatively low levels.  While protrudin overexpression did result in more puncta away from the perinuclear cluster, this effect was not especially dramatic, and the highest concentrations were still found near the cell nucleus.  This is in contrast with [@hongPtdIns3PControlsMTORC12017], which found a stronger movement away from the nucleus when overexpressing Myc-tagged protrudin.  However, their culture protocol differed from ours in adding 2mM supplemental glutamine to the culture media, so the apparent differences could reflect the amino acid dependence of the protrudin-FYCO1 transport mechanism.  (Figure \@ref(fig:HeLa-misc-grid-full-figure), panels A-B)

ACSL3 was found in cellular protrusions, but — similar to MIA3 and SEC31A — was generally at low levels, and varied considerably between cells.  This may reflect on the antibody used, or may represent more complicated cell-state dependent interaction with other metabolic pathways.  This was not taken forwards.  (Figure \@ref(fig:HeLa-misc-grid-full-figure), panel C)

Finally, SLC38A1 was found to concentrate in protrusions, and similarly to ERGIC53 was found at higher levels here than near the nucleus.  This result is particularly interesting, as SLC38A1 is a potential cargo of the local secretory pathway.  Matsuzaki et al. identified SLC38A1 in their set of protrudin-interacting proteins, and Shigeoka et al. showed that it was locally translated in RGC axons [@matsuzakiProtrudinServesAdaptor2011; @shigeokaDynamicAxonalTranslation2016]. SLC38A1 was added to the list with BCAP31, SURF4, and ERGIC53 to examine in neurons.  (Figure \@ref(fig:HeLa-misc-grid-full-figure), panel D)

\begin{figure}
\includegraphics{../figures/full/HeLa-misc-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for LAMP1, mTOR, ACSL3, and SLC38A1]{Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained  for A) LAMP1, B) mTOR, C) ACSL3, and D) SLC38A1.  All scale bars are 20\textmu{}m.}(\#fig:HeLa-misc-grid-full-figure)
\end{figure}

#### Other morphological changes

In addition to protrusions, we noted that protrudin overexpression also induces the formation of large, ring-shaped structures in the perinuclear region of HeLa cells.  These are observed occasionally in neurons expressing protrudin, but not to the same extent as in HeLa cells.  While these were not the primary focus of this experiment, they did reveal interesting results with two of the markers screened, and may indicate protrudin involvement in additional cellular pathways.

LC3 strongly colocalised with protrudin in these structures, suggesting that they may represent phagophores or autophagosomes (figure \@ref(fig:LC3-full-figure)).  Notably, LC3 is *not* enriched in cellular protrusions (panel C), in contrast to the markers discussed above.  This may represent a different pathway activated by protrudin overexpression.  These LC3-labelled structures are also smaller and less abundant in cells expressing only EGFP, suggesting that their formation is influenced by protrudin overexpression.

We followed up this result with a pilot experiment in neurons, co-expressing EGFP-protrudin and mRFP1-tagged LC3.  LC3 showed differences in localisation between cells, ranging from fully cytoplasmic to fully punctate, which likely reflects the conversion between soluble LC3-I and membrane-associated LC3-II [@kabeyaLC3MammalianHomologue2000].  All cells expressing either WT or active protrudin contained at least some LC3 puncta, in contrast to control cells, of which 12.5% had fully cytoplasmic LC3.  This suggests that protrudin might be encouraging autophagosome biogenesis, although further experiments are needed to confirm this result.

\begin{figure}
\includegraphics{../figures/full/LC3-full-figure-1} \caption[Protrudin effect on LC3 localisation in HeLa cells and cortical neurons]{A) Representative image of HeLa cells expressing WT protrudin and stained for LC3.  Inset is 20x20\textmu{}m.  B) Fluorescence profile along the dotted line shown in panel A inset.  Note strong correspondence between protrudin (green) and LC3 (magenta) signal.  C) Protrusion of a HeLa cell expressing WT protrudin and stained for LC3.  Note the lack of LC3 enrichment with protrudin in the tip, compared to the cell body.  Scale bar is 20\textmu{}m.  D) Representative images of neurons expressing mRFP1-tagged LC3 showing range of distribution patterns.  Scale bars are 20\textmu{}m.  E) Quantification of LC3 distributions in cells co-expressing EGFP-protrudin and mRFP1-LC3.  n = 40 cells per condition across two independent batches.}(\#fig:LC3-full-figure)
\end{figure}

BODIPY C~5~ ceramide, a lipid dye often used to label the Golgi apparatus, strongly labelled the lumen of these organelles.   It is not clear in this context whether the dye is labelling Golgi-related structures or lipid droplets, however it is worth noting that other Golgi markers did *not* colocalise with these structures (e.g. figure \@ref(fig:HeLa-Golgi-grid-full-figure), particularly visible in panel C).  Given the relationship with LC3 as discussed above, this may indicate an increase in lipophagy, although further experiments would be needed to confirm this hypothesis.

\begin{figure}
\includegraphics{../figures/full/ceramide-full-figure-1} \caption[Protrudin effect on BODIPY C$\textsubscript{5}$ ceramide localisation in HeLa cells]{A) Representative image of HeLa cells expressing WT protrudin and stained with BODIPY C$\textsubscript{5}$ ceramide dye.  Inset is 20x20\textmu{}m.  B) Fluorescence profile along the dotted line shown in panel A inset.  Note BODIPY signal (magenta) between spikes of protrudin (green).}(\#fig:ceramide-full-figure)
\end{figure}

## Discussion

### Protrudin and dendritic spines

Protrudin overexpression — or inhibition through the expression of dominant negative mutants — did not substantially influence dendritic spine morphology. Considering the mechanism described in Pedersen et al. (in which protrudin-mediated cellular outgrowth is dependent on interaction with Rab7 and FYCO1), it seems likely that this is another result of the absence of FYCO1 in CNS neurons [@pedersenProtrudinmediatedEREndosome2020].  We cannot, however, rule out an effect on dendritic spine function, and more work would be required to understand whether protrudin overexpression may influence neuronal signalling.

### The ERES to Golgi pathway

In non-polarised cells, membrane proteins are typically translated in the ER, released from ERES, trafficked to the Golgi via the ERGIC compartment, and secreted in post-Golgi carriers.  In neurons, several alternate pathways exist, to account for the local translation needs of compartments distant from the cell body.  In dendrites, for example, Golgi outposts and satellites serve some of the same functions as the main Golgi apparatus, acting as local points for protein glycosylation [@mikhaylovaGS2016].  The ERGIC compartment is also involved in a Golgi-bypassing secretory pathway, which has been observed in dendrites [@bowenGolgiindependentSecretoryTrafficking2017].  

There is evidence for the local translation of integral membrane proteins in CNS axons [@shigeokaDynamicAxonalTranslation2016], although it is not currently understood how they are trafficked from the ER to the cell surface.  Recent work in DRG neurons has identified a non-conventional secretory pathway involving Golgi satellites and LAMP1-labelled organelles, which plays a role in the delivery of TRPM8 ion channels [@cornejoNonconventionalAxonalOrganelles2020].  It is possible that a similar pathway functions in CNS axons, providing a mechanism through which protrudin expression could promote secretion and growth in the absence of any changes to the cell body Golgi apparatus.  

It is worth noting that three of the four proteins identified in our HeLa screen — ERGIC53, SURF4, and BCAP31 — have been identified in the ERGIC compartment, although there is some indication that BCAP31 localisation varies by cell type [@breuzaProteomicsEndoplasmicReticulumGolgi2004; @quistgaardBAP31PhysiologicalFunctions2021].  This result suggests a novel role for this compartment in protrudin-driven protrusion formation, and potentially in axon regeneration, which is explored further in the next chapter.

<!--chapter:end:text/Chapter_2.Rmd-->


# ER, ERGIC, and Golgi in axons

Placeholder


## Introduction
### ER exit sites and COP vesicles
### The ER-Golgi intermediate compartment
### Golgi outposts and satellites
### Further processing and protein secretion
### The Golgi-bypass pathway
## Methods
### i3 neuron culture
### Immunochemistry
### Fluorescence quantification
### Inhibition of ER to Golgi transport
## Results
### ER-Golgi pathway localisation during development
### The role of protrudin in localisation and transport
#### BCAP31
#### SURF4
#### SLC38A1
#### ERGIC53
### Protrudin's effect on Golgi satellites
## Discussion

<!--chapter:end:text/Chapter_3.Rmd-->


# Discussion {.unnumbered #DISCUSSION}

Placeholder


## Conclusions
### Protrudin's role in axonal transport
### Protrudin's role in local translation
### A unifying site of action
## Future directions
### Autophagy
### Mitochondria
### Lipids

<!--chapter:end:text/Discussion.Rmd-->

# Supplementary Figures {.unnumbered #SUPPLEMENT}

```{=latex}
\markboth{SUPPLEMENT}{}
```



<!-- Note: won't render without Ch3. -->

\begin{figure}
\includegraphics{../figures/full/suppl-dev-grid-1} \caption[Supplementary figure; marker intensity in cell bodies and axon terminals of developing cortical neurons]{Fluorescence intensity of various markers in DIV3 vs DIV15 cortical neurons, divided into cell body or axon terminal.  All n=26 or 27 cells per condition across three batches, except SLC38A1 (n=18 cells, three batches).}(\#fig:suppl-dev-grid)
\end{figure}


# References {.unnumbered #BIB}
```{=latex}
\markboth{REFERENCES}{}
```

<!--chapter:end:text/Appendix.Rmd-->

