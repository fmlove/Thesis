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
    highlight: pygments
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

I would like to thank Jessica Kwok and Edward Avezov for their time and input in serving as my examiners.  I very much enjoyed discussing this project with them during my viva, and I am grateful for their recommendations, which have significantly improved this thesis.

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



(ref:AKT-footnote) AKT is not an acronym, and the origin of this term is not entirely clear [@xieWhatDoesAKT2020]


|Abbreviation       |Meaning                                                                     |
|:------------------|:---------------------------------------------------------------------------|
|AAV                |adeno-associated virus                                                      |
|ACSL3              |acyl-CoA synthetase long chain family member 3                              |
|ADP                |adenosine diphosphate                                                       |
|AKT                |AKT serine/threonine kinase; protein kinase B \footnote{(ref:AKT-footnote)} |
|ALS                |amyotrophic lateral sclerosis                                               |
|ANXA11             |annexin A11                                                                 |
|ARF6               |ADP ribosylation factor 6                                                   |
|ARL8B              |ADP ribosylation factor like GTPase 8B                                      |
|ARMCX1             |armadillo repeat containing X-linked 1                                      |
|ATF3               |activating transcription factor 3                                           |
|BCAP31             |B cell receptor associated protein 31; BAP31                                |
|BODIPY             |boron-dipyrromethene                                                        |
|BORC               |BLOC1-related complex                                                       |
|BSA                |bovine serum albumin                                                        |
|cAMP               |cyclic adenosine monophosphate                                              |
|CC                 |coiled-coil (protein motif)                                                 |
|CJUN               |cellular homolog of viral oncogene v-jun; c-Jun                             |
|CMV                |cytomegalovirus                                                             |
|CNS                |central nervous system                                                      |
|COPII              |coat protein complex II                                                     |
|DIV                |days in vitro                                                               |
|DRG                |dorsal root ganglion                                                        |
|EFA6               |exchange factor for ADP-ribosylation factor guanidine nucleotide factor 6   |
|EGFP               |enhanced green fluorescent protein                                          |
|ER                 |endoplasmic reticulum                                                       |
|ERES               |ER exit sites                                                               |
|ERGIC              |ER-Golgi intermediate compartment                                           |
|ERGIC53            |ERGIC protein 53 (homolog of p58); LMAN1                                    |
|ESCargo&nbsp;(FTV) |Erv29/SURF4-dependent secretory cargo with FTV export tripeptide            |
|FFAT               |two phenylalanines (FF) in an acidic tract (protein motif)                  |
|FYCO1              |FYVE and coiled-coil domain autophagy adaptor 1; ZFYVE7                     |
|FYVE               |FAB1 YOTB VAC1 EEA1 zinc finger domain (protein motif)                      |
|GABA               |gamma-aminobutyric acid                                                     |
|GAPDH              |glyceraldehyde-3-phosphate dehydrogenase                                    |
|GLG1               |Golgi glycoprotein 1                                                        |
|GM3                |monosialodihexosylganglioside                                               |
|GO                 |gene ontology                                                               |
|GS28               |28 KDa Golgi SNARE protein; GOSR1                                           |
|GTPase             |guanosine triphosphatase                                                    |
|HeLa               |human carcinoma cell line                                                   |
|HSP                |hereditary spastic paraplegia                                               |
|JIP3/4             |JNK-interacting proteins 3/4                                                |
|KIF5               |kinesin family member 5                                                     |
|KLF                |Kr&uuml;ppel-like factor                                                    |
|LAMP1              |lysosomal associated membrane protein 1                                     |
|LC3                |microtubule-associated protein 1A/1B light chain 3                          |
|LRRK2              |leucine rich repeat kinase 2                                                |
|MAG                |myelin-associated glycoprotein                                              |
|MCS                |membrane contact sites                                                      |
|MIA3               |melanoma inhibitory activity protein 3; TANGO1                              |
|MMP-9              |matrix metalloproteinase 9                                                  |
|mRFP               |monomeric red fluorescent protein                                           |
|mRNA               |messenger ribonucleic acid                                                  |
|mTOR               |mechanistic/mammalian target of rapamycin kinase                            |
|mTORC1             |mTOR complex 1                                                              |
|p115               |general vesicular transport factor p115; USO1                               |
|PBS                |phosphate-buffered saline                                                   |
|PC12               |rat pheochromocytoma cell line                                              |
|PCR                |polymerase chain reaction                                                   |
|PI3K               |phosphatidylinositol-3 kinase                                               |
|PIP                |phosphatidylinositol phosphate                                              |
|PKA                |protein kinase A                                                            |
|PM                 |plasma membrane                                                             |
|PNS                |peripheral nervous system                                                   |
|RAB11              |Ras-related protein Rab-11a                                                 |
|RAB7               |Ras-related protein Rab-7a                                                  |
|RBD                |RAB-binding domain                                                          |
|RBPMS              |RNA binding protein with multiple splicing (RGC marker)                     |
|RGC                |retinal ganglion cell                                                       |
|RILP               |RAB interacting lysosomal protein                                           |
|ROI                |region of interest                                                          |
|RTN3               |reticulon 3                                                                 |
|SAR1               |secretion associated Ras related GTPase 1                                   |
|SEC31A             |SEC31 homolog A, COPII coat complex component                               |
|shRNA              |short hairpin ribonucleic acid                                              |
|SKIP               |SifA and kinesin interacting protein; PLEKHM2                               |
|SLC38A1            |solute carrier family 38 member 1                                           |
|SOCS3              |suppressor of cytokine signalling 3                                         |
|ST3GAL5            |ST3 beta-galactoside alpha-2,3-sialyltransferase 5                          |
|SURF4              |surfeit locus protein 4                                                     |
|SYN                |synapsin                                                                    |
|TANGO1             |transport and Golgi organization protein 1 homolog; MIA3                    |
|TET1               |ten-eleven translocation 1 gene protein                                     |
|TIMP1              |TIMP metallopeptidase inhibitor 1                                           |
|TRPM8              |transient receptor potential cation channel subfamily M member 8            |
|USO1               |USO1 vesicle docking protein homolog; p115                                  |
|VAPA/B             |VAMP associated proteins A/B                                                |
|WT                 |wild type                                                                   |
|ZFYVE7             |zinc finger FYVE domain-containing protein 7; FYCO1                         |
|ZFYVE27            |zinc finger FYVE domain-containing protein 27; protrudin                    |

<!--chapter:end:text/Glossary.Rmd-->

---
output:
  pdf_document: 
    latex_engine: xelatex
  html_document: default
  word_document: default
bibliography: "C:/Users/fiona/Documents/GitHub/Thesis/bib/THESIS.bib"
always_allow_html: true
---

# Introduction {.unnumbered #INTRODUCTION}

```{=latex}
\markboth{INTRODUCTION}{}
```



## The challenge of CNS regeneration

One of the greatest challenges of modern medicine is how to promote regeneration of the central nervous system (CNS).  Compared to most other tissues and organs in the human body, the CNS has exceptionally low regenerative ability, largely due to the neurons' inability to reliably regrow injured axons.  As a result, damage to the CNS — whether through trauma, infection, or disease — often results in lifelong disability.  In contrast, the peripheral nervous system (PNS) is capable of substantial regeneration after injury, with severed nerves able to regrow several centimetres, reach their targets, and form functional connections, suggesting that regeneration of the CNS might be medically possible, if we can identify the relevant factors at play.  While there has been active research in this area for decades (if not centuries), we are still a long way from what most people would consider 'successful' regeneration of damaged CNS tissues — the regrowth of damaged neuronal processes, appropriate remodelling of the extracellular environment, and restoration of functional synaptic connections.  In this section, I will summarise our current understanding of some of the factors limiting CNS regeneration, as well as the particular challenges I have decided to address with this project.

### Glaucoma

Glaucoma is the leading cause of irreversible sight loss worldwide.  It is estimated that over 3.5% of the world population aged 40-80 is affected by glaucoma, which has an enormous impact on quality of life for millions of people [@thamGlobalPrevalenceGlaucoma2014].  While there are treatments that can slow or even halt the progression of this disease, they cannot reverse damage that has already occurred, and the typical progression of glaucoma — with sight loss beginning at the periphery — means that it is often diagnosed at a late stage.  Furthermore, a significant percentage of patients do not respond to the first line treatment drugs, so there is a continued need for improved therapies [@rossettiEvaluationRateNonresponders2006; @ikedaLatanoprostNonrespondersOpenangle2006].

The deterioration of vision in glaucoma is associated with both the loss of axons in the optic nerve — which conveys visual information from the eye to the brain — and with the loss of retinal ganglion cell (RGC) bodies in the retina.  While many approaches so far have targeted the damaging increase in intraocular pressure typically considered a hallmark of glaucoma, there are cases where RGC degeneration occurs despite normal pressure in the eye (normal tension glaucoma), and it is not entirely clear what drives the disease progression in these cases [@killerNormalTensionGlaucoma2018].  Therefore, it is important to develop therapies that can target the neurodegeneration directly, in addition to those aimed at lowering intraocular pressure to prevent RGC damage.  

This combination of axon damage and neurodegeneration makes glaucoma an ideal target for CNS regeneration research, as any successful treatments have immediate medical relevance, as well as the potential to apply more broadly to a range of other CNS conditions.  To this end, we have been working to identify new gene therapy targets that can prevent the loss of RGCs and promote regeneration of RGC axons that have already been damaged.  By delving into the biology of why CNS axons fail to regenerate and how we can change this, we hope to introduce a new class of therapeutics that can be used to treat not only glaucoma, but also the numerous other CNS diseases and injuries that cause axonal damage or loss.

\begin{figure}
\includegraphics{_main_files/figure-latex/glaucoma-schematic-1} \caption[Glaucoma schematic]{Schematic showing normal human eye anatomy (left), as well as the changes caused by glaucoma (right).  In the normal eye, visual signals are transduced by the axons of retinal ganglion cells, which follow the arrows in the figure from the retina to the brain through the optic nerve.  In glaucoma, these signals are disrupted as axons in the optic nerve are damaged.}(\#fig:glaucoma-schematic)
\end{figure}

## Factors limiting CNS regeneration

The question of why CNS axons fail to regenerate after injury is a complex one, and our current understanding points to a wide range of both extrinsic and intrinsic factors, which interact to limit regrowth.^[Note that this regeneration is distinct from — but closely related to — *functional* recovery, which can result from reorganisation of surviving neuronal circuits after injury in the absence of any axonal regeneration.  The central nervous system is exceptionally flexible, and significant functional recovery can be achieved after, for example, spinal cord injury, in the case of an incomplete injury and intensive rehabilitation.  However, this plasticity can be significantly enhanced by even limited axonal regeneration, if regrowing axons can bridge the site of an injury and create new connections between cells, even if the axon fails to regrow as far as its original targets.  In this thesis I will be focusing on survival and regrowth of damaged axons, as opposed to functional recovery after a CNS injury or disease.]

### Extrinsic factors

In 1980, Peter Richardson and colleagues at McGill showed that axons in a severed rat spinal cord could regenerate into an implanted sciatic nerve graft, thus demonstrating that CNS neurons were at least somewhat capable of regeneration, but were inhibited by their environment [@richardsonAxonsCNSNeurones1980].  Since then, researchers have identified a variety of environmental factors that limit CNS axon growth, ranging from differences in the cellular composition of PNS and CNS tissues, to changes in the extracellular environment and cell surface receptors that occur during development as the tissue matures.

#### Extraellular matrix

The extracellular environment of the mature central nervous system is unique from other tissues, and contains a number of chemicals that are known to be inhibitory to axonal growth, either mechanically or biochemically.  The composition of this environment changes during development, and becomes increasingly hostile to neurite growth as the CNS matures [@shewanExtensiveRegenerationVitro1995].  Many of these changes — in particular the secretion of perineuronal nets, matrix structures which surround certain types of neuron in the CNS — play an important role in stabilising and supporting synapses, and signal a change in CNS state from supporting growth to supporting electrical signalling [@kwokExtracellularMatrixPerineuronal2011; @fawcettRolesPerineuronalNets2019].  These developmental events also result in changes in the mechanical properties of CNS tissue, which can inhibit normal axon growth even in the absence of biochemical cues [@koserMechanosensingCriticalAxon2016].

Given this substantial impact on neurite growth, numerous therapies tageting the extracellular matrix have been tested to promote regeneration after spinal cord and other CNS injuries, with mixed results.  It is now widely accepted that targeting inhibitory molecules in the extracellular matrix — either by enzymatic breakdown, as in the case of chondroitinase ABC, or by inhibiting synthesis, for example with 4-methylumbelliferone — can permit short-range regeneration and enhance neuronal plasticity [@bradburyChondroitinaseABCPromotes2002; @irvine4methylumbelliferoneEnhancesNeuroplasticity2023].  These treatments have led to moderate restoration of function in some models of spinal cord injury, often through the reorganisation of local neuronal networks following an incomplete injury.  However, robust long-range axonal regeneration — past the site of injury and back to their original downstream targets — remains elusive [reviewed in @kwokExtracellularMatrixPerineuronal2011; @muirRecentAdvancesTherapeutic2019].

#### Cellular environment

Axonal regeneration, or its failure, is significantly influenced by surrounding non-neuronal cells.  In most cases, glia make up the vast majority of these cells, but in the case of traumatic injury to the CNS circulating immune cells can also play an important role.

##### Glia

One of the most obvious tissue-level differences between the CNS and the PNS is the type of glial cells present.  PNS axons are myelinated by Schwann cells, while in the CNS oligodendrocytes carry out the same role.  These cells have significantly different structures, and respond differently to injury.  Following an axonal injury, Schwann cells transform to exhibit a regeneration-promoting phenotype. In this state, they actively participate in clearing myelin debris, form a scaffold for axonal regrowth, and release exosomes containing growth-promoting factors [reviewed in @jessenRepairSchwannCell2016]. In contrast, oligodendroytes that survive an axonal injury in the CNS are largely quiescent, and do not appear to support axon repair in the same way [@ludwinOligodendrocyteSurvivalWallerian1990].  On the contrary, the myelin debris from damaged oligodendrocytes, both lipids and proteins, and in particular myelin-associated glycoprotein (MAG), are inhibitory to axon growth, and can contribute to inflammation following an injury to the CNS [@marMyelinLipidsInhibit2016; @mukhopadhyayNovelRoleMyelinassociated1994; @mckerracherIdentificationMyelinassociatedGlycoprotein1994].

##### Inflammation

In normal circumstances, microglia act as the primary immune cells of the central nervous system, while other immune cells are excluded by the blood-brain or blood-spinal cord barrier.  However, in the case of injury — or certain degenerative conditions, such as multiple sclerosis — circulating immune cells can infiltrate the CNS, causing significant inflammation [reviewed in @hellenbrandInflammationSpinalCord2021; @freyermuth-trujilloInflammationTargetTreatment2022; @grajchenPhysiologyFoamyPhagocytes2018].  While some transient inflammation appears to be important for clearing tissue debris and subsequent repair, this process commonly becomes dysregulated, and unresolved inflammation is a significant contributor to the secondary injury cascade seen after traumatic brain or spinal cord injury.  While the inflammatory changes that occur following CNS injury are highly complex and dynamic, this is an active area of research, and some studies have suggested that anti-inflammatory treatments could promote axon regeneration [@fuNonsteroidalAntiInflammatoryDrugs2007; @parkLocalImmunomodulationAntiinflammatory2018].

#### Synapses — a bridge between extrinsic and intrinsic factors

Recent work has increasingly pointed to the formation of synapses as a key point at which developing CNS neurons lose their intrinsic capacity to regenerate.   During this process, interactions with the external cellular environment trigger internal changes that encourage signalling function at the expense of inhibiting growth.  For example, Tedeschi et al. showed that a voltage-gated calcium channel subunit prevents axon growth, and that inhibiting the channel can promote regeneration *in vivo* [@tedeschiCalciumChannelSubunit2016].  Hilton et al. found a similar effect with presynaptic vesicle-tethering proteins, and also found that cells that were capable of regeneration down-regulated these proteins during axon growth [@hiltonActiveVesiclePriming2022].  These results suggest that the cellular requirements to support synaptic signalling might be at odds with the mechanisms needed to support axonal growth, and that changing a neuron's interactions with external partners might be a necessary step in promoting regeneration through internal mechanisms.

### Intrinsic factors

In addition to extrinsic factors, developmental changes *within* neurons also present a barrier to CNS regeneration.  As the cells mature from a growth-permissive state into synaptically active neurons, they undergo structural and functional changes that correlate with the loss of regenerative ability [@kosekiSelectiveRab11Transport2017].  Additionally, many neurodegenerative diseases are associated with genetic or molecular dysfunction within neurons, as opposed to the extracellular environment, highlighting the importance of internal factors in maintaining healthy, functional axons.  Understanding and addressing these intrinsic sources of dysfunction and barriers to regeneration is essential to developing successful therapies to protect and repair CNS axons.

#### Cytoskeletal regulation of axon growth

Neurons undergo dramatic morphological changes during development, eventually forming extremely long, thin, and complex structures that, in many cases, must be carefully maintained for the entire lifetime of the organism.  To make this possible, mature neurons have a dynamic but highly regulated cytoskeleton, particularly in the axon.  However, the structural requirements of the mature, signal-carrying axon are very different from a growing axon, and in the case of axon injury this can prevent successful regeneration.   

A key feature of the mature neuronal cytoskeleton is the bundle of polarised microtubules that forms the backbone of the axon.  This structure is maintained by proteins such as EFA6, which truncates growing microtubules that leave the bundle to reach the axon periphery.  However, this can also inhibit axon outgrowth, which might limit regeneration [@quEfa6ProtectsAxons2019].

This microtubule structure, and by extension the structure of the axon, is also maintained by a repeated pattern of actin rings arranged at intervals around the circumference of the axon [@xuActinSpectrinAssociated2013; @quPeriodicActinStructures2017].  In addition to stabilising the microtubule bundle, recent evidence shows that these rings can expand and contract, playing a role in the regulation and speed of axonal transport [@wangRadialContractilityActomyosin2020].

At the axon tip, a delicate balance of microtubule polymerisation and stabilisation promotes forward extension of the growth cone and axon elongation during development.  This can be partially restored in mature axons with the addition of microtubule-stabilising drugs, but the effect is highly dose-dependent, with higher doses instead inhibiting axon growth [reviewed in @blanquieCytoskeletonDynamicsAxon2018].  There is also a complex interaction between these growing microtubules and the actin filaments that define the structure of the growth cone periphery.  Actin filaments in the growth cone are constantly polymerising, being pulled towards the center of the growth cone, and depolymerising, in a process that is dynamically regulated to limit growth speed and allow the growth cone to change direction in response to environmental cues [reviewed in @leiteActinDynamicsGrowth2021].  Inhibiting proteins involved in this retrograde flow of actin filaments has been shown to increase axon growth even in the presence of otherwise inhibitory cues [@hurEngineeringNeuronalGrowth2011; @yuMyosinIIActivity2012].

#### Growth-related signalling

The internal changes that occur during neuronal maturation are regulated by distinct signalling pathways.  Several of these have been associated with the loss of regenerative ability, and have been targeted to increase axon regeneration.

##### PTEN and mTOR

One of the most-studied signalling pathways in the context of CNS repair is the PI3K/AKT/mTOR pathway.  The levels of PIP~3~, an important signalling lipid, are developmentally regulated in neurons [@nieuwenhuisPI3kinaseDelta2020].  PIP~3~ is produced from PIP~2~ by PI3K, while the reverse reaction is catalysed by PTEN.  During growth, a balance of both enzymes maintains sufficient PIP~3~ levels to promote growth via AKT kinase and downstream targets such as mTOR.  As neurons mature, however, expression levels of PI3K decline.  The result is a decline in PIP~3~, and subsequent decrease in AKT signalling.  Restoring PIP~3~ levels in mature neurons, either through PTEN deletion or PI3K expression, can strongly promote axon regeneration [@parkPromotingAxonRegeneration2008; @nieuwenhuisPI3kinaseDelta2020;&nbsp;reviewed in @nieuwenhuisPromotingAxonRegeneration2022].

##### Other signalling pathways

Numerous other pathways have also been implicated in the failure of regeneration in the CNS.  Smith et al. found that SOCS3 — a negative regulator of cytokine signalling — inhibited axon regeneration in mouse RGCs by blocking responses to external growth factors, and that deleting SOCS3 promoted regeneration [@smithSOCS3DeletionPromotes2009].  Qiu et al. showed that DRG regeneration into the CNS following a conditioning lesion was dependent on cAMP and PKA to overcome inhibitory signals from the extracellular environment [@qiuSpinalAxonRegeneration2002].  These pathways all overlap or interact to some degree, but it is still unclear how they may be differentially regulated in the case of axonal injury, or if this varies across cell types.

#### Epigenetic and transcriptional regulation of regeneration

Dorsal root ganglia (DRG) neurons are unique in that they extend axons into both the peripheral and central nervous systems from their location just outside the spinal cord.  As peripheral neurons they have the intrinsic capacity for axonal regeneration, although this is usually only successful in the peripheral branch, due to the inhibitory extracellular environment of the spinal cord.  However, their regenerative capacity into the CNS is vastly enhanced by a prior injury to the peripheral axon, known as a conditioning lesion.  Changes in gene expression and regulation that occur in the weeks following a peripheral lesion can allow these cells to regenerate through the inhibitory environment of a spinal cord injury, raising the possibility that similar changes could convey similar capacity in neurons of the CNS [@neumannRegenerationDorsalColumn1999].  

This conditioning lesion phenomenon has provided an invaluable model for identifying epigenetic and transcriptomic changes that permit PNS regeneration but are normally lacking in the CNS.  For example, Puttagunta et al. found that histone modification was essential for the conditioning lesion effect, and activated signalling cascades to promote axonal growth [@puttaguntaPCAFdependentEpigeneticChanges2014].  Weng et al. found that DRG neurons upregulate TET3 after axon injury, which in turn demethylates DNA and allows the activation of regeneration-associated genes.  They also found that the regeneration induced by PTEN deletion in RGCs was dependent on TET1, a similar protein [@wengIntrinsicEpigeneticBarrier2017].  These studies highlight that chromatin accessibility and DNA modification are limiting factors associated with regenerative ability.  

Other work has identified transcription factors that may play a role in axon regeneration [reviewed in @mooreMultipleTranscriptionFactor2011].  Moore et al. suggest that different members of the KLF family of transcription factors differentially regulate the regenerative capacity of RGCs, while Ewan et al. pointed to ATF3 and CJUN as key regulators [@mooreKLFFamilyMembers2009; @ewanAscendingDorsalColumn2021].  This is by no means an exhaustive list, and a significant amount of work is ongoing in this area to identify transcription factors that can be targeted to promote regeneration, particularly in combination with therapies that address chromatin accessibility [reviewed in @wahaneEpigeneticRegulationAxon2019].  

#### Changes in axonal transport with development

After synapse formation, axons undergo dramatic changes in transport, as growth machinery is excluded from the axon in favour of synapse components and synaptic vesicle precursors.  This results in decreased transport of some essential organelles, which can inhibit survival and regrowth in the case of injury.

##### Recycling endosomes

Among the organelles excluded from mature axons are recycling endosomes, which are marked with a small GTPase called RAB11.  RAB11 endosomes play a key role in recycling internalised receptors back to the plasma membrane, but they also play a role in transporting cargo into axons [@kosekiSelectiveRab11Transport2017].  One such cargo is integrins, which are essential for focal adhesion formation and involved with both developmental and regenerative axonal growth.  In DRG neurons in the PNS, integrin \textalpha{}9 can promote axon regeneration even into the inhibitory environment of the spinal cord [@cheahExpressionActivatedIntegrin2016].  However, integrins are excluded from mature CNS axons by another recycling endosome small GTPase called ARF6, in combination with its activator EFA6.  Inhibiting EFA6 allows integrins into the axon and promotes regeneration after axotomy *in vitro*, but it remains to be seen whether this approach is effective *in vivo* [@evaEFA6RegulatesSelective2017].

##### Mitochondria

Similar changes in mitochondrial motility have been identified.  Lewis et al. found that mitochondrial motility decreased with axon maturation in mouse cortical neurons, and mature mitochondria were often stationary near presynapses  [@lewisProgressiveDecreaseMitochondrial2016].   Sainath et al. found that chondroitin sulphate proteoglycans — potent inhibitors of axon regeneration — prevented mitochondria from reaching the growth cones of regenerating DRG neurons [@sainathChondroitinSulfateProteoglycans2017].  Other studies linked this change even more directly to axon regeneration, showing that artificially enhancing mitochondrial motility by either reducing the anchor protein syntaphilin or overexpressing transport-regulating ARMCX1 could boost regeneration after axon injury [@zhouFacilitationAxonRegeneration2016; @cartoniMammalianSpecificProteinArmcx12016].  

#### The virtuous cycle of axon growth

Many of these intrinsic factors interact in what has been described as the 'virtuous cycle of axon growth' [@petrovaVirtuousCycleAxon2018].  Axonal growth is sustained by a cycle in which activated axonal growth factor receptors trigger transcriptional and signalling cascades through retrograde transport to the cell body.  These in turn can result in the translation and subsequent delivery of more receptors and growth machinery, which allow the cell to respond more effectively to growth cues in the extracellular environment.  As the cell matures, changes in axon transport lead to lower levels of growth factor receptors in the distal axon, and the cycle stops.  By targeting any stage of this cycle — axon transport, signalling, transcription, or translation — it should be possible to effectively restart the cycle and promote regeneration.

In summary, cytoskeletal organisation, signalling pathways, epigenetic and transcriptional regulation, and organelle transport have all been identified as key intrinsic barriers to axonal regeneration.  The virtuous cycle theory highlights links between these systems, and suggests that growth-promoting interventions have the potential to feed forward to dramatically enhance axonal regeneration.

## Protrudin {#intro-ptdn}

Protrudin is an interesting protein in the context of axon regeneration because it sits at the nexus of several of these intrinsic systems that can prevent or promote regeneration.  As a result, targeting protrudin has the potential to substantially influence a neuron's regenerative capacity by synergistically acting on multiple different pathways.

### Structure and localisation

\begin{figure}
\includegraphics{_main_files/figure-latex/ptdn-schematic-1} \caption[Protrudin schematic]{Schematic of protrudin embedded in the ER membrane, showing RBD (RAB binding domain), transmembrane domains, FFAT motif (two phenylalanines in an acidic tract), CC motif (coiled-coil), and FYVE domain (FAB1 YOTB VAC1 EEA1 zinc finger domain).  The ER lumen is to the bottom of the image.}(\#fig:ptdn-schematic)
\end{figure}

Protrudin is a transmembrane ER protein.  It contains an intramembrane hairpin loop, which restricts its localisation to tubular domains of the ER, where it contributes to shaping and maintaining membrane curvature [@hashimotoProtrudinRegulatesEndoplasmic2014].  This loop is also required for protrudin oligomerisation — functional protrudin forms homodimers or tetramers, although how this contributes to its function is not well understood [@pantakaniOligomerizationZFYVE27Protrudin2011].  Protrudin also contains an array of binding domains exposed to the cytoplasm, which include a RAB-binding domain (RBD), an FFAT domain, which interacts with VAPA/B at ER contact sites, a coiled-coil (CC) domain, which binds kinesin, and a FYVE domain, which interacts with phospholipids.  There is also a predicted low-complexity region between the hairpin and CC domains, which has been shown to mediate interaction with RAB7 [@raiborgRepeatedEREndosome2015].

### Cellular outgrowth, migration, and invasion

Protrudin, otherwise known as ZFYVE27, is so named because its overexpression induces the growth of long cellular protrusions in HeLa cells, which are non-neuronal cells derived from an epithelial tumour [@shiraneProtrudinInducesNeurite2006].  Subsequent work has shown similar effects on a number of cell types [@zhangRoleSpastinProtrudin2012], and indicated a role for protrudin in outgrowth-dependent processes, such as migration and cancer cell invasion [@aroraProtrudinRegulatesFAK2022; @pedersenProtrudinmediatedEREndosome2020].  However, the underlying mechanisms of these effects are not fully understood, and there are a number of potential pathways that could contribute.

### Transport{#intro-ptdn-transport}

Protrudin contains a kinesin binding site, indicating a role in mediating motor protein-mediated transport.  In particular, this would promote plus-end directed transport, which is essential for delivering cargo into the long axons of CNS neurons.  Matsuzaki et al. studied this in some depth, and found that protrudin's outgrowth-promoting effect in HeLa cells is attenuated if KIF5 is inhibited, and increased if KIF5 is also overexpressed [@matsuzakiProtrudinServesAdaptor2011].  They found evidence for direct protrudin-KIF5 interaction in mouse brains, and identified protrudin as the KIF5 adaptor for SURF4, RAB11, VAPA/B, and RTN3.  As these proteins are essential for ER function, contact site formation, protein transport, and a number of other processes, this suggests that, even at the low levels found endogenously in CNS neurons [@kosekiSelectiveRab11Transport2017; @petrovaProtrudinFunctionsEndoplasmic2020], protrudin might play an important role in normal axonal function.

The study by Petrova et al. [@petrovaProtrudinFunctionsEndoplasmic2020], which I contributed to during the first year of my PhD, looked at protrudin specifically in the context of integrin transport.  In particular, integrins \textalpha{}9 and \textbeta{}1, which are capable of promoting axon growth in the mature spinal cord [@cheahExpressionActivatedIntegrin2016], are cargo of RAB11 endosomes [@evaRab11ItsEffector2010].  We found that protrudin overexpression had a small effect on developmental neurite outgrowth, but strongly promoted axon regrowth after axotomy *in vitro*.  In addition, protrudin prevented retinal ganglion cell death after an axon crush injury *in vivo*, and allowed axons to regrow past the injury site.  I discuss this result further in Chapter 1, section \@ref(protrudin-ONC).

In contrast to our work on RAB11 and recycling endosomes, Raiborg et al. looked at protrudin's effect on the transport of late endosomes, marked by the small GTPase RAB7.  Using PC12 cells, which are derived from a neuroendocrine tumour,  they found that protrudin *indirectly* promoted late endosome transport, forming transient ER-late endosome contacts at which a separate adaptor, FYCO1 (ZFYVE7), was able to bind RAB7 and KIF5 to move late endosomes down the axon [@raiborgRepeatedEREndosome2015].

### ER contact sites

Other studies have indicated a direct role for protrudin at ER-organelle membrane contact sites (MCS).  Protrudin interacts with VAPA/B, key tethers at many MCS [@saitaPromotionNeuriteExtension2009; @matsuzakiProtrudinServesAdaptor2011; @hashimotoProtrudinRegulatesEndoplasmic2014; @elbaz-alonPDZD8InteractsProtrudin2020].  It may also act at ER-mitochondrial contact sites, which are important for axonal function and growth [@elbaz-alonPDZD8InteractsProtrudin2020; @leeIncreasedERMitochondria2019], and may be disrupted in neurodegenerative disease [reviewed in @bernard-marissalEndoplasmicReticulumMitochondria2018].  In addition, protrudin itself has been shown to act as a tether at ER-endosome contact sites, as it contains a phosphoinositide-binding FYVE domain, as well as several motifs that can bind RAB proteins [@raiborgRepeatedEREndosome2015].  It may also play a role in ER-plasma membrane contacts, as protrudin contains a non-canonical FYVE domain that interacts more strongly with PM lipids than those more abundant on endosomes [@gilPhosphoinositidesDifferentiallyRegulate2012].  

### Axonal ER{#intro-ptdn-axonalER}

The axonal ER is typically comprised of only a few very narrow tubules, but is essential for normal axonal function [@terasakiAxonalEndoplasmicReticulum2018].  As protrudin localises to tubular ER, it can be found in the axon, although in mature neurons it is more abundant in the cell body and dendrites.  That being said, it does not appear to be actively excluded from the axon, and it readily moves into the axon when overexpressed [@petrovaProtrudinFunctionsEndoplasmic2020].  Protrudin is known to interact with a number of important axonal ER components, although it remains unclear what endogenous function protrudin has in this compartment.  

Protrudin contains a membrane hairpin domain, which is shared with other proteins that play a role in ER membrane shaping [@changProtrudinBindsAtlastins2013].  Several of these are implicated in hereditary spastic paraplegias (HSP), a group of axon degenerative diseases, which may stem from fragmentation of the axonal ER [@yalcinModelingAxonalEndoplasmic2017].  Protrudin itself has been considered an HSP gene [@mannanZFYVE27SPG33Novel2006], although there is some controversy in this area, and the 'mutation' involved may actually be a benign polymorphism [@martignoniRoleZFYVE27Protrudin2008].  However, protrudin does interact with spastin, atlastin, and other HSP proteins, so it may still play a role in these conditions [@changProtrudinBindsAtlastins2013].  

While dysfunction of these ER-shaping proteins can lead to axonal degeneration, their function is also required for axon regeneration, where they appear to concentrate ER tubules near the growing tip [@raoSpastinAtlastinER2016].  Protrudin may act in the same way, as Petrova et al. found that protrudin increases the amount of ER in growth cones [@petrovaProtrudinFunctionsEndoplasmic2020].  However, while these studies demonstrate that the axonal ER is involved in axon regeneration, it is not currently clear what functions it provides in this context.

The axonal ER also acts as a local calcium store, and its capacity is regulated by membrane shaping proteins via tubule diameter.  Protrudin may act in the same way, although it is unclear how this may or may not contribute to protrudin's regenerative function, as different ER-shaping proteins have been shown to have opposing effects on axon regeneration [@konnoEndoplasmicReticulumMorphological2021; @alhajlahOverexpressionReticulonEnhances2021].

### Previous work on protrudin

With these diverse roles across numerous cellular functions, protrudin could be influencing neuronal survival and regeneration through several different mechanisms.  Our lab has been working with protrudin for some time now, having initially become interested in the protein in the context of integrin transport.  This led to the publication of a paper which I contributed to [@petrovaProtrudinFunctionsEndoplasmic2020], some of which is presented in section \@ref(protrudin-ONC).

That paper presented a number of key findings, which I have built upon over the course of this project.  The foremost of these is that protrudin overexpression has a striking effect on neuronal survival and regeneration after axon injury.  

## Aims of this project{#intro-aims}

My initial aim in starting this project was to further examine the effect of protrudin on *in vivo* CNS injury, with the intent of developing it towards a translational gene therapy.  Unfortunately, the 2020 coronavirus pandemic and associated disruption necessitated a dramatic change in direction.  Since then, I have focused on understanding which cellular pathways contribute to protrudin's beneficial effects on CNS regeneration.  By understanding how protrudin functions in neurons, we might be able to enhance its performance or identify new therapeutic candidates in the same cellular pathways.  This is primarily intended to inform the translation of protrudin as a gene therapy for neurodegenerative conditions and CNS injury, although it also lays the groundwork for future research into the cell biology of axon regeneration in the CNS.

<!--chapter:end:text/Intro.Rmd-->

---
output:
  word_document: default
  html_document: default
  pdf_document: default
bibliography: "C:/Users/fiona/Documents/GitHub/Thesis/bib/THESIS.bib"
csl: "C:/Users/fiona/Documents/GitHub/Thesis/bib/plos.csl"
---
# Materials and Methods {.unnumbered #METHODS}

```{=latex}
\markboth{MATERIALS AND METHODS}{}
```



## Plasmids and antibodies


Table: (\#tab:plasmid-table)Plasmids used in this thesis.

|Promoter     |Gene                                               |Reporter      |
|:------------|:--------------------------------------------------|:-------------|
|CMV          |ARL8B&nbsp;(constitutively&nbsp;active)            |GFP           |
|CMV          |ARL8B&nbsp;(WT)                                    |GFP           |
|CAG          |EGFP                                               |&nbsp;-&nbsp; |
|hSYN         |EGFP                                               |&nbsp;-&nbsp; |
|SFFV/UbC     |EGFP/Emerald                                       |&nbsp;-&nbsp; |
|EF-1$\alpha$ |ESCargo&nbsp;(FTV)                                 |Crimson       |
|CMV          |FYCO1                                              |EGFP          |
|CMV          |LAMP1                                              |mNeonGreen    |
|CMV          |LAMP1                                              |mRFP1         |
|hSYN         |LAMP1                                              |mRFP1         |
|CMV          |LC3B                                               |mRFP1         |
|hSYN         |mCherry                                            |&nbsp;-&nbsp; |
|hSYN         |Myrlysin                                           |EGFP          |
|CMV          |Myrlysin                                           |Myc           |
|CAG          |Protrudin&nbsp;(active)                            |EGFP          |
|hSYN         |Protrudin&nbsp;(active)                            |EGFP          |
|hSYN         |Protrudin&nbsp;(active)                            |mCherry       |
|hSYN         |Protrudin&nbsp;(domain&nbsp;deletion&nbsp;mutants) |mCherry       |
|CAG          |Protrudin&nbsp;(WT)                                |EGFP          |
|hSYN         |Protrudin&nbsp;(WT)                                |EGFP          |
|hSYN         |Protrudin&nbsp;(WT)                                |mCherry       |
|UbC          |RAB7A                                              |mEmerald      |
|U6           |shRNA&nbsp;for&nbsp;calcyon&nbsp;(A-D)             |TurboGFP      |
|U6           |shRNA&nbsp;scrambled&nbsp;control                  |TurboGFP      |
|CMV          |SKIP                                               |EGFP          |
|CBh          |SKIP                                               |mNeonGreen    |
|hSYN         |ST3GAL5                                            |EGFP          |

The hSYN-LAMP1-mRFP1 plasmid was cloned for this project (section \@ref(cloning)).  The original LAMP1-mRFP1 plasmid *(#1817)*, along with LAMP1-mNeonGreen *(#98882)*,  ESCargo(FTV) *(#140162)* LC3B *(#21075)*, and RAB7A *(#115238)* were acquired from Addgene, with thanks to Walther Mothes [@sherer2003], Dorus Gadella [@chertkovaRobustBrightGenetically2020], Benjamin Glick [@caslerESC2020], Tamotsu Yoshimori [@kimura2007], and Pantelis Tsoulfas [@AddgeneEucaryoticExpression], respectively.  The FYCO1 plasmid was a gift from Terje Johansen [@pankivFYCO12010].  The ST3GAL5 plasmid was a gift from Marina Mikhaylova [@mikhaylovaGS2016].  SKIP-EGFP, myrlysin-myc, and ARL8B plasmids were a gift from Juan Bonifacino.  All shRNA constructs were purchased from Origene *(TG712969, TR30013)*.  Plasmid maps are included in the Appendix, section \@ref(plasmid-maps).



Table: (\#tab:primary-table)Primary antibodies used in this thesis.

|Target        |Source                          |Dilution     |
|:-------------|:-------------------------------|:------------|
|BCAP31        |*Novus Biologicals, NBP2-75416* |1:100        |
|SURF4         |*Proteintech, 11599-1-AP*       |1:250--1:500 |
|MIA3 (TANGO1) |*Sigma-Aldrich, HPA055922-25UL* |1:100        |
|SEC31A        |*BD Biosciences, 612351*        |1:100        |
|ERGIC53 (p58) |*Sigma-Aldrich, E1031-200UL*    |1:100        |
|GS28          |*Proteintech, 16106-1-AP*       |1:100        |
|GLG1          |*Novis Biologicals, NBP1-90636* |1:150        |
|USO1 (p115)   |*Proteintech, 13509-1-AP*       |1:1000       |
|LAMP1         |*Abcam, ab24170*                |1:100        |
|mTOR          |*Thermo Fisher, A300-503A-M*    |1:50         |
|ACSL3         |*Proteintech, 20710-1-AP*       |1:50         |
|SLC38A1       |*Abcam, ab134268*               |1:100        |
|LC3           |*Proteintech, 14600-1-AP*       |1:250        |

Table: (\#tab:secondary-table)Secondary antibodies and dye conjugates used in this thesis.

|Name                                 |Source                            |Dilution |
|:------------------------------------|:---------------------------------|:--------|
|Goat anti-Rabbit IgG Alexa Fluor 568 |*Thermo Fisher,  A-11011*         |1:500    |
|Goat anti-Mouse IgG Alexa Fluor 568  |*Thermo Fisher,  A-11004*         |1:500    |
|Biotinylated Donkey anti-Rabbit      |*Amersham Biosciences, RPN1004V1* |1:500    |
|Streptavidin Alexa Fluor 568         |*Thermo Fisher, S11226*           |1:1000   |

## Software

Wherever possible, I tried to use free and open-source software throughout this project.  All image analysis tasks were carried out in Fiji [@schindelinFijiOpensourcePlatform2012].  Quantitative analysis and statistics were carried out in R [@Rlanguage]. FinchTV and Serial Cloner were used for reading DNA sequences and designing plasmids, respectively.  Plasmid maps were generated using AngularPlasmid [@chawdryAngularPlasmid].

### Code availability 

Custom R scripts and ImageJ macros were written for individual data collection and analysis tasks; these are included in the appendix (section \@ref(CODE)) and freely available to use.  In addition, the code used to generate this thesis, including data analysis, statistics, and figures, is available online at `https://github.com/fmlove/Thesis`.  

## Protocols

### Plasmid preparation{#plasmid-prep}

All plasmid preparation was carried out using either DH5\textalpha{} *(New England BioLabs, C2987I/H)* or XL10-Gold *(Agilent Technologies, 200314)* competent cells.  Cells were transformed using a heat shock protocol, and grown on LB/agar plates with an appropriate antibiotic for plasmid selection.  Single colonies were then scaled up in LB culture.  Plasmids were purified from *E. coli* cultures using Qiagen Spin Miniprep *(27104)* or EndoFree Plasmid Maxi kits *(12362)* according to the manufacturer's protocols.  All plasmids were dissolved in ultrapure DNAse-free water *(Thermo Fisher, 10977035)* for transfection.

### Cortical neuron cultures{#CNC}

Primary cortical neurons were obtained from embryonic day 18 Sprague Dawley rats. Cortices were dissected in HEPES-HBSS and dissociated with papain for approximately 5 minutes at 37°C, followed by DNAse treatment and trituration through a flame-polished glass pipette. Cells were filtered through a 40 \textmu{}m cell strainer *(Falcon, 352340)* and plated at a density of 200,000-400,000 cells per imaging plate *(Greiner Bio-One, 627860)* or 50,000-100,000 cells per acid-washed glass coverslip (13 mm diameter). (Plates and coverslips were coated with 50 \textmu{}g/mL poly-D-lysine *(Sigma-Aldrich, P1149)* in borate buffer.)  Cells were grown in MACS Neuro Medium *(Miltenyi Biotec, 130-093-570)*, supplemented with NeuroBrew-21 *(Miltenyi Biotec, 130-093-566)*, GlutaMAX *(Thermo Fisher, 35050061)*, and ITS *(R&D Systems, AR013)* at 37°C with 7% CO~2~. 

The day of dissection was considered to be day zero, and further development measured by days *in vitro* (DIV).  The cells would typically begin to grow neurites within a day, exhibit clearly differentiated axons by DIV3, and demonstrate electrical maturity and significantly reduced regenerative ability by DIV16 [@kosekiSelectiveRab11Transport2017].

### Transfection

Cortical neurons were transfected at DIV10 by either magnetofection or calcium phosphate.  We experienced a significant drop in efficiency with the magnetofection reagent early in 2020, and subsequently switched to the calcium phosphate method.

Magnetofection was carried out using NeuroMag Transfection Reagent *(OZ Biosciences, NM51000)*. Briefly, plasmid DNA was incubated at room temperature with the NeuroMag Transfection Reagent in MACS Neuro Medium *(Miltenyi Biotec, 130-093-570)* for 30 minutes. Growth media was removed from the cells and replaced with warmed MACS Neuro Medium and the DNA-complexed NeuroMag Transfection Reagent. The cells were placed on a magnetic plate *(OZ Biosciences, MF10000)* in an incubator (37°C 7% CO~2~) for 30 minutes. The transfection mix was then removed from the cells and the growth media reapplied.

Calcium phosphate transfection was carried out using a protocol adapted from Jiang and Chen [@jiangHighCaPhosphate2006].  A solution of DNA and calcium chloride was prepared, and added dropwise to HEPES-buffered saline *(Sigma-Aldrich, 51558)* while vortexing to precipitate the DNA-calcium phosphate complex.  This was then added to the cells in supplement-free media, and incubated at 37°C 7% CO~2~ for one hour.  Cells were then washed with media pre-equilibrated in 10% CO~2~ to remove residual precipitate, and the original growth media reapplied.

### Immunocytochemistry{#immuno}

Cortical neurons were fixed using formaldehyde and sucrose, dissolved in PBS and mixed into the growth media to final concentrations of 3% formaldehyde and 10% sucrose.  HeLa cells were fixed in 3% formaldehyde in PBS.  In both cases, cells were fixed for 15 minutes at room temperature, followed by PBS washes and stored at 4°C.  

Cells were permeabilised with 0.2% saponin, used throughout the staining process, to preserve the localisation of membrane-associated proteins.  Dishes or coverslips were incubated at room temperature for 45 minutes in blocking buffer containing 3% BSA and 0.2% saponin.  Primary and secondary antibodies were diluted to the desired concentration in the same buffer and incubated for 1.5 hours each at room temperature, before being rinsed in PBS and stained with DAPI.  All samples were mounted with FluorSave reagent *(Calbiochem, 345789)* and left to dry for at least 24 hours before imaging.

Secondary-only controls were carried out for each combination of cell type and secondary antibody used throughout this project.  No significant non-specific staining was observed (data not shown).

### Microscopy

#### Live cells {#live-imaging}

Live imaging of axonal transport was carried out with spinning disc confocal microscopy, using an Olympus IX70 microscope and a PerkinElmer UltraVIEW scanner controlled with MetaMorph software.  For the data presented in figures \@ref(fig:LAMP1-full-figure) and \@ref(fig:RAB7-full-figure), a 100x objective with a numerical aperture of 1.35 *(Olympus,  1-UC836R)* was used.  For the data in figure \@ref(fig:ST3GAL5-full-figure), a 100x objective with a numerical aperture of 1.40 *(Olympus, 1-U2B836)* was used.  Each image was 512 x 512 pixels, with a pixel size of 0.16 x 0.16 \textmu{}m.  Confocal lateral resolution was 225 nm for LAMP1 experiments and 118 nm for RAB7 and ST3GAL5, according to the Gurdon Institute calculator [@ConfocalCalculator].  The microscope was enclosed and maintained at 37°C with supplemental CO~2~ during imaging^[The gas controller for this microscope did not provide a measurement of CO~2~, so we used the colour of phenol red in the growth media as an indicator when adjusting flow rate.  We estimate the final CO~2~ concentration during imaging to be between 5 and 10%.].  

For kymographs, the axons of DIV14-16 rat cortical neurons were imaged for approximately three minutes at least ~500 \textmu{}m from the cell body.  In most cases, cells were imaged at 2 frames per second, except where this was not possible due to the required exposure time.  Towards the end of this project, we identified a slight discrepancy between the frame rate set in MetaMorph and the actual rate of image acquisition, which appeared to be related to the microscope shutter speed.  To correct for this, a 'true' frame rate for each experiment was calculated based on individual image timestamps, and this value was then used for further calculations during data analysis (section \@ref(timestamp-corr)).

Stacks and axon ROIs were exported as STK and RGN files, respectively.  Due to time constraints during imaging, sometimes very rough ROIs were saved just to preserve the anterograde-retrograde direction of the axon in each image.  These were then re-traced from the axon images in ImageJ and saved as ROI files to provide an accurate trace of the axon for generating kymographs.

#### Fixed cells

Confocal imaging of fixed cells was carried out with a Leica DMI4000B confocal microscope, on a computer running LAS-AF software.  A 63x objective with a numerical aperture of 1.3 was used *(Leica, 11507900)*.  Confocal pinhole was 137.1 \textmu{}m.   Images were obtained as Z-stacks of 512 x 512 pixel images, with a pixel size of approximately 0.23 x 0.23 \textmu{}m and a step size of 0.29 \textmu{}m.  Scans were performed with bidirectional X and a zoom factor of 1.5.  For all experiments involving fluorescence quantification, secondary antibodies or streptavidin conjugated to Alexa Fluor 568 *(Thermo Fisher)* were used, giving a lateral resolution of 232 nm according to the Gurdon Institute calculator [@ConfocalCalculator].  3-frame averaging was used on the channels to be quantified.  

Occasionally, the spinning disc microscope described above was used for imaging fixed cells, with the 100x/1.35 objective and identical settings.  Step size was 0.29 \textmu{}m (for HeLa cell imaging) or 0.5 \textmu{}m (for dendritic spine imaging).

Epifluorescent imaging of individual cells was carried out with a Leica DMI6000B epifluorescent microscope, running on LAS-AF software.  A 63x objective with a numerical aperture of 1.25 was used *(Leica, 11506185)*, giving a resolution limit of approximately 277 nm for Alexa Fluor 568.  Images were 1000 x 1000 pixels with a pixel size of 0.127 x 0.127 \textmu{}m.  

Whole-plate epifluorescent tile scans, used for quantifying transfection efficiency in figure \@ref(fig:transfection-plot-full), were carried out on a Leica DMi8 microscope running on LAS X software.  A 5x objective with a numerical aperture of 0.12 was used.

All images collected in Leica software were exported as TIFs before further analysis. 


#### Images used in this thesis

Microscope images shown in this thesis have had their brightness and contrast adjusted to ensure that key details are apparent to the reader.  This was performed after any relevant analysis; care was taken during image collection to avoid any overexposure in regions to be analysed, and any intensity analysis was performed on unmodified pixel values.



### Image analysis

All image analysis was conducted in Fiji.  In most cases, custom macros were used for batch processing and streamlining manual tasks; these are available in section \@ref(CODE).  Confocal stacks were compressed to maximum intensity projections before analysis.

All manual image analysis tasks were conducted blind, with the exception of figure \@ref(fig:LC3-full-figure), panel E, where cells were classified while they were being examined on the microscope.  To facilitate this, I wrote an R package called `blinds`, which replaces file names with unique identifiers that can be reversed after manual analysis.  While I created the package specifically for this project, it is generally applicable and publicly available on GitHub [@loveBlinds2023].  Wherever it was not possible to obscure the file names (e.g. where saved ROIs were being matched to images by name), steps were taken in the analysis macros to randomise image order and hide the experimental condition.

#### Kymograph analysis{#kymo}

Kymographs were generated from Metamorph stack files using the Fiji Multi Kymograph plugin.  In cases where moving puncta were especially faint (most notably RAB7), stacks were pre-processed with the Bleach Correction plugin, using the histogram matching method.  Snapshots of the axon marker channel (typically either EGFP or mCherry-tagged protrudin) were traced to generate axon ROIs, which were then used to generate the kymographs.  Line width for the Multi Kymograph plugin was set to 5 pixels.  Generated kymographs were further refined as needed through rolling ball background subtraction and contrast adjustment.

We tested KymoButler [@jakobsKymoButlerDeepLearning2019] for automated kymograph analysis, but found that it did not consistently pick up the small, fast-moving particles common in our lysosome and late endosome data.  As a result, kymographs were manually traced in Fiji using the segmented line tool, with a custom macro to export the data in CSV format for analysis in R (section \@ref(kymo-export)).  For the purposes of classification, anterograde and retrograde were defined as continuous movements of at
least 5 \textmu{}m away from or towards the cell body, respectively.  

### Statistical analysis

The Shapiro-Wilk test was used to examine data normality.  As the vast majority of data was not normally distributed, the decision was made to use non-parametric tests throughout.  This is likely due to a combination of small sample sizes and a high degree of cell-cell variability for many of the experiments.

After consultation with a statistician, we selected the Kruskall-Wallis test for comparisons of three or more groups, and the Wilcoxon rank-sum/Mann-Whitney test for comparisons of two groups.  As these are non-parametric tests, a significant *p* value (defined to be < 0.05) indicates a difference in median or distribution between groups.  In comparisons using the Kruskall-Wallis test, significant *p* values were followed up with Dunn's post-hoc test with Bonferroni correction for multiple comparisons to identify which pairs of groups showed significant differences.  In each case, all possible pairwise comparisons were performed, but only *p* values deemed as significant (< 0.05) are shown.  All statistical analysis was carried out in R [@Rlanguage].

As a general rule, outliers were not excluded, either from graphs or statistical analysis, unless there was some evidence of a fault with data collection or manual analysis.  In practice, this amounted to a single kymograph particle trace from the data presented in figure \@ref(fig:ST3GAL5-full-figure), which was deemed to be moving unreasonably fast (> 90 \textmu{}m/s) and most likely represented a simple human error during manual tracing.

Quantitative data is presented in dot plots wherever feasible, so individual data points are visible.  In cases with a very large number of data points, violin plots are used instead to indicate the distribution of the underlying data.  These are overlaid with box plots, which indicate the quartile ranges of the data.  

<!--chapter:end:text/Methods.Rmd-->

---
output:
  pdf_document:
    latex_engine: xelatex
  html_document: default
  word_document: default
bibliography: "C:/Users/fiona/Documents/GitHub/Thesis/bib/THESIS.bib"
always_allow_html: true
---

# Is protrudin's effect on neuroprotection mediated by lysosome and/or late endosome transport?

```{=latex}
\chaptermark{Lysosome and late endosome transport}
```



## Introduction

### The many roles of neuronal lysosomes

Lysosomes have traditionally been regarded as the degradative compartment of the cell, responsible for the final breakdown and recycling of excess or damaged proteins and organelles [@deduveLysosome1963].  While this is certainly true, more recent work has shown that they are in fact a diverse pool of complex, multi-functional organelles.  While lysosomal function is essential to cellular survival broadly, it is particularly critical in neurons, which have additional metabolic, signalling, and transport constraints imposed by their extreme morphology.  As a result, normal activity and transport of lysosomes is a key factor in neuronal survival, and disruption of either of these processes can lead to neurodegeneration [@fergusonNeuronalLysosomes2019].

Lysosomal dysfunction is implicated in a wide range of neurodegenerative diseases, including Alzheimer's disease, Parkinson's disease, and ALS.  In many cases, defects in lysosomal degradation of autophagosome contents (a process which occurs in tandem with retrograde transport in axons [reviewed in @fergusonNeuronalLysosomes2019]) are thought to cause the accumulation of damaged organelles, which eventually leads to axonal swellings and subsequent degeneration [@dehayPathogenicLysosomalDepletion2010; @leeLysosomalProteolysisInhibition2011; @xieEndolysosomalDeficitsAugment2015].  Other conditions have been linked to impaired transport leading to decreased availability of lysosomes in the axon [@roneyLipidmediatedMotoradaptorSequestration2021].  Understanding how lysosomes function in neurons and the processes controlling their transport is therefore an important step in developing new protective or regenerative therapies for the CNS.

#### RNA transport

In recent years, a substantial body of evidence has emerged to demonstrate how lysosomes and closely related late endosomes facilitate RNA transport in neurons.  mRNA transport, and subsequent local protein synthesis, is essential for axon growth, pathfinding, maintenance, and synapse formation [reviewed in @cioniMolecularControlLocal2018].  

Cioni et al. demonstrated that ribonucleoproteins in the axon often associate with RAB7-marked late endosomes, and that these endosomes act as sites for local translation [@cioniLateEndosomesAct2019].  Furthermore, these late endosomes can form contact sites with mitochondria, where they are involved in the local translation of proteins for mitochondrial maintenance.  Work by Liao et al. identified the protein ANXA11 as the tether between lysosomes and RNA granules in the axon, and also showed that ALS-associated mutations in ANXA11 interfere with lysosome binding [@liaoRNAGranulesHitchhike2019].  

#### Signalling platform

As an endpoint of several protein degradation pathways, lysosomes are particularly responsive to amino acid levels in the cell, and in turn regulate the cell's response to feeding or starvation through signalling complex mTORC1.  mTORC1 is a serine/threonine kinase that localises to lysosomes, where it can be activated by regulatory proteins that colocalise in the presence of amino acids, in turn leading to increased protein translation and cell growth [reviewed in @inpanathanLysosomeSignalingPlatform2019].  This process is modulated by lysosome positioning — during starvation, lysosomes cluster near the nucleus, and mTORC1 activity is inhibited.  Feeding allows the lysosomes to transport towards the cell periphery, where mTORC1 activation can promote growth.  Hong et al. found that protrudin was involved in this process, interacting with lysosomes to facilitate anterograde transport [@hongPtdIns3PControlsMTORC12017].   This signalling is especially important in neurons — Poulopoulos et al. found that the majority of mRNA transcripts that they identified as enriched in growth cones contain a TOP motif for mTORC1-dependent translation.  In addition, they showed that endogenous mTOR and mTORC1 proteins were also enriched in growth cones, providing the necessary machinery for local translation to occur [@poulopoulosSubcellularTranscriptomesProteomes2019].  Therefore, the location of lysosomes and the regulation of mTORC1 on those lysosomes likely acts as a key gatekeeper of local translation, and the associated axonal functions that depend on it.

\begin{figure}
\includegraphics{../figures/full/mTORC1-schematic-1} \caption[mTORC1 activation schematic]{A highly simplified schematic showing mTORC1 activation through multiple pathways in the presence of amino acids.  When amino acids are present (A), GATOR2 inhibits GATOR1, which in turn allows the RAG GTPase heterodimers to recruit the mTORC1 complex, which is further actiavted by amino acids and RHEB GTPase.  When amino acids are scarce (B), inhibition from GATOR1 prevents the mTORC1 recruitment by the RAGs.}(\#fig:mTORC1-schematic)
\end{figure}

Beyond mTORC1, lysosomes also participate in calcium signalling and homeostasis, which are particularly important for neuronal function.  Lysosomes are known to act as calcium stores for the cell, but also participate in a process known as store-operated calcium entry in response to calcium influx [@huiReleaseCalciumEndolysosomes2015].  In this process, lysosomes are exocytosed, inserting N-type calcium channels from their membranes into the plasma membrane and allowing increased calcium entry and subsequent activation of signalling cascades.  This process is required for a number of neuron-specific cellular functions, including electrical signalling, learning, and dendritic spine maintenance [reviewed in @wegierskiNeuronalCalciumSignaling2018].  Additionally, the exocytosis of lysosomes releases cathepsin B into the extracellular space, which activates matrix metalloproteinase 9 (MMP-9) through cleaving its inhibitor TIMP-1.  Active MMP-9 breaks down components of the extracellular matrix, facilitating cellular growth.  In neurons, this allows dendritic spines to grow in response to activity [@padamseyActivityDependentExocytosisLysosomes2017].  In cancer cells, this underpins the growth of invasive protrusions called invadopodia, a process that has been shown to depend on protrudin, RAB7, and FYCO1 [@pedersenProtrudinmediatedEREndosome2020]. 

#### ER morphology

Recent advances in microscopy have allowed the interactions between lysosomes and the ER to be imaged in unprecedented detail, and in turn revealed how lysosomes are involved in shaping the tubular ER network in cells.   Lu et al. demonstrated that, as lysosomes moved in response to the cell's nutritional state, they pulled ER tubules with them [@luStructureGlobalDistribution2020].  When a lysosome 'detached' from a contact site with the ER, the lysosome speed increased while the associated ER tubule retracted, indicating that the lysosomes do indeed pull on ER tubules rather than vice versa, or another mechanism of co-transport.  Interfering with the anterograde movement of lysosomes or ER-lysosomal contact sites resulted in fewer peripheral tubules and large ER sheets near the nucleus.  In neurons, this led to decreased axonal ER tubules and stunted axon growth.  Spits et al. showed a similar interaction with late endosomes, where RAB7 and its transport adaptors mediated ER tubule reorganisation, and resulted in a more sparse ER network in response to starvation [@spitsMobileLateEndosomes2021].   

As much as lysosomes help shape the ER, these interactions are reciprocal, and also play an essential role in lysosome morphology.  Disruption of the ER tubule network has been shown to result in the accumulation of large, static lysosomes near the nucleus, and prevent lysosome transport into axons [@ozkanERLysosomeContacts2021].  Other work has shown that association with ER tubules is necessary for lysosomal tubulation and cargo sorting, and that a key protein involved, LRRK2, is implicated in Parkinson's disease [@bonet-ponceEndoplasmicReticulumContributes2022].

### Lysosome transport mechanisms

As lysosomal function is closely tied to the positioning of these organelles in the cell, significant work has gone into understanding how lysosomes are transported.  This has identified a number of distinct, sometimes overlapping pathways that are regulated in different ways.  Work is still ongoing to understand the importance of these different pathways, and how they may interact in different cell types to control late endosome and lysosomal transport.

#### BORC/ARL8B/SKIP

The BORC/ARL8B/SKIP interaction is one of the best-characterised mechanisms involved in lysosome transport.  In summary, BORC, a complex of eight proteins, is tethered to the lysosomal membrane by a myristoyl tail on subunit protein myrlysin [@puRagulatorBORCInteraction2017].  BORC recruits and activates ARL8B, a small GTPase, which is otherwise diffusely distributed around the cell.  GTP-bound ARL8B can in turn bind to SKIP, which binds to kinesin-1.  This chain of interactions tethers lysosomes to the kinesin motor for transport along microtubules [@guardiaBORCFunctionsUpstream2016]. BORC activity is regulated by interaction with the Ragulator complex, which conveys amino acid sensitivity and allows for control of lysosomal positioning in response to nutrient levels in the cell [@puRagulatorBORCInteraction2017].  This process has been shown to mediate anterograde transport of lysosomes in axons [@fariasBORCKinesin1Ensemble2017], and defects in BORC component diaskedin are linked to progressive axonal dystrophy [@snouwaertMutationBorcs7Subunit2018].  In cancer cells, increased expression of several BORC subunits in cells that survived radiation therapy was shown to enhance cell invasiveness, supporting a role for BORC-mediated lysosome transport in cell outgrowth [@wuLysosomalTraffickingMediated2020].

\vspace{30pt}
\begin{figure}
\includegraphics{../figures/full/BORC-schematic-1} \caption[BORC schematic]{A schamatic of the interactions between BORC, ARL8B, SKIP, and kinesin, which allow lysosomes to be anterogradely transported along microtubules.}(\#fig:BORC-schematic)
\end{figure}

#### Calcyon and other adaptor proteins

While the BORC complex is involved in kinesin-mediated transport, several other adaptor proteins facilitate minus-end directed transport through binding to dyneins.  These include calcyon (which binds to late endosomes and lysosomes) [@shiDyneinBindsStimulates2017; @shiCouplingMicrotubuleMotors2018], RILP (which is a specific adaptor for RAB7)[@bucciExpressionAnalysisChromosomal2001], ALG2 (which binds lysosomes in a calcium-dependent manner) [@liMolecularMechanismRegulate2016], and JIP3 and JIP4, which are involved in amino-acid induced lysosomal transport through TMEM55B [@willettTFEBRegulatesLysosomal2017; @gowrishankarOverlappingRolesJIP32021].  The diversity of effector proteins involved in this process likely reflects the importance of lysosome positioning on the function of diverse tissues and cell types.

#### Protrudin

As previously discussed (section \@ref(intro-ptdn-transport)), Raiborg et al. proposed a mechanism through which protrudin promotes anterograde late endosome transport [@raiborgRepeatedEREndosome2015], which in turn drives neurite outgrowth.  Subsequent work expanded this mechanism to lysosomes, and particularly implicated protrudin-mediated lysosomal transport in mTORC1 activation, albeit in non-neuronal RPE-1 and HEK293 cells [@hongPtdIns3PControlsMTORC12017].  Additionally, since Petrova et al. showed that overexpression of protrudin increased the amount of ER in growth cones, it seemed likely that lysosomal transport might play a role in this process, in keeping with the role of lysosomes in ER transport discussed in section \@ref(intro-ptdn-axonalER) [@petrovaProtrudinFunctionsEndoplasmic2020].

### Hypothesis and experimental aims 

Given the importance of lysosome transport to cell growth and neuronal function, we decided to test whether the neuroprotective and pro-regenerative effects of protrudin overexpression could be mediated through an increase in axonal lysosome transport.  Previous work in the lab showed that RAB11 endosomes — with their cargo of integrins, growth factors, and other growth-related molecules — are excluded from CNS axons as they mature [@kosekiSelectiveRab11Transport2017].  Overexpression of protrudin can increase the amount of RAB11 reaching the distal axon, supporting regeneration [@petrovaProtrudinFunctionsEndoplasmic2020].  We reasoned that protrudin might act in a similar way on lysosomal transport, and that an increased number of lysosomes in the mature axon might promote axon survival and regrowth after injury.   To that end, we examined the effect of protrudin overexpression on axonal lysosome and late endosome numbers, speed, and other transport parameters.  At the same time, we set out to test whether other approaches to increase lysosomal transport might also promote regeneration or survival in damaged axons.



## Methods

General cell culture and microscopy methods can be found in section \@ref(METHODS).  Methods for the experiment presented in section \@ref(protrudin-ONC) are published in [@petrovaProtrudinFunctionsEndoplasmic2020].

### Cloning of LAMP1 construct for lysosome^[While LAMP1 labels a variety of lysosome-related organelles [@chengRevisitingLAMP1Marker2018], ranging from late endosomes to degradative autophagosomes, I will refer to LAMP1-labelled organelles as lysosomes throughout this thesis for the sake of brevity.] labelling{#cloning}

The LAMP1-RFP plasmid *(Addgene, 1817)* was modified to replace the existing CMV promoter with a human^[We use the human synapsin promoter in our lab instead of the rat synapsin promoter because it reliably drives expression in both human and rodent neurons, and is more suitable for clinical translation into human gene therapies.] synapsin promoter to improve expression level in neurons.  Primers (table \@ref(tab:primer-table)) were designed using the NEBuilder tool (`https://nebuilder.neb.com`) from New England Biolabs. 

Fragments for cloning were produced by PCR, separated on a 1% agarose TBE gel, and purified using the Wizard SV Gel and PCR Clean-Up System kit *(Promega, A9282)*. 20 \textmu{}L assembly reactions were set up with Gibson master mix *(New England Biolabs, E2611S)* and an appropriate ratio of insert and vector DNA (2:1 or higher) and incubated at 50°C for 1.5 hours. Assembled constructs were scaled up, and successful cloning confirmed with restriction digest and DNA sequencing.

\begin{table}
\centering
\caption{(\#tab:primer-table)Gibson cloning primers.}
\centering
\resizebox{\ifdim\width>\linewidth\linewidth\else\width\fi}{!}{
\begin{tabular}[t]{ll}
\toprule
  & sequence\\
\midrule
plasmid forward & GGTTTAGTGAACCGTCAG\\
plasmid reverse & CGGAACTCCATATATGGG\\
insert forward & AGCCCATATATGGAGTTCCGCTAGACTCTAGCTGCAGAGGG\\
insert reverse & ATCTGACGGTTCACTAAACCTCGACTGCGCTCTCAGGC\\
\bottomrule
\end{tabular}}
\end{table}

### Calcyon shRNA silencing

Ready-cloned shRNA expression vectors against calcyon were obtained from OriGene *(TG712969)* (table \@ref(tab:caly-tab)).  The constructs readily expressed in rat cortical neurons (as seen from TurboGFP signal), but proved highly toxic to the cells.  Many cells transfected with either a mixture of calcyon shRNA constructs or the scrambled control shRNA *(Origene, TR30013)* showed complete fragmentation, and the remaining intact cells had abnormally low levels of organelle movement, suggesting low viability.  This experiment was not continued further.

\begin{table}

\caption{(\#tab:caly-tab)Calcyon shRNA sequences.}
\centering
\begin{tabular}[t]{ll}
\toprule
  & sequence\\
\midrule
TG712969A & ATCCGCAGAAGGCGGAGGATGTGCCGTCC\\
TG712969B & TGCGGACCAGCCAAAGAAGTTCGCAGATT\\
TG712969C & CCAGATGGCTTCCTACTTCGGCACAAGAT\\
TG712969D & TCAGCCATCATTCCCTGACCAGGTGGTCA\\
\bottomrule
\end{tabular}
\end{table}

### Lysotracker labelling

We initially tried labelling cells with LysoTracker Red *(Thermo Fisher, L7528)*, using the manufacturer's labelling protocol.  However, the dye was toxic to our neuronal cultures, even at low concentrations.  In addition, the density of our cultures made it difficult to distinguish lysosomes in the neuron of interest from those in overlapping neuronal projections.  As a result, we decided to proceed with transfected fluorescently-tagged markers instead of LysoTracker or other cell-permeable dyes.

### BORC-related constructs for lysosome/late endosome manipulation

Expression constructs for SKIP, myrlysin (BORCS5), WT ARL8B, and constitutively active ARL8B were kindly provided by Juan Bonifacino.  These constructs were scaled up as described in section \@ref(plasmid-prep) and tested for transfection in cortical neurons.  Additional constructs of SYN-myrlysin-EGFP and CBh-SKIP-mNeonGreen were obtained from VectorBuilder and prepared in the same way.

\vspace{14pt}
\begin{figure}
\includegraphics{../figures/SKIP-LAMP1-kymo-1} \caption[SKIP and LAMP1 representative kymograph]{Representative kymograph showing SKIP in green and LAMP1 in magenta.  Scale bar is 20 \textmu{}m.}(\#fig:SKIP-LAMP1-kymo)
\end{figure}

Our original intention was to test if artificially increasing lysosomal transport in the axon could promote regeneration; however, this work was interrupted by the pandemic.  Following our return to the laboratory, we conducted some pilot experiments with SKIP and LAMP1.  This showed some colocalisation between the two, particularly in anterogradely-moving lysosomes, but no immediately obvious differences in number of lysosomes, speed, or run length compared to an EGFP control (figure \@ref(fig:SKIP-LAMP1-kymo)).  (This is not unexpected, as previous experiments required both SKIP and ARL8B overexpression to stimulate transport [@rosa-ferreiraArl8SKIPAct2011; @fariasBORCKinesin1Ensemble2017].)  After the completion of the experiments described in section \@ref(lyso-LE), it was decided not to continue this work further.


### Transfection optimisation

As mentioned in section \@ref(METHODS), we experienced a sharp decline in efficiency with our initial magnetofection protocol, and needed to reoptimise our process.  This occurred between the experiments discussed in section \@ref(lyso-LE).  During this time, we tested a variety of protocols and modifications to identify the factors most important for transfection efficiency, using the same EGFP/Emerald expression construct.  Results were measured by scanning the entire plate of cells on a Leica DMi8 tilescan microscope and counting the number of transfected neurons that were either intact or visibly dead (figure \@ref(fig:transfection-plot-full)).  

\begin{figure}[!h]
\includegraphics{../figures/transfection-plot-full-1} \caption[Transfection optimisation plot]{A) Example image of a full-plate scan used for quantifying transfection.  The indicated area (1x1 mm) is enlarged to the right, and examples of intact cells (blue asterisk) and dead cells (magenta x) are annotated. B) Cell counts for plates of varying density transfected with magnetofection protocol.  C) Cell counts for three identical plates (300,000 cells per plate) transfected with calcium phosphate protocol.  Note the difference in scale between the two plots.}(\#fig:transfection-plot-full)
\end{figure}

Of all the factors tested, cell density best correlated with the transfection efficiency, although the improvements on the original magnetofection protocol were dwarfed by the vast improvement with calcium phosphate transfection.  Going forward, transfections were carried out using the calcium phosphate method, with cell density of 200,000-400,000 per imaging dish depending on the needs of the experiment.


## Results^[The results presented in this section largely reflect my first year of study, a time when I was also training to perform *in vivo* experiments to assess neuroprotection and regeneration in the eye and optic nerve.  My initial plan was to determine protrudin's effect on lysosome/late endosome transport, and then test a variety of different tools (e.g. calcyon shRNA, BORC overexpression, etc.) to manipulate lysosome and late endosome transport and assess their regenerative potential.  Unfortunately, the cessation of lab work during the pandemic and associated disruptions eventually led us to abandon most of these plans.]

### Protrudin overexpression is neuroprotective following axon injury *in vivo*{#protrudin-ONC}

*The data in this section has been published in [@petrovaProtrudinFunctionsEndoplasmic2020].  My contribution to the experiment included DNA preparation, tissue collection, and data curation and analysis.*

The optic nerve crush model is a powerful tool for examining CNS survival and regeneration *in vivo*.  Because the eye and the optic nerve can be accessed much more readily than, for example, the brain and spinal cord, it allows the gene delivery and axon injury to be performed with minimal invasiveness.  In addition, because the bodies of the RGCs are all located together in the retina, it is possible to quantify both cell survival and axon regrowth in the same experiment.

For this experiment, mice received intravitreal injections of AAV2 viruses containing either EGFP only, WT protrudin, or active protrudin under a CAG promoter, followed two weeks later by a unilateral optic nerve crush.  Two weeks post-crush, the mice were perfused, and eyes and optic nerves were collected.  RBPMS staining of retinal flat mounts showed a significant increase in RGC survival with expression of the active protrudin construct, as measured by comparing the number of RBPMS positive cells between the crush and uninjured eyes (figure \@ref(fig:ONC-figure))[@petrovaProtrudinFunctionsEndoplasmic2020].  

(ref:ONC-cap) Reproduced with permission from Petrova et al. 2020.  A) Timeline of the optic nerve crush experiments.  (CTB injection was included for the purpose of tracing regenerating axons, but is not shown in this figure.)  B) Representative images of RBPMS-stained retinal whole mounts.  Scale bar is 100 \textmu{}m.  C) Quantification of surviving RGCs.   Fisher’s exact test with analysis of stack of *p* values and Bonferroni–Dunn multiple comparison test. Error bars represent mean ± SEM.
\begin{figure}
\includegraphics{../figures/full/ONC-figure-1} \caption[RGC neuroprotection experiment from Petrova et al. 2020]{(ref:ONC-cap)}(\#fig:ONC-figure)
\end{figure}

This effect was further substantiated by mouse retinal explant experiments, which showed that transfection with either WT or active protrudin completely preserved RGC survival over three days *ex vivo*, compared to an EGFP control which lost approximately 55% of RGCs over the same time [@petrovaProtrudinFunctionsEndoplasmic2020].

### Protrudin overexpression does not increase lysosome or late endosome transport in the distal axon{#lyso-LE}

To test the hypothesis that protrudin might function in part by increasing the anterograde transport of late endosomes or lysosomes into the distal axon, we set out to measure the effects of protrudin overexpression on the axonal transport of these organelles.  As described above, there are a number of ways in which this increased transport could have neuroprotective or regenerative effects, and such a function would be in keeping with protrudin's described behaviour in the literature.  

Rat cortical neurons were transfected to co-express LAMP1-mRFP1 as a marker of lysosomes, with either EGFP or EGFP-tagged protrudin.  LAMP1 transport in the distal axon was imaged in three-minute segments using spinning disc microscopy.  These videos were then used to generate kymographs as described in \@ref(kymo) (figure \@ref(fig:LAMP1-full-figure), panel A), which were manually traced to give measures of lysosome number, run length, and transport speed.  Overexpression of either wild type or active protrudin had no significant effect on the number, distance, or direction of travel of lysosomes in the distal axon (figure \@ref(fig:LAMP1-full-figure), B-C).  A very slight decrease in anterograde speed was observed in cells expressing active protrudin (figure \@ref(fig:LAMP1-full-figure), panel D).

(ref:LAMP1-caption) A) Representative axon image and kymographs showing LAMP1 transport in the distal axon of cortical neurons expressing either EGFP (control) or EGFP-tagged protrudin constructs.  All scale bars are 20 \textmu{}m.  B) Total number of LAMP1-labelled organelles in each cell imaged.  C) Average run length (per cell) of moving lysosomes.  D) Average lysosome velocity (per cell).  *n* = 28 to 30 cells per condition across four independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}
\includegraphics{../figures/full/LAMP1-full-figure-1} \caption[Protrudin effect on lysosome (LAMP1) transport in the distal axon]{(ref:LAMP1-caption)}(\#fig:LAMP1-full-figure)
\end{figure}

The experiment was then repeated using RAB7 instead of LAMP1 as a more specific marker of late endosomes.  As the mechanism set out in Raiborg et al. suggests that RAB7 is directly involved in protrudin-mediated transport of late endosomes, this should label only the population of organelles that are involved in this process [@raiborgRepeatedEREndosome2015].  While overexpression of RAB7 could potentially amplify any effect of protrudin overexpression on this system, this effect should be consistent between control and protrudin conditions.  Cortical neurons were co-transfected with mCherry or mCherry-tagged protrudin and RAB7A-mEmerald, and RAB7 transport imaged and analysed as described previously.  However, this showed no significant effect of protrudin on any measured parameter of transport (figure \@ref(fig:RAB7-full-figure)).  Importantly, there was no change in the total number of lysosomes or late endosomes with either WT or active protrudin expression, compared to a control (figure \@ref(fig:RAB7-full-figure), panel B).

(ref:RAB7-caption) A) Representative axon image and kymographs showing RAB7 transport in the distal axon of cortical neurons expressing either mCherry (control) or mCherry-tagged protrudin constructs.  All scale bars are 20 \textmu{}m.  B) Total number of RAB7-labelled organelles in each cell imaged.  C) Average run length (per cell) of moving late endosomes.  D) Average late endosome velocity (per cell).  *n* = 17 or 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot.
\begin{figure}
\includegraphics{../figures/full/RAB7-full-figure-1} \caption[Protrudin effect on late endosome (RAB7) transport in the distal axon]{(ref:RAB7-caption)}(\#fig:RAB7-full-figure)
\end{figure}

Taken together, these results demonstrate that neither wild type nor active protrudin has any clear effect on lysosome or late endosome transport in the axon, and do not support our initial hypothesis that protrudin's beneficial effects are associated with an increase in transport of these organelles.

## Discussion{#no-FYCO}

Somewhat surprisingly, we found that protrudin overexpression had little if any effect on lysosomal and late endosomal transport in cortical neurons.  However, further examination of the literature provides a likely explanation.  The mechanism described in Raiborg et al. — which used PC12 cells as a model system — relies on the protein FYCO1 as an adaptor to link late endosomes to kinesin for anterograde transport [@raiborgRepeatedEREndosome2015].  This protein, also known as ZFYVE7, contains similar RAB7-, PIP-, and kinesin-binding domains to protrudin.  Raiborg et al. reported that protrudin brings late endosomes and kinesin together through RAB7 and PI(3)P binding, but then transfers the kinesin onto RAB7-bound FYCO1 to facilitate transport.   However, transcriptomic data from Koseki et al. suggests that FYCO1 mRNA is almost undetectable in cortical neurons, which could explain why we see no effect on late endosome transport with protrudin overexpression (figure \@ref(fig:FYCO1-RNAseq-full-figure), panel A) [@kosekiSelectiveRab11Transport2017].  This is consistent with transcriptomic data from other studies that show extremely low FYCO1 in human cortical neurons, expression biased towards non-neuronal cell types in the brain, and low levels in mouse DRG neurons, as illustrated in figure \@ref(fig:FYCO1-RNAseq-full-figure), B-G [@zhangPurificationCharacterizationProgenitor2016; @kelleyVariationIntactTissue2018; @tedeschiCalciumChannelSubunit2016].

The slight decrease in anterograde lysosome speed seen in figure \@ref(fig:LAMP1-full-figure), panel D, with the expression of active protrudin is unlikely to represent a direct effect on late endosome/lysosome transport, given the absence of any similar effect on RAB7 transport (figure \@ref(fig:RAB7-full-figure)).  This might instead indicate an interaction between LAMP1-labelled lysosomes and other organelles in the axon, directly or indirectly mediated by protrudin.  It could also potentially represent an increase in lysosomal size, perhaps due to an upstream effect on autophagy, which could result in slower axonal transport [@wangRadialContractilityActomyosin2020].  (The video and kymograph data of LAMP1 transport did not show an obvious change in lysosomal size, but this was not examined quantitatively, and any changes could be quite small given the magnitude of the effect on transport speed.)  I discuss these possibilities further in subsequent chapters.

(ref:FYCO-cap) RNA sequencing data from A) Koseki et al. 2017 [@kosekiSelectiveRab11Transport2017], B) Zhang et al. 2016 [@zhangPurificationCharacterizationProgenitor2016], C) Kelley et al. 2018 [@kelleyVariationIntactTissue2018], D) Tian et al. 2019 (via `https://ineuronrnaseq.shinyapps.io/rnaseq_app`) [@tianCRISPRInterferenceBasedPlatform2019], E-G) Tedeschi et al. 2016 [@tedeschiCalciumChannelSubunit2016].
\vspace{30pt}
\begin{figure}
\includegraphics{../figures/full/FYCO1-RNAseq-full-figure-1} \caption[FYCO1 transcriptome comparisons]{(ref:FYCO-cap)}(\#fig:FYCO1-RNAseq-full-figure)
\end{figure}

Of note, Özkan et al. also do not find a link between protrudin and CNS axonal lysosome transport.  They knocked down protrudin in hippocampal neurons, but found no effect on the distribution of LAMP1-labelled lysosomes into the axon  [@ozkanERLysosomeContacts2021].   This supports the idea that protrudin is not involved with late endosome/lysosome transport in CNS neurons, but that other transport mechanisms (e.g. BORC) are predominant in axon transport.

It is worth noting that these results do not contradict our earlier findings published Petrova et al. [@petrovaProtrudinFunctionsEndoplasmic2020].  The mechanism of late endosome transport set out in Raiborg et al. — in which protrudin interacts only transiently with RAB7 before passing the late endosome to FYCO1 — is substantially different from how it functions in recycling endosome transport.  In the case of recycling endosomes, protrudin is believed to act as the primary adaptor between RAB11 and kinesin, and therefore does not require FYCO1.

While these findings can effectively rule out late endosome/lysosome transport as a mechanism through which protrudin drives neuroprotection and axon regeneration, they are worth bearing in mind when it comes to clinical translation.  The differential expression of FYCO1 across cell types suggests potential variations in the regulation of lysosome transport between them.  While protrudin overexpression has no substantial effect on this transport in cortical neurons, it could have an impact on other populations, leading to possible undesired effects in non-neuronal cell types.  Any gene therapies incorporating protrudin should therefore be carefully targeted to limit expression in the PNS and glial populations.

It remains an open question whether or not enhancing axonal lysosome transport could promote axon regeneration, for many of the reasons discussed at the start of this chapter.  Further research in this area is required, either targeting transport mechanisms such as BORC or calcyon (which have been demonstrated to act in CNS neurons), or through exogenous expression of FYCO1.  In fact, Saridaki et al. have already shown that FYCO1 overexpression in a *Drosophila* model of Parkinson's disease preserves motor function at baseline levels and prevents age-related decline  [@saridakiFYCO1MediatesClearance2018].  (That being said, *Drosophila* does not contain an ortholog for protrudin, so FYCO1 may not have the same effect as it would in a vertebrate model [@wangHereditarySpasticParaplegia2008].)  While FYCO1 is an appealing candidate for further study, due to the possibility of it acting synergistically with protrudin, it might be unfeasible as a gene therapy due to the size of the FYCO1 transcript.  At over 4400 base pairs, it is very close to the packaging capacity of most AAV capsids, even without a promoter or other vector elements.  However, a better understanding of FYCO1 function might allow for the development of a shorter functional form with better translational potential.

<!--chapter:end:text/Chapter_1.Rmd-->

---
output:
  pdf_document: 
      latex_engine: xelatex
      keep_tex: true
  html_document: default
  word_document: default
bibliography: "C:/Users/fiona/Documents/GitHub/Thesis/bib/THESIS.bib"
always_allow_html: true
---

# Identifying protrudin's cellular functions in CNS neurons

```{=latex}
\chaptermark{Cellular functions of protrudin}
```



## Introduction

As discussed previously in section \@ref(intro-ptdn), protrudin's array of binding domains allow it to participate in numerous cellular systems, with diverse effects.  To identify other mechanisms of action, we decided to take a broad approach, examining a number of different systems to identify how protrudin might influence neuronal structure and function, either endogenously or with overexpression.

Shirane et al. recently developed a knockout mouse model of protrudin deficiency, with surprising results [@shiraneProtrudindeficientMiceManifest2020].  The animals showed no sign of HSP-like motor symptoms, but instead had a broad behavioural phenotype that more closely resembled attention deficit hyperactivity disorder in humans.  They did not show any signs of neurodegeneration, as might be expected from previous *in vitro* work, that would indicate that protrudin is required to maintain axonal ER structure or endosomal transport [@shiraneProtrudinPDZD8Contribute2020].  This suggests that protrudin's role in the nervous system is significantly more complex than previously understood.

Previous work in the lab found it extremely difficult to reduce protrudin levels in cultured rat cortical neurons — either by shRNA or CRISPR — without killing the cells.  We were able to study loss of protrudin function through overexpression of mutants with dominant negative effects, rather than protrudin deletion or silencing.  Since our plasmids drive protrudin overexpression at levels substantially higher than endogenous protrudin expression [@petrovaProtrudinFunctionsEndoplasmic2020], overexpression of a mutant form of protrudin should outcompete the endogenous protein for binding partners, even if it does not directly decrease the amount of endogenous protein in the cell.  In this way, we are able to examine the effects of different loss-of-function mutations on protrudin's cellular effects.

### Protrudin's role in neuronal morphology

While protrudin's role in cell outgrowth is interesting from the perspective of axon regeneration, it could potentially play a number of other roles in neuron morphology.  Petrova et al. showed that endogenous protrudin is present in both axons and dendrites, but is most abundant in the dendrites and cell bodies of mature neurons [@petrovaProtrudinFunctionsEndoplasmic2020].  Consequently, protrudin's endogenous functions might be more apparent in the somatodendritic domain, simply due to the natural distribution of the protein.  In fact, there are a number of published findings that suggest that protrudin may function in dendrites, either to control dendritic spine morphology or support synaptic function.  

For example, the mechanism through which protrudin promotes invadopodia formation in cancer cells is functionally similar to how lysosomal exocytosis induces dendritic spine expansion, raising the possibility that protrudin is involved in spine growth [@pedersenProtrudinmediatedEREndosome2020; @padamseyActivityDependentExocytosisLysosomes2017].  However, Pedersen et al. found that this process is dependent on FYCO1 as well as protrudin, which (as discussed in section \@ref(no-FYCO)), is largely absent in CNS neurons [@pedersenProtrudinmediatedEREndosome2020].  On the other hand, protrudin has already been shown to play a functional role at dendritic spines, mediating long term depression by allowing internalised AMPA receptors to be removed from the spine through association with KIF5 [@brachetKinesin1protrudinComplex2021].  In addition, ER tubules (or the more complicated spine apparatus) have been observed either transiently or permanently in most spines on hippocampal neurons [@perez-alvarezEndoplasmicReticulumVisits2020], which also suggests that protrudin is likely to be present in or near spines and could act on their morphology.  Given protrudin's effect in cellular outgrowth, therefore, it is reasonable to expect that protrudin overexpression might have an effect on dendritic spine morphology.

### Functional effects of endogenous protrudin

To further examine protrudin's endogenous roles beyond cellular outgrowth, we turned to the literature to identify published proteomics data sets.  We identified three studies that published lists of protrudin-interacting proteins [@elbaz-alonPDZD8InteractsProtrudin2020; @hashimotoProtrudinRegulatesEndoplasmic2014; @matsuzakiProtrudinServesAdaptor2011].  Each study used a different model system and focused their analysis on different pathways, providing a variety of perspectives.  
Elbaz-Alon et al. looked at protrudin in a human epithelial cell line, where they investigated how protrudin interacts with PDZD8 and contributes to ER contact sites  [@elbaz-alonPDZD8InteractsProtrudin2020].  Hashimoto et al. used mouse brain neurons to look at interactions between protrudin and HSP-related proteins [@hashimotoProtrudinRegulatesEndoplasmic2014], while Matsuzaki et al. used a mouse neuroblast cell line to study the interaction between protrudin and KIF5 [@matsuzakiProtrudinServesAdaptor2011].  Individually, these reveal a number of interesting interactions, indicating diverse roles for protrudin that include but are not limited to axonal function.  Taken together, a substantial level of overlap between the interaction sets reveals a conserved set of cellular functions that may help explain protrudin's role in neurons.

### Hypothesis and experimental aims

Following the results discussed in the previous chapter, we decided to temporarily shift focus away from axonal transport and investigate how protrudin might affect other cellular properties.  First, we examined dendritic spines to see if protrudin overexpression increased the number or size of spines, and whether protrudin loss-of-function mutants showed an opposite effect.  We then analysed published protrudin proteomics data to identify previously unstudied organelles and pathways that might be affected by protrudin overexpression, and followed this up with a screen in HeLa cells to select markers for neuronal experiments.



## Methods

General cell culture and microscopy methods can be found in section \@ref(METHODS).

### Dendritic spine imaging and analysis

Rat cortical neurons were co-transfected with mCherry or an mCherry-tagged protrudin construct and EGFP/Emerald.  Cells were imaged as Z-stacks at DIV15, either on the spinning disc at 100x (first experiment), or confocal at 63x (replicate) (see \@ref(METHODS) for microscope details).  Image stacks from the green channel were converted to maximum intensity projections, and a custom ImageJ macro was used to select and crop 20 \textmu{}m sections from a dendrite (section \@ref(dend-crop)).  These images were then blinded, and the Cell Counter Fiji plugin was used to count and classify spines.  For spine length, the Fiji segmented line tool was used to measure along each spine.

### Gene ontology analysis

Lists of protrudin-interacting proteins were obtained from supplementary data published with Elbaz-Alon et al., Hashimoto et al., and Matsuzaki et al. [@elbaz-alonPDZD8InteractsProtrudin2020;@hashimotoProtrudinRegulatesEndoplasmic2014;@matsuzakiProtrudinServesAdaptor2011].  Gene names were standardised across experiments (and between human and mouse data sets) using Bioconductor genome annotations (`org.Hs.eg.db` version 3.15.0 and `org.Mm.eg.db` version 3.15.0).  Gene ontology analysis for biological process enrichment was carried out using the `limma` Bioconductor package in R.

### HeLa cell culture

HeLa cells were expanded before use and cryopreserved in individual vials to prevent genetic drift between batches.

HeLa cells were grown in DMEM *(Thermo Fisher, 41966-029)*, supplemented with 10% FBS *(Thermo Fisher, 10500064)* and antibiotic-antimycotic *(Thermo Fisher, 15240062)*, at 37°C, 5% CO~2~.  For each batch of cells, a single vial was thawed, passaged, and grown to 60-80% confluence before transfection.  Cells were transfected with EGFP or EGFP-tagged protrudin under a CAG promoter, using TransIT-LT1 reagent *(Mirus Bio, MIR2300)*, according to the manufacturer's protocol.  These were then passaged 24 hours after transfection to reduce overlap between cells and encourage protrusion growth.

Cells were fixed with 3% formaldehyde in PBS for 15 minutes at room temperature.  Immunochemistry was carried out according to the protocol in section \@ref(immuno).  Staining with BODIPY TR C~5~ ceramide *(Thermo Fisher, B34400)* was carried out according to the manufacturer's protocol.  Briefly, cells were incubated with 5 \textmu{}M dye in DMEM for 30 minutes at 4°C.  They were then recovered in supplemented media at 37°C, 5% CO~2~ for 30 minutes before fixing as usual.

Several different microscopes were used for imaging HeLa cells, as noted in the relevant figure legends.  This was due to reduced equipment availability and long repair times during the pandemic.  All microscopes provided sufficient resolution to examine the distribution of markers between the cell body and protrusions, and as such the outcomes of this experiment were not affected.

## Results

### Protrudin does not influence dendritic spine number, length, or morphology

Given protrudin's dendritic localisation and known effects on protrusion formation, we first decided to examine whether protrudin plays a role in regulating dendritic spine morphology.  Dendritic spines show diverse morphology within and between cells, which is generally considered to be reflective of the maturity, functionality, and plasticity of each spine [reviewed in @heringDentriticSpinesStructure2001; @bourneThinSpinesLearn2007].  While these ultimately fall on a continuous spectrum of shapes, they are conventionally grouped into four morphological classes — mushroom, thin, stubby, and filopodia [@pchitskayaDendriticSpinesShape2020].  We decided to use these classes to obtain an overview of spine morphology on cells expressing protrudin.  

We co-transfected rat cortical neurons with EGFP/Emerald (as a cytoplasmic label) and an mCherry-labelled protrudin construct.  These included WT and active protrudin, as well as a set of domain-deletion mutants to act as dominant negatives.  \textDelta{}FFAT, \textDelta{}RBD, and \textDelta{}FYVE each have a single binding motif deleted or disrupted, \textDelta{}KIF5 has both the CC and FFAT domains deleted, to completely block binding to kinesin, and \textDelta{}ER mutant (\textDelta{}TM1-3) has all transmembrane domains deleted [@petrovaProtrudinFunctionsEndoplasmic2020]. (Figure \@ref(fig:mutant-maps-full-figure))

\begin{figure}
\includegraphics{../figures/full/mutant-maps-full-figure-1} \caption[Domain maps of protrudin mutants]{Domain maps of the protrudin constructs used in this experiment.   Changes relative to the wild type protrudin sequence are shown in purple, with bars indicating amino acid substitutions and dotted lines indicating deletions.  Not to scale.}(\#fig:mutant-maps-full-figure)
\end{figure}
\vspace{30pt}

For each of these conditions, we counted and manually classified dendritic spines on 20 \textmu{}m sections of dendrite from cells at DIV15 or DIV21.  The DIV15 data suggests that WT protrudin might be associated with fewer, stubbier spines (figure \@ref(fig:spine-type-full-figure), panel D), although the significant comparisons varied for each spine classification, and is inconsistent with the DIV21 data (figure \@ref(fig:spine-type-full-figure), panel E). 

(ref:spine-type-cap) A) Schematic showing selection of dendrite sections for analysis and basic spine morphology groups.  One dendrite section was analysed per cell.  Scale bar is 10 \textmu{}m.  B-C) Total spine counts in 20 \textmu{}m section for DIV15 and DIV21 groups.  D-E) Quantification of each spine type, normalised to the total number of spines in the section measured.  (Continued on following page)
\begin{figure}
\includegraphics{../figures/full/spine-type-full-figure-1} \caption[Protrudin effect on dendritic spine morphology]{(ref:spine-type-cap)}(\#fig:spine-type-full-figure)
\end{figure}
```{=latex}
\begin{figure}
\contcaption{(Continued) DIV15: \textit{n} = 30 cells per condition across three independent batches; DIV21: \textit{n} = 10 cells per condition in one batch.  Kruskal-Wallis \textit{p} values are shown at the top of each plot; significant \textit{p} values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.}
\end{figure}
```

As manual spine classification is an inherently subjective measure, and did not show any clear associations, we decided to look instead at spine length, which can be measured more objectively.  We re-analysed the initial DIV15 data, measuring the length of each spine from the edge of the dendrite.  This did yield some significant comparisons, both in spine number and length (figure \@ref(fig:spine-length-full-figure), panels A and C), so we followed this up with a full replication, which we analysed in the same way (figure \@ref(fig:spine-length-full-figure), panels B and D).  While the replication also produced statistically significant results, they were wholly inconsistent between the two experiments.    

(ref:spine-length-cap) A-B) Number of dendritic spines counted per 20 \textmu{}m section in cells co-expressing EGFP/Emerald with an mCherry-tagged protrudin construct.  Replicate 1: *n* = 30 cells per condition across three independent batches, except \textDelta{}RBD *n* = 29, \textDelta{}KIF5 *n* = 20, \textDelta{}FYVE *n* = 19 across two batches.  Replicate 2: *n* = 40 cells per condition, except WT and \textDelta{}ER *n* = 39, across three independent batches. C-D) Length of each spine measured, in \textmu{}m.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}
\includegraphics{../figures/full/spine-length-full-figure-1} \caption[Protrudin effect on dendritic spine length]{(ref:spine-length-cap)}(\#fig:spine-length-full-figure)
\end{figure}

Taken together, these results show that protrudin overexpression does not substantially impact dendritic spine number, length, or morphology.  These measurements were highly variable between cells and between replicates, and did not show any consistent patterns that would suggest that protrudin plays any role in controlling spine outgrowth.  This obviously cannot rule out changes in spine function, but in any case such changes do not seem to be mediated by morphological changes at the micron scale.

### Gene ontology analysis of protrudin-interacting proteins{#GO-analysis}

As our results did not indicate a clear role for protrudin in regulating dendritic spine morphology, we turned to proteomic analysis to identify other potential cellular functions, either in the somatodendritic domain or in axons.

We identified three published lists of protrudin-interacting proteins from Elbaz-Alon et al., Hashimoto et al., and Matsuzaki et al. [@elbaz-alonPDZD8InteractsProtrudin2020;@hashimotoProtrudinRegulatesEndoplasmic2014;@matsuzakiProtrudinServesAdaptor2011].  As these studies used distinct methods and model systems, we were most interested in the interactions that were conserved across sets.  After standardising the data across sources, we found 46 protrudin-interacting proteins that were identified in at least two studies (figure \@ref(fig:proteomics-full-figure), panel A; table \@ref(tab:overlap-table)).  


Table: (\#tab:overlap-table)Genes identified as interacting with protrudin in two or more published data sets.

|Gene symbol |Elbaz-Alon et al. |Matsuzaki et al. |Hashimoto et al. |
|:-----------|:-----------------|:----------------|:----------------|
|CANX        |+                 |+                |+                |
|COPB2       |+                 |+                |+                |
|DNAJA2      |+                 |+                |+                |
|KIF5B       |+                 |+                |+                |
|VAPA        |+                 |+                |+                |
|VAPB        |+                 |+                |+                |
|ACSL3       |+                 |+                |-                |
|ACSL5       |+                 |+                |-                |
|ASPH        |+                 |-                |+                |
|ATL2        |+                 |+                |-                |
|ATP1A3      |-                 |+                |+                |
|ATP5F1B     |+                 |-                |+                |
|ATP5PO      |+                 |+                |-                |
|BDH1        |-                 |+                |+                |
|C1QBP       |+                 |-                |+                |
|CCDC47      |+                 |+                |-                |
|COPA        |+                 |+                |-                |
|COPB1       |+                 |+                |-                |
|COPG2       |+                 |-                |+                |
|DNAJA1      |+                 |+                |-                |
|ERP44       |+                 |-                |+                |
|ESYT2       |+                 |+                |-                |
|FKBP8       |+                 |+                |-                |
|GCN1        |+                 |+                |-                |
|GNA13       |-                 |+                |+                |
|GNAI2       |-                 |+                |+                |
|HACD3       |-                 |+                |+                |
|HMOX2       |-                 |+                |+                |
|KIF5A       |-                 |+                |+                |
|KIF5C       |-                 |+                |+                |
|LONP1       |+                 |+                |-                |
|NSF         |+                 |-                |+                |
|PDZD8       |+                 |+                |-                |
|PGRMC1      |-                 |+                |+                |
|PSMC6       |+                 |+                |-                |
|RAB2B       |-                 |+                |+                |
|RAB3GAP2    |+                 |-                |+                |
|RAB6A       |+                 |-                |+                |
|RAP1B       |+                 |+                |-                |
|RCN2        |+                 |-                |+                |
|RTN3        |-                 |+                |+                |
|RTN4        |+                 |-                |+                |
|SLC25A22    |-                 |+                |+                |
|SURF4       |-                 |+                |+                |
|SYNGR3      |-                 |+                |+                |
|VCP         |+                 |+                |-                |

Of these, six proteins (excluding protrudin itself) were identified in all three data sets, and for the most part their interactions with protrudin are well-understood.  VAPA and VAPB are transmembrane ER proteins that interact with the FFAT domain of protrudin to concentrate it at organelle contact sites [@saitaPromotionNeuriteExtension2009].   KIF5A is an isoform of kinesin-1 that binds to protrudin in its coiled-coil domain to drive anterograde transport [@matsuzakiProtrudinServesAdaptor2011, @brachetKinesin1protrudinComplex2021].  COPB2 is a subunit of the COPI complex, which is involved in retrieval of ER proteins from the Golgi [@cossonCoatomerInteractionDiLysine1994].  As protrudin contains a KKRR motif for ER retention, it would be expected to interact with the COPI complex during this process, although this does not appear to have been studied directly.  DNAJA2 and CANX (calnexin) are both common chaperone proteins [@teradaHumanDnaJHomologs2000; @davidInteractionNewlySynthesized1993].  While their exact interactions with protrudin are unclear, they might occur while newly-translated protrudin is being folded.

Gene ontology analysis (biological process enrichment) of the wider overlap data set showed a high representation of proteins involved in vesicular transport, and in particular Golgi-related transport ('intra-Golgi vesicle mediated transport', 'Golgi vesicle transport', 'ER to Golgi vesicle-mediated transport', etc.) (figure \@ref(fig:proteomics-full-figure), panel B).   In contrast to endosomal transport, protrudin's role in Golgi-related transport has not been extensively studied, and we decided to follow this up with further experiments.

(ref:proteomics-cap) A) Venn diagram showing overlap between published lists of protrudin-interacting proteins. B) Top 20 hits of GO biological process enrichment, of all proteins appearing in at least two protrudin interaction sets, sorted by *p* value.
\begin{figure}
\includegraphics{../figures/full/proteomics-full-figure-1} \caption[Data set comparison and gene ontology of conserved protrudin-interacting proteins]{(ref:proteomics-cap)}(\#fig:proteomics-full-figure)
\end{figure}

### HeLa screen for changes in organelle and protein distribution

When protrudin is overexpressed in HeLa cells, it drives the growth of long cellular protrusions that superficially resemble developing neurites [@shiraneProtrudinInducesNeurite2006].  While HeLa cells are genetically and functionally very distinct from neurons, this nevertheless provides a useful model system for examining protrudin's interactions with other cellular components.  Compared to most neuronal cell models, and certainly the rat primary cortical neurons we use for most experiments, HeLa cells are exceptionally quick and easy to grow, transform, and image, allowing for much higher throughput.  We used this system to quickly screen for proteins that colocalise with protrudin in these cellular outgrowths, to identify organelles or complexes that might be transported into axons when protrudin is overexpressed in neurons.

Based on the results of our gene ontology analysis, we selected a panel of antibodies to screen for colocalisation with protrudin in HeLa cells.  These were primarily focused on components of the ER exit site to Golgi secretory pathway, but also included proteins involved in lipid metabolism, signalling, and amino acid transport.


Table: (\#tab:unnamed-chunk-1)Markers for HeLa screen.

|Marker                  |Description                   |
|:-----------------------|:-----------------------------|
|BCAP31                  |ER chaperone                  |
|SURF4                   |ERES cargo loading            |
|MIA3 (TANGO1)           |ERES cargo loading            |
|SEC31A                  |COPII coat component          |
|ERGIC53 (p58)           |ERGIC marker                  |
|GS28                    |Golgi SNARE                   |
|GLG1                    |Golgi glycoprotein            |
|USO1 (p115)             |ER to Golgi vesicle targeting |
|LAMP1                   |lysosome marker               |
|mTOR                    |signalling kinase             |
|ACSL3                   |fatty acid metabolism         |
|SLC38A1                 |glutamine uptake transporter  |
|LC3                     |autophagosome marker          |
|BODIPY TR C~5~ ceramide |ceramide lipid dye            |

#### Protrudin's effect on ER- and Golgi-related organelles

Of the ERES-related proteins, different markers showed different levels of colocalisation with protrudin.  BCAP31 and SURF4 were consistently enriched in cellular protrusions, more so than at other areas of the cell periphery (figure \@ref(fig:HeLa-ERES-grid-full-figure), panels A and B).  MIA3 and SEC31A colocalised well with protrudin in the perinuclear area, but were found at lower levels in protrusions, and were less consistent between cells (figure \@ref(fig:HeLa-ERES-grid-full-figure), panels C and D).  At this stage, it was not possible to conclusively say whether these variations represented differences in how ERES proteins were transported or in how effectively the individual antibodies stained these components, so we decided to proceed with BCAP31 and SURF4, which produced clearer results.

\begin{figure}
\includegraphics{../figures/full/HeLa-ERES-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for BCAP31, SURF4, MIA3, and SEC31A]{Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained for ER/ERES-related markers A) BCAP31, B) SURF4, C) MIA3(TANGO1), and D) SEC31A.  B and D are maximum intensity projections of confocal stacks, while A and C are epifluorescent images.  All scale bars are 20 \textmu{}m.}(\#fig:HeLa-ERES-grid-full-figure)
\end{figure}


Of the Golgi-related proteins, GS28, GLG1, and USO1 clearly labelled the perinuclear Golgi compartment, but were either entirely absent or found only at very low levels in protrusions (figure \@ref(fig:HeLa-Golgi-grid-full-figure), panels B-D).  ERGIC53^[ERGIC53, or LMAN1, is the human homolog of a protein sometimes known as p58 in rat and several other species [@lahtinenMolecularCloningExpression1996].  For the sake of simplicity I will refer to it as ERGIC53 throughout this thesis.], on the other hand, was highly enriched in protrusions, in most cases well above the levels seen in the cell body (figure \@ref(fig:HeLa-Golgi-grid-full-figure), panel A).  More detailed analysis of the ERGIC53 signal showed exceptionally strong colocalisation with protrudin, as shown in figure \@ref(fig:HeLa-Golgi-grid-full-figure), panels E-F.  ERGIC53 showed the strongest concentration in protrusions of any of the markers used in this screen, and point to the ERGIC compartment not only colocalising with protrudin, but specifically playing a role in the growth of cellular protrusions.  This marker was added to the set (along with BCAP31 and SURF4) to examine in neurons.

(ref:Golgi-grid-cap) Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained for ERGIC and Golgi-related markers A) ERGIC53, B) GS28, C) GLG1, and D) USO1(p115).  E) Close up of ERGIC53 staining in the protrusion of a cell expressing WT protrudin, as shown in panel A.  F) Fluorescence profile along the protrusion shown in panel E.  (Continued on following page)
\begin{figure}
\includegraphics{../figures/full/HeLa-Golgi-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for ERGIC53, GS28, GLG1, and USO1]{(ref:Golgi-grid-cap)}(\#fig:HeLa-Golgi-grid-full-figure)
\end{figure}
```{=latex}
\begin{figure}[h]
\contcaption{(Continued) A and B are maximum intensity projections of confocal stacks, C is an epifluorescent image, and D is a maximum intensity projection if a spinning disc confocal stack.  All scale bars are 20 \textmu{}m.}
\end{figure}
```


#### Protrudin's effect on lysosome positioning, enzymes, and transporters

LAMP1 and mTOR, which we expected to move to the cell periphery in response to protrudin overexpression, were present in protrusions at relatively low levels (figure \@ref(fig:HeLa-misc-grid-full-figure), panels A-B).  While protrudin overexpression did result in more puncta away from the perinuclear cluster, this effect was not especially dramatic, and the highest concentrations were still found near the cell nucleus (figure \@ref(fig:HeLa-misc-grid-full-figure), panel B).  This is in contrast with Hong et al., which found a stronger movement away from the nucleus when overexpressing myc-tagged protrudin [@hongPtdIns3PControlsMTORC12017].  However, their culture protocol differed from ours in adding 2 mM supplemental glutamine to the culture media, so the apparent differences could reflect the amino acid dependence of the protrudin-FYCO1 transport mechanism.

ACSL3 was found in cellular protrusions, but — similar to MIA3 and SEC31A — was generally at low levels, and varied considerably between cells (figure \@ref(fig:HeLa-misc-grid-full-figure), panel C).  This may reflect on the antibody used, or may represent more complicated cell-state dependent interaction with other metabolic pathways.  This was not taken forwards.  

Finally, SLC38A1 was found to concentrate in protrusions, and similarly to ERGIC53 was found at higher levels here than near the nucleus (figure \@ref(fig:HeLa-misc-grid-full-figure), panel D).  This result is particularly interesting, as SLC38A1 is a likely cargo of the local secretory pathway. SLC38A1 is a plasma membrane glutamine transporter highly expressed in brain and spinal cord tissue [reviewed in @mackenzieSodiumcoupledNeutralAmino2004].  It plays a role in importing glial-derived glutamine into neurons, which is important for synthesising neurotransmitters GABA and glutamate [@qureshiGlutamineTransporterSlc38a12019].  Matsuzaki et al. identified SLC38A1 in their set of protrudin-interacting proteins, and Shigeoka et al. showed that it was locally translated in RGC axons [@matsuzakiProtrudinServesAdaptor2011; @shigeokaDynamicAxonalTranslation2016]. SLC38A1 was added to the list with BCAP31, SURF4, and ERGIC53 to examine in neurons.  

\begin{figure}
\includegraphics{../figures/full/HeLa-misc-grid-full-figure-1} \caption[Protrudin-expressing HeLa cells stained for LAMP1, mTOR, ACSL3, and SLC38A1]{Representative images of HeLa cells expressing EGFP-tagged protrudin constructs and stained  for A) LAMP1, B) mTOR, C) ACSL3, and D) SLC38A1.  A is an epifluorescent image, B is a maximum intensity projection of a spinning disc confocal stack, and C and D are maximum intensity projections of confocal stacks.  All scale bars are 20 \textmu{}m.}(\#fig:HeLa-misc-grid-full-figure)
\end{figure}



(ref:LC3-cap) A) Representative image of HeLa cells expressing WT protrudin and stained for LC3.  Inset is 20x20 \textmu{}m.  B) Fluorescence profile along the dotted line shown in panel A inset.  Note strong correspondence between protrudin (green) and LC3 (magenta) signal.  (Continued on following page)
\begin{figure}[H]
\includegraphics{../figures/full/LC3-full-figure-1} \caption[Protrudin effect on LC3 localisation in HeLa cells and cortical neurons]{(ref:LC3-cap)}(\#fig:LC3-full-figure)
\end{figure}
```{=latex}
\begin{figure}[h]
\contcaption{(Continued) C) Protrusion of a HeLa cell expressing WT protrudin and stained for LC3.  Note the lack of LC3 enrichment with protrudin in the tip, compared to the cell body.  D) Representative image of a HeLa cell expressing GFP and stained for LC3.  Note the lack of large, ring-shaped structures as seen in the protrudin expressing cell in panel A.  E) Representative images of neurons expressing mRFP1-tagged LC3 showing range of distribution patterns.  F) Quantification of LC3 distributions in cells co-expressing EGFP-protrudin and mRFP1-LC3.  A, C, and D are maximum intensity projections of confocal stacks.  F shows single plane spinning disc confocal images.  \textit{n} = 40 cells per condition across two independent batches.  All scale bars are 20 \textmu{}m.}
\end{figure}
```

#### Other morphological effects of protrudin overexpression

In addition to protrusions, we noted that protrudin overexpression also induces the formation of large, ring-shaped structures in the perinuclear region of HeLa cells.  These are observed occasionally in neurons expressing protrudin, but not to the same extent as in HeLa cells (supplementary figure \@ref(fig:suppl-ring)).  While these structures were not the primary focus of this experiment, they did reveal interesting results with two of the markers screened, and may indicate protrudin involvement in additional cellular pathways.

LC3 strongly colocalised with protrudin in these structures, suggesting that they may represent phagophores or autophagosomes (figure \@ref(fig:LC3-full-figure)).  Notably, LC3 is *not* enriched in cellular protrusions (figure \@ref(fig:LC3-full-figure), panel C), in contrast to the markers discussed above.  This may represent a different pathway activated by protrudin overexpression.  These LC3-labelled structures are also smaller and less abundant in cells expressing only EGFP (figure \@ref(fig:LC3-full-figure), panel D), suggesting that their formation is influenced by protrudin overexpression.

We followed up this result with a pilot experiment in neurons, co-expressing EGFP-protrudin and mRFP1-tagged LC3.  LC3 showed differences in localisation between cells, ranging from fully cytoplasmic to fully punctate, which likely reflects the conversion between soluble LC3-I and membrane-associated LC3-II [@kabeyaLC3MammalianHomologue2000].  All cells expressing either WT or active protrudin contained at least some LC3 puncta, in contrast to control cells, of which 12.5% had fully cytoplasmic LC3.  This suggests that protrudin might be encouraging autophagosome biogenesis, although further experiments are needed to confirm this result.

\vspace{14pt}
\begin{figure}[h]
\includegraphics{../figures/full/ceramide-full-figure-1} \caption[Protrudin effect on BODIPY C$\textsubscript{5}$ ceramide localisation in HeLa cells]{A) Representative image of HeLa cells expressing WT protrudin and stained with BODIPY C$\textsubscript{5}$ ceramide dye.  Maximum intensity projection of a confocal stack.  Inset is 20x20 \textmu{}m.  B) Fluorescence profile along the dotted line shown in panel A inset.  Note BODIPY signal (magenta) between spikes of protrudin (green).  C) Representative image of a HeLa cell expressing GFP and stained with BODIPY C$\textsubscript{5}$ ceramide dye.  Note the lack of large, bright puncta as seen in the protrudin-expressing cell in panel A.  Maximum intensity projection of a confocal stack.  All scale bars are 20 \textmu{}m.}(\#fig:ceramide-full-figure)
\end{figure}

BODIPY C~5~ ceramide, a lipid dye often used to label the Golgi apparatus, strongly labelled the lumen of these organelles.   It is not clear in this context whether the dye is labelling Golgi-related structures or lipid droplets, however it is worth noting that other Golgi markers did *not* colocalise with these structures (e.g. figure \@ref(fig:HeLa-Golgi-grid-full-figure), particularly visible in panel C).  Given the relationship with LC3 as discussed above, this may indicate an increase in lipophagy, although further experiments would be needed to confirm this hypothesis.

## Discussion

### Protrudin's effect on dendritic spine morphology

Protrudin overexpression — or inhibition through the expression of dominant negative mutants — did not substantially influence dendritic spine morphology. Considering the mechanism described in Pedersen et al. (in which protrudin-mediated cellular outgrowth is dependent on interaction with RAB7 and FYCO1), it seems likely that this is another result of the absence of FYCO1 in CNS neurons [@pedersenProtrudinmediatedEREndosome2020].  We cannot, however, rule out an effect of protrudin on dendritic spine function, given that protrudin has already been shown to affect long term depression in hippocampal neurons [@brachetKinesin1protrudinComplex2021].  More work is required to understand the effect of protrudin overexpression on neuronal signalling, and whether this in turn influences survival or regeneration in injured cells.

### The ERES to Golgi pathway

The most significant result presented in this chapter is the link between protrudin and ER-to-Golgi trafficking, first identified from proteomic analysis as presented in figure \@ref(fig:proteomics-full-figure), and then validated in HeLa cells (figure \@ref(fig:HeLa-ERES-grid-full-figure), panels A-B, figure \@ref(fig:HeLa-Golgi-grid-full-figure), panel A, and figure \@ref(fig:HeLa-misc-grid-full-figure), panel D).  This cellular function appears to have been largely overlooked in previous work on protrudin, and could explain some of how protrudin overexpression can promote regeneration of damaged axons.

In non-polarised cells, membrane proteins are typically translated in the ER, released from ERES, trafficked to the Golgi via the ERGIC compartment, and secreted in post-Golgi carriers.  In neurons, several alternate pathways exist to account for the local translation needs of compartments distant from the cell body.  In dendrites, for example, Golgi outposts and satellites fulfill many of the same protein and lipid modification functions as the main Golgi apparatus.  The ERGIC compartment is also involved in a Golgi-bypassing secretory pathway, which has been observed in dendrites [@bowenGolgiindependentSecretoryTrafficking2017].  This is discussed further in the next chapter. 

There is evidence for the local translation of integral membrane proteins in CNS axons [@shigeokaDynamicAxonalTranslation2016], although it is not currently understood how they are trafficked from the ER to the cell surface.  Recent work in DRG neurons has identified a non-conventional secretory pathway involving Golgi satellites and LAMP1-labelled organelles, which plays a role in the delivery of TRPM8 ion channels [@cornejoNonconventionalAxonalOrganelles2020].  It is possible that a similar pathway functions in CNS axons, providing a mechanism through which protrudin expression could promote secretion and growth in the absence of any changes to the cell body Golgi apparatus.  

It is worth noting that three of the four proteins identified in our HeLa screen — ERGIC53, SURF4, and BCAP31 — have been identified in the ERGIC compartment, although BCAP31 localisation may vary by cell type and conditions.  Breuza et al. treated HepG2 liver cancer cells with brefeldin A, which fuses the ER and Golgi but leaves the ERGIC largely intact, to isolate ERGIC proteins, but found that BCAP31 was retained in the ER [@breuzaProteomicsEndoplasmicReticulumGolgi2004].  Other studies found BCAP31 in the ERGIC, using HeLa cells, MCF7 breast cancer cells, or other lines [@delomRegulationCalnexinSubcellular2007, @abeInteractionBap31MHC2009,&nbsp;reviewed in  @quistgaardBAP31PhysiologicalFunctions2021].  Nevertheless, this result suggests a novel role for the ERGIC in protrudin-driven protrusion formation, and potentially in axon regeneration, which is explored further in the next chapter.

### Autophagy and lipids

Our HeLa screen also revealed intriguing effects of protrudin overexpression on autophagy and lipid metabolism, which unfortunately could not be examined further within the scope of this thesis.  Most strikingly, protrudin expression induces the formation of large, ring-like strictures that label strongly for LC3, suggesting an active role in regulating autophagy (figure \@ref(fig:LC3-full-figure)).  This is further supported by preliminary data in rat cortical neurons, which show an increase in punctate as opposed to cytoplasmic LC3, indicating autophagosome formation [@kabeyaLC3MammalianHomologue2000].  This is particularly interesting given the importance of autophagy to neuronal survival and function, and the fact that defects in autophagy often lead to neurodegeneration [reviewed in @overhoffMechanismsNeuronalSurvival2021].  The data presented in figure \@ref(fig:LC3-full-figure) indicate that protrudin expression could encourage autophagy initiation and the formation of autophagosomes, which could plausibly contribute to protrudin's neuroprotective effects.  This should be followed up in a future project, as it seems likely to yield significant results.

It is also worth nothing that this could potentially relate to the the decrease in lysosomal speed seen in figure \@ref(fig:LAMP1-full-figure), panel D, as discussed in the previous chapter.  An increase in autophagy could result in more autophagosomes fusing with lysosomes, resulting in larger and slower-moving autolysosomes containing LAMP1.  However, it is unclear why this would primarily affect anterograde transport, and why the effect is only seen with active protrudin.

The interpretation of protrudin's effect on BODIPY C~5~ ceramide localisation, as presented in figure \@ref(fig:ceramide-full-figure), is significantly less clear, but also worthy of further investigation.  BODIPY C~5~ ceramide typically labels the Golgi apparatus, but these structures do not label for other Golgi markers (figure \@ref(fig:HeLa-Golgi-grid-full-figure), panels B-D) and appear more similar to lipid droplets, although they could be a Golgi-related organelle or otherwise derived from Golgi membranes.  The relationship with LC3-labelled structures seems to suggest some sort of autophagic activity occurring, but whether this is lipophagy of lipid droplets or some other process remains to be seen.  I discuss some current work regarding protrudin and lipid metabolism in section \@ref(discussion-lipids).



<!--chapter:end:text/Chapter_2.Rmd-->

---
output:
  pdf_document: 
    latex_engine: xelatex
  html_document: default
  word_document: default
bibliography: "C:/Users/fiona/Documents/GitHub/Thesis/bib/THESIS.bib"
always_allow_html: true
---

# ER, ERGIC, and Golgi in axons
```{=latex}
\chaptermark{ER, ERGIC, and Golgi}
```




## Introduction

The discovery of local secretory pathways in neurons is fairly recent, but has already contributed significantly to our understanding of how these cells develop and function [@gardiolDendriticPostsynapticProtein1999].  In non-polarised cells, protein translation and modification typically take place near the nucleus, and proteins are then transported to their final destination in, on, or outside of the cell.  While this does also occur in neurons, neurons are also capable of locally translating proteins, which can then be delivered to organelles or inserted into the cell membrane as needed [@meriandaAfunctionalequivalent2009].  It has become increasingly apparent that protein delivery from the cell body is not sufficient to maintain protein turnover at distal parts of the cell, nor is it fast enough to support the dynamic behaviour observed in these regions, for example during axon pathfinding [@courtSlowAxoplasmicTransport2011].  Instead, these regions rely on several overlapping local pathways for protein production, modification, and secretion [reviewed in @gonzalezGolgibypassreview2018].  Recent work has even linked levels of local protein translation to axon regenerative capacity [@vanerpAgerelatedLossAxonal2021], indicating that this process is critically important to promoting CNS regeneration. However, while there is evidence for the activity of a local secretory pathway in dendrites and PNS axons, the same has not yet been demonstrated in CNS axons [@meriandaAfunctionalequivalent2009; @mikhaylovaGS2016; @cornejoNonconventionalAxonalOrganelles2020].

\begin{figure}
\includegraphics{../figures/local-schematic-1} \caption[Schematic of the local secretory pathway]{Schematic showing key components of the local secretory pathway.}(\#fig:local-schematic)
\end{figure}

### ER exit sites and COP vesicles

Key to all of these pathways is the presence of interconnected ER tubules throughout the neuron.  Continuous with the ER network in the soma, these tubules reach into dendrites, into individual spines in an activity-dependent manner [@perez-alvarezEndoplasmicReticulumVisits2020], and down the entirety of the axon.  Among other roles, this ER network provides a platform for local protein translation, and targeting to Golgi-related organelles for further modification.

Membrane proteins translated in the ER are exported via ER exit sites (ERES), typically in structures known as COPII-coated vesicles.  Recent work has demonstrated that these exit sites are complex tubular structures, formed by the interactions of numerous COPII-associated proteins [@weigelERtoGolgiProteinDelivery2021].  A number of different chaperones and cargo receptors are involved in this process, sorting proteins for export and facilitating the budding of these transport intermediates from the ER network.  Aridor and Fish showed that SAR1, a GTPase related to COPII budding, was targeted to mammalian axons during neuronal development, and that this was essential for axonal growth [@aridorSelectiveTargetingER2009].

### The ER-Golgi intermediate compartment

After budding from the ER, COPII-coated vesicles fuse into a dynamic structure known as the ER-Golgi intermediate compartment (ERGIC).  While there is ongoing debate about how the ERGIC is formed and its role in protein secretion and other cellular functions, it is generally accepted to be a site of early protein sorting, with ER-resident proteins transported back to the ER, and other cargo directed to anterograde transport pathways [reviewed in @appenzeller-herzogERGolgiIntermediateCompartment2006; @sarasteIntermediateCompartmentIC2018].  In many cases, these proteins are then passed to the Golgi apparatus or related organelles, although there is some evidence that alternate processing pathways also exist, as discussed in section \@ref(Golgi-bypass).  The definitive marker protein of the ERGIC, ERGIC53 (also known as LMAN1) is a cargo receptor, which is required for the secretion of a number of different glycoproteins [@schweizerIdentificationMonoclonalAntibody1988;&nbsp;reviewed in @hauriERGIC53TrafficSecretory2000].  Mutation of ERGIC53 in humans leads to a rare bleeding disorder, due to decreased secretion of coagulation factors [@nicholsMutationsERGolgi1998].

Besides cargo sorting, other studies have indicated that the ERGIC plays a role in protein quality control, passing misfolded or unfolded proteins back to the ER for degradation [@zuberImmunolocalizationUDPglucoseGlycoprotein2001; @sirkisNeurodegenerationassociatedMutantTREM22017;&nbsp;reviewed in @appenzeller-herzogERGolgiIntermediateCompartment2006; @sarasteIntermediateCompartmentIC2018].  There is also some evidence that the ERGIC might be a source of membrane for the early stages of autophagosome biogenesis [@geERGolgiIntermediate2013].

### Golgi outposts and satellites

The most common destination after leaving the ERGIC is the Golgi, although this can take different forms depending on the region of the cell involved.  In the cell body, this is typically the perinuclear Golgi stack.  In dendrites, proteins may be targeted to Golgi outposts or Golgi satellites.  While these are structurally distinct, they both carry out essential Golgi functions, including protein glycosylation and lipid modifications [@mikhaylovaGS2016;&nbsp;reviewed in @kemalERGolgiTrafficking2022].  Mikhaylova et al. identified glycosylating enzymes, polysaccharides, and sialylated proteins in dendritic Golgi satellites, indicating a range of molecular modifications occurring in these structures [@mikhaylovaGS2016].

Recently, Golgi satellites have also been identified in axons, both in static and dynamically transported populations.  Here, they can act as local glycosylation platforms, similar to in dendrites, but also take part in delivering functional proteins to lysosomes [@liePostGolgicarriers2021] and nerve terminals [@cornejoNonconventionalAxonalOrganelles2020].  Golgi satellite localisation, and by extension their functionality, is dynamically regulated by neuronal activity [@govindActivitydependentGolgiSatellite2021].

### Further processing and protein secretion

After leaving a Golgi-related organelle, membrane proteins can be sorted in endosomes through the retromer complex, which returns cargo receptors to the Golgi.  This complex has been identified in dendrites closely associated with Golgi satellites, suggesting that this sorting also occurs as part of local secretory pathways [@mikhaylovaGS2016].  Recent work has linked retromer dysfunction to a number of neurodegenerative conditions, potentially through changes to the lysosomal proteome [@dalyMultiomicApproachCharacterises2022].

After sorting by the retromer complex, proteins can then be delivered to other organelles or the plasma membrane.  Several studies have found local translation, processing, and secretion of cell surface proteins, including voltage-gated sodium channels at nodes of Ranvier [@gonzalezAxonsprovidesecretory2016].  The exocyst complex facilitates fusion of post-Golgi carriers with the plasma membrane, and interference with this complex has been shown to inhibit neurite growth [@pereiraExocystComplexEssential2022; @swopeExocystComplexRequired2022].

### The Golgi-bypass pathway {#Golgi-bypass}

An alternate, Golgi-bypassing pathway has also been suggested, with cargo moving from the ERGIC to the cell surface via RAB11-marked recycling endosomes.  This has been studied in dendrites, where it was found to play a role in delivering GluA1 glutamate receptors to dendritic spines [@bowenGolgiindependentSecretoryTrafficking2017].  This study does not fully rule out the involvement of Golgi satellites, but does show that this pathway is robust to the disruption of somatic Golgi and Golgi outposts with brefeldin A, indicating a distinction from conventional Golgi processing.  

### Hypothesis and experimental aims

The results of our HeLa cell screen suggest that protrudin has the capacity to relocate ERES components and ERGIC to distal parts of the cell.  We followed up a selection of promising markers in rat cortical neurons to examine whether protrudin overexpression has the same effect in axons.  This could indicate whether protrudin overexpression supports axonal survival and regrowth by relocating protein secretory machinery to the distal axon.



## Methods

General cell culture and microscopy methods can be found in section \@ref(METHODS).

### i3 neuron culture

Human iPSC-derived i3 neurons were cultured as described in [@fernandopulleTranscriptionFactorMediated2018].  After three days of differentiation with doxycycline, neurons were plated on poly-L-ornithine *(Sigma-Aldrich, P3655-50MG)* coated coverslips and grown at 37°C with 7% CO~2~ in BrainPhys media *(STEMCELL Technologies, 05790)* supplemented with B27 *(Thermo Fisher, 17504044)*, BDNF *(PeproTech, 450-02)*, NT-3 *(PeproTech, 450-03)*, and laminin *(Thermo Fisher, 23017015)*.  

### Immunochemistry

Immunochemistry was carried out as described in section \@ref(immuno).  In the case of BCAP31, a biotinylated secondary antibody was added to improve signal, and cells were additionally stained for 1.5 hours at room temperature with dye-conjugated streptavidin *(Thermo Fisher, S11226)*.  All other steps were unchanged.

### Fluorescence quantification

Confocal images were analysed as maximum-intensity stack projections in Fiji.  Tracing of regions of interest was assisted by a custom macro (section \@ref(fluor-quant)).  The area of the nucleus was excluded from cell body quantification.  Background correction was carried out for axon terminals, axons, and dendrites by subtracting the intensity of an identical ROI, manually shifted to avoid overlap with the area of interest.  Cell bodies were not background-corrected, due to brighter overall intensity and the density of neurites and other cellular structures nearby.

### Inhibition of ER to Golgi transport

We tested several inhibitors of either ER to Golgi transport or Golgi function in DIV3 cortical neurons — H-89 (100 \textmu{}M) *(Calbiochem, 371962)*, clofibrate (500 \textmu{}M) *(Sigma-Aldrich, C6643)*, brefeldin A (10 \textmu{}g/mL) *(Calbiochem, 500583)*, and golgicide A *(Calbiochem, 345862)* (10 \textmu{}M).  These concentrations were based on previously published use [@helmsInhibitionBrefeldinGolgi1992; @defigueiredoClofibrateInhibitsMembrane1999a; @gonzalezAxonsprovidesecretory2016; @saenzGolgicideRevealsEssential2009; @weigelERtoGolgiProteinDelivery2021].  Concentration-matched DMSO-only controls were used for each inhibitor.  The inhibitors were added to cells for 30 minutes at 37°C, 7% CO~2~, in supplement-free media, after which cells were fixed.  Given protrudin's effect on ERGIC localisation reported below (figure \@ref(fig:ERGIC53-plot)), we used ERGIC53 staining as a measure of inhibitor function.  We found that H-89 caused growth cone collapse, while the others preserved cellular morphology, and clofibrate led to a slight decrease in ERGIC53 signal in both the cell body and growth cone (data not shown).

Based on these preliminary results, we decided to test if clofibrate could block protrudin's pro-regenerative effect on injured axons.  Unfortunately, this dosage of clofibrate proved highly toxic over the 16-hour timescale required for this experiment.  We were unable to optimise this experiment further, as our regular supply of rats for cortical neuron cultures was disrupted by an animal carriage embargo at Frankfurt airport during the summer of 2022.  We plan to return to this in a future project.

### Scratch assay

Primary rat cortical neurons were cultured on acid-washed glass coverslips coated with PDL as described in section \@ref(CNC).  At DIV14, each coverslip was scratched across once with a sterile needle, then the cells were cultured for a further 18-20 hours before fixing as described previously (section \@ref(immuno)).  


## Results

### ER-Golgi pathway localisation during development {#ER-dev}

We first set about to determine the baseline localisation of our selected markers in rat cortical neurons, and to assess whether this changed during neuronal development, as regenerative ability declines.  We chose DIV3 (the earliest point at which axons can be clearly identified) and DIV15 (synaptic maturation and low regenerative ability) as developmental timepoints to analyse, based on previous work in the lab [@kosekiSelectiveRab11Transport2017; @petrovaProtrudinFunctionsEndoplasmic2020]. We stained cortical neurons for BCAP31, SURF4, ERGIC53, and SLC38A1 at each timepoint, and compared fluorescence intensity between the cell body and axon terminal.  This showed that, with the exception of SURF4, all markers show a relative decline at the axon terminal with maturation (figure \@ref(fig:dev-changed-full-figure)).  Separate analysis of each region reveals that all markers show increased intensity in the cell body at the later timepoint, but that most show no significant change in the axon terminal, with the exception of SLC38A1, which increases (figure \@ref(fig:suppl-dev-grid)).  (This is in keeping with SLC38A1's role as an amino acid transporter, which is a particularly important function for synaptically active neurons [@hellstenNeuronalAstrocyticProtein2017].)  It is worth noting that, while the average intensity might remain the same, the axon terminal generally reduces in size as the cell matures, so this represents a decrease in the total amount of these proteins present at the axon tip (supplementary figure \@ref(fig:suppl-gc-area)).

(ref:dev-change-cap) A) Ratio of fluorescence intensity between Cell body and axon terminal in DIV3 vs DIV15 neurons.  All *n* = 26 or 27 cells per condition across three batches, except SLC38A1 (*n* = 18 cells, three batches). B-M) Representative images of DIV3 neurons (B-E), DIV15 cell bodies (F-I), and DIV15 axon terminals (J-M)  All scale bars are 20 \textmu{}m, and J-M are 20x20 \textmu{}m.  Wilcoxon rank-sum *p* values are shown at the top of each plot.  Markers correspond to the graph at the top of each column.  
\begin{figure}
\includegraphics{../figures/full/dev-changed-full-figure-1} \caption[Developmental changes in marker localisation in cortical neurons]{(ref:dev-change-cap)}(\#fig:dev-changed-full-figure)
\end{figure}

(ref:suppl-dev-cap) Fluorescence intensity of various markers in DIV3 vs DIV15 rat cortical neurons, divided into cell body or axon terminal.  All *n* = 26 or 27 cells per condition across three batches, except SLC38A1 (*n* = 18 cells, three batches).  Wilcoxon rank-sum *p* values are shown at the top of each plot.
\begin{figure}
\includegraphics{./figures/full/suppl-dev-grid-1} \caption[Marker intensity in cell bodies and axon terminals of developing cortical neurons]{(ref:suppl-dev-cap)}(\#fig:suppl-dev-grid)
\end{figure}

The staining was repeated in DIV1 (post-differentiation) i3 neurons, at a stage when they are just beginning to grow axons, to confirm that the axon terminal:cell body ratio was conserved between rodent and human neurons.  This showed remarkable consistency between cell types, with the exception of BCAP31, which had a very slightly higher ratio in rat cortical neurons (figure \@ref(fig:i3-ratio-plot)).

(ref:i3-ratio-cap) A) Ratio of fluorescence intensity between Cell body and axon terminal in DIV1 i3 vs DIV3 rat cortical neurons.  *n* = 17 or 18 i3 neurons per condition across three batches.  *n* = 26 or 27 rat cortical neurons per condition across three batches, except SLC38A1 (*n* = 18 cells, three batches).  B-E) Representative images of DIV1 i3 neurons stained for each marker.  All scale bars are 20 \textmu{}m.  Wilcoxon rank-sum *p* values are shown at the top of each plot.
\begin{figure}
\includegraphics{../figures/full/i3-ratio-plot-1} \caption[Comparison of marker localisation between i3 neurons and rat cortical neurons]{(ref:i3-ratio-cap)}(\#fig:i3-ratio-plot)
\end{figure}

As these results clearly indicate that these secretory pathway markers (with the exception of SURF4) show a relative decline in axon terminals during neuronal maturation, we might expect that treatment with protrudin would increase these concentrations back to early developmental levels to promote axon growth.  

### ER exit site visualisation

We also tested a tool called ESCargo(FTV) to directly visualise ER exit sites [@caslerESC2020; @govindActivitydependentGolgiSatellite2021].  This encodes a SURF4-dependent synthetic secretory cargo that collects at ER exit sites and can be inducibly released from the ER with the addition of a synthetic ligand.  While the aggregates were clearly visible in cell bodies, we also observed them in axons, although they were distributed very sparsely along their length (figure \@ref(fig:ESCargo-figure)).  In some cases, these were found at axonal swellings or branch points, raising the possibility that these exit sites may concentrate at particular structural features.  Our imaging suggests that there are functional ER exit sites in the axons of mature cortical neurons, although further work is required to confirm this result, and to determine whether their size or number is regulated developmentally or with the overexpression of protrudin.

\begin{figure}
\includegraphics{../figures/full/ESCargo-figure-1} \caption[ESCargo localisation in cortical neurons]{A) Cell body of a cell co-expressing EGFP/Emerald with ESCargo(FTV)-Crimson.  Note individual aggregates or small clusters in dendrites, often at branch points.  B) Axon of neuron depicted in A, with two ESCargo(FTV) aggregates circled.  All scale bars are 20 \textmu{}m.}(\#fig:ESCargo-figure)
\end{figure}

### The role of protrudin in localisation and transport

Given the developmental decline in these markers at axon terminals, we were interested to see if protrudin might act by increasing the axonal levels of ER-Golgi pathway components.  We repeated the experiment above in DIV15 rat cortical neurons expressing either EGFP or EGFP-tagged protrudin, and measured the fluorescence intensity in the cell body and axon terminals.

#### BCAP31

BCAP31 showed high variability between cells, particularly in the soma (figure \@ref(fig:BCAP31-plot), panel H).  This may have been a result of signal amplification with a biotinylated secondary antibody, although the smaller range of intensities measured at axon terminals suggests that this may represent natural variation (figure \@ref(fig:BCAP31-plot), panel I).  In any case, while protrudin did appear to decrease cell body BCAP31 levels, this did not translate to a change in the axon terminal:cell body ratio (figure \@ref(fig:BCAP31-plot), panel G).  Therefore, we do not believe that protrudin substantially changes the distribution of BCAP31 in cortical neurons.

Peculiarly, in many cases BCAP31 signal appeared higher in cells expressing either protrudin or control EGFP, compared to untransfected neighbouring cells (data not shown).  It is possible that the levels of this protein are dynamically controlled in response to the cell's overall level of protein synthesis, which may be impacted by exogenous protein expression plasmids.  This should be taken into account in any future experiments examining BCAP31 levels or localisation.

#### SURF4

Unexpectedly, SURF4 *decreased* both in the cell body and axon terminal of cells expressing active protrudin (figure \@ref(fig:SURF4-plot), panels H-I).  However, these decreases were well-matched, resulting in no change to the axon terminal:cell body ratio (figure \@ref(fig:SURF4-plot), panel G).  Notably, SURF4 was the one marker that did not show any change in axon terminal:cell body ratio with neuronal maturation (figure \@ref(fig:dev-changed-full-figure)), and analysis of individual cell compartments showed a developmental *increase* in the soma and a slight but non-significant increase in the axon terminal (figure \@ref(fig:suppl-dev-grid)), so the decrease in overall expression level observed with active protrudin may well indicate a change to a more growth-like state.  That being said, it is unclear how a decrease in SURF4, as a key ERES-associated protein, would relate to increased growth. 

#### SLC38A1

SLC38A1 showed no significant changes with either WT or active protrudin expression, although there was a slight trend towards higher axonal intensity (figure \@ref(fig:SLC38A1-plot)).  As SLC38A1 levels actually increase significantly in both the cell body and axon terminal with neuronal maturation (figure \@ref(fig:suppl-dev-grid)), even as the axon terminal:cell body ratio declines (figure \@ref(fig:dev-changed-full-figure)), it would appear that the availability (or lack thereof) of local secretory machinery in mature axons is not a limiting factor for SLC38A1 abundance.  

#### ERGIC53

In contrast with the other markers, ERGIC53 showed significantly altered localisation with the expression of active, but not wild type, protrudin.  This included a significant increase in axon terminal intensity and axon terminal:cell body ratio, on top of a slight increase in soma intensity (figure \@ref(fig:ERGIC53-plot), panels G-I).  This strongly suggests that protrudin is playing a role in either the formation of ERGIC compartments, or their transport into the distal axon.  As the ERGIC53 axon terminal:cell body ratio typically declines sharply as these cortical neurons mature (figure \@ref(fig:dev-changed-full-figure)), this result is consistent with active protrudin restoring axonal ERGIC53 to early developmental levels.

(ref:BCAP31-cap) A-F) Representative images of BCAP31 in control, WT, and active protrudin-expressing cell bodies (A-C, respectively) and axon terminals (D-F).  All scale bars are 20 \textmu{}m, and D-F are 20x20 \textmu{}m.  G-I) Quantification of BCAP31 fluorescence intensity. *n* = 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}[H]
\includegraphics{../figures/fullBCAP31-plot-1} \caption[BCAP31 localisation in protrudin-expressing neurons]{(ref:BCAP31-cap)}(\#fig:BCAP31-plot)
\end{figure}

(ref:SURF4-cap) A-F) Representative images of SURF4 in control, WT, and active protrudin-expressing cell bodies (A-C, respectively) and axon terminals (D-F).  All scale bars are 20 \textmu{}m, and D-F are 20x20 \textmu{}m.  G-I) Quantification of SURF4 fluorescence intensity. *n* = 17 or 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}[H]
\includegraphics{../figures/fullSURF4-plot-1} \caption[SURF4 localisation in protrudin-expressing neurons]{(ref:SURF4-cap)}(\#fig:SURF4-plot)
\end{figure}

(ref:SLC38A1-cap) A-F) Representative images of SLC38A1 in control, WT, and active protrudin-expressing cell bodies (A-C, respectively) and axon terminals (D-F).  All scale bars are 20 \textmu{}m, and D-F are 20x20 \textmu{}m.  G-I) Quantification of SLC38A1 fluorescence intensity. *n* = 15 to 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot.
\begin{figure}[H]
\includegraphics{../figures/fullSLC38A1-plot-1} \caption[SLC38A1 localisation in protrudin-expressing neurons]{(ref:SLC38A1-cap)}(\#fig:SLC38A1-plot)
\end{figure}

(ref:ERGIC53-cap) A-F) Representative images of ERGIC53 in control, WT, and active protrudin-expressing cell bodies (A-C, respectively) and axon terminals (D-F).  All scale bars are 20 \textmu{}m, and D-F are 20x20 \textmu{}m.  G-I) Quantification of ERGIC53 fluorescence intensity. *n* = 16 or 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}[H]
\includegraphics{../figures/fullERGIC53-plot-1} \caption[ERGIC53 localisation in protrudin-expressing neurons]{(ref:ERGIC53-cap)}(\#fig:ERGIC53-plot)
\end{figure}

### Protrudin's effect on Golgi satellites

Given protrudin's effect on the ERGIC compartment, we were particularly interested in seeing if this also impacted axonal Golgi satellites.  As these are highly dynamic organelles, we decided to look at Golgi satellite transport in the presence of protrudin.  Using rat cortical neurons, we co-expressed mCherry-tagged protrudin constructs with ST3GAL5-EGFP, a marker of Golgi satellites [@mikhaylovaGS2016].  We then imaged the axons in three-minute segments on a spinning disc confocal microscope, as described previously for LAMP1 and RAB7 in section \@ref(lyso-LE).

This revealed no change in overall number of Golgi satellites in the distal axon, but a significant slowing of anterograde transport in cells expressing active protrudin (figure \@ref(fig:ST3GAL5-full-figure), panels B, D).  This mirrors the effect of axonal protrudin on LAMP1 transport, and is discussed further below in section \@ref(GS-discussion).

(ref:ST3GAL5-cap) A) Representative axon image and kymographs showing ST3GAL5 transport in the distal axon of cortical neurons expressing either mCherry (control) or mCherry-tagged protrudin constructs.  All scale bars are 20 \textmu{}m.  B) Total number of ST3GAL5-labelled organelles in each cell imaged.  C) Average run length (per cell) of moving Golgi satellites  D) Average Golgi satellite velocity (per cell).  *n* = 22 or 24 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot; significant *p* values from Dunn's post-hoc test with Bonferroni correction for multiple comparisons are shown over brackets.
\begin{figure}
\includegraphics{../figures/full/ST3GAL5-full-figure-1} \caption[Protrudin effect on Golgi satellite (ST3GAL5) transport in the distal axon]{(ref:ST3GAL5-cap)}(\#fig:ST3GAL5-full-figure)
\end{figure}

Following live imaging, these cells were fixed, and imaged at higher exposure on a confocal microscope to more clearly visualise Golgi satellites in the axon.  We measured both the number of puncta as well as point intensity of each, as a proxy for size.  This confirmed that protrudin overexpression did not affect the overall number of Golgi satellites in the distal axon, nor did it appear to affect the size of these organelles (figure \@ref(fig:GS-puncta-full-figure)).

(ref:GS-puncta-caption) A) Representative axon image showing ST3GAL5 puncta.  Scale bar is 20 \textmu{}m.  B) Zoomed-in view of the 20 x 20 \textmu{}m box in panel A.  Counted puncta are indicated by arrows.  C) Number of puncta per \textmu{}m of axon imaged.  D)Point fluorescence intensity of each ST3GAL5 puncta counted.  *n* = 18 cells per condition across three independent batches.  Kruskal-Wallis *p* values are shown at the top of each plot.
\begin{figure}
\includegraphics{../figures/full/GS-puncta-full-figure-1} \caption[Protrudin effect on Golgi satellite abundance and size in the distal axon]{(ref:GS-puncta-caption)}(\#fig:GS-puncta-full-figure)
\end{figure}

We then conducted a scratch assay to determine the localisation of Golgi satellites in the growth cones of mature neurons and examine whether protrudin might have an effect on axonal Golgi satellites in response to injury.  Cortical neurons cultured on glass coverslips were scratched with a sterile needle, then incubated for 18-20 hours before fixing.  Axons growing into the scratched region were imaged on a confocal microscope.  While this method cuts axons, dendrites, and cell bodies indiscriminately, and does not directly measure regeneration, it is useful for isolating growth cones in mature (DIV15) cortical neurons.

This revealed a strong concentration of ST3GAL5 at the base of each growth cone, with slightly weaker signal extending further distally (figure \@ref(fig:scratch-assay-full), panels A-C).  Where ST3GAL5 was co-expressed with protrudin, it is apparent that the Golgi satellite signal reaches further into the growth cone than the ER (figure \@ref(fig:scratch-assay-full), panels E-F).  This suggests that there are distinct ER and Golgi compartments in the growth cone, with secretory machinery oriented towards the direction of growth.  The images also suggest that there might be an accumulation of ST3GAL5 immediately proximal to the growth cone in protrudin-expressing neurons (figure \@ref(fig:scratch-assay-full), panels E-F), although further work is required to confirm and quantify this result.

\begin{figure}
\includegraphics{../figures/full/scratch-assay-full-1} \caption[Scratch assay of neurons co-expressing protrudin and ST3GAL5]{Representative images of growth cones on DIV15 cortical neurons after scratch.  Neurons are co-expressing either mCherry (A) or mCherry-protrudin (B-C) with ST3GAL5-EGFP.  Scale bars are 20 \textmu{}m.  D-F) 20x20 \textmu{}m images highlighting the growth cone details shown in A-C.  Arrows indicate large Golgi satellites, as well as the distal edge of protrudin localisation.  Note how the ST3GAL5 signal extends beyond protrudin in these growth cones.}(\#fig:scratch-assay-full)
\end{figure}

## Discussion

### Protrudin's effects on the local secretory pathway

#### Increased ERGIC53 in axon terminals

These results provide an insight into how protrudin might regulate local secretory pathways in the axon.  While protrudin does not appear to change the distribution of primarily ERES-associated proteins, such as BCAP31 and SURF4, active protrudin does significantly increase the relative level of ERGIC53 in axon terminals.  

As the ERGIC is a distinct compartment from the ER, this suggests a secretory role for protrudin beyond its effects on the axonal ER.  It is not yet clear if this represents an increased formation of ERGIC from ERES-derived vesicles in the axon, or increased transport of these structures from elsewhere in the cell.  Further work will use a GFP-tagged ERGIC53 construct to examine whether the ERGIC compartments are transported axonally, and whether this transport is affected by protrudin.  In any case, the increase in ERGIC observed with protrudin expression should be beneficial to local protein production and secretion, and providing the machinery for efficient cargo sorting might allow for increased growth after axonal injury.

#### Slower Golgi satellite transport {#GS-discussion}
 
This is further supported by our finding that active protrudin affects Golgi satellite transport in the distal axon.  Unexpectedly, we found slower transport of Golgi satellites in the distal axon, particularly in the anterograde direction, despite unchanged run length or overall number of organelles.  Further experiments are required to identify a mechanism for this change, although it could represent a sustained interaction with another organelle during transport, potentially ERGIC or a related compartment.

If this interaction is between Golgi satellites and lysosomes, this could explain the slight slowing of lysosomes observed previously with active protrudin (figure \@ref(fig:LAMP1-full-figure), panel D).  Lie et al. identified 'post-Golgi carriers' as the source of degradative enzymes for maturing axonal lysosomes, which could indicate just such an interaction [@liePostGolgicarriers2021].  However, the marker they used for the carriers (*trans*-Golgi marker TGN38) is not commonly found in Golgi satellites, so this might represent a distinct organelle [@mikhaylovaGS2016].

The marker we used for Golgi satellites — ST3GAL5 — gives us some hints as to how Golgi satellite interactions in the axon might relate to growth and regenerative function.  ST3GAL5 is a lipid sialylation enzyme, and synthesises a ganglioside (a type of modified glycolipid) known as GM3.  ST3GAL5 mutations in humans are linked to severe neurological syndromes, indicating a key role in normal CNS function.  Furthermore, other gangliosides produced downstream of GM3 have been shown to increase regeneration in several different models of axon injury, indicating another mechanism through which protrudin might promote regeneration [@kappagantulaNeu3SialidaseMediatedGanglioside2014; @benadyGM1GangliosidePrevents2018]

That being said, it remains to be seen how protrudin's effect on Golgi satellite *transport* translates into an effect on Golgi satellite *function* in the axon.  It could reasonably be argued that slower transport would decrease the number of inter-organelle contacts made by each satellite, thereby decreasing their effect (e.g. in the case of lysosomal enzyme delivery, as suggested by Lie et al.) [@liePostGolgicarriers2021].  Conversely, it would not be unreasonable to suggest that slower transport might indicate more prolonged interactions, for example with ERGIC, that could increase their ability to receive secretory cargo and allow enzymes such as ST3GAL5 to carry out their functions.  Further work is required to better understand which organelles interact with Golgi satellites in the axon, and how these interactions are influenced by protrudin.

#### Golgi satellites in the growth cone

Our scratch assay also revealed a concentration of Golgi satellites in the growth cones of mature neurons.  While these results are only preliminary, they suggest a key role for Golgi satellites in axonal growth.  The additional observation of an additional ST3GAL5 accumulation proximal to the growth cone in protrudin-expressing neurons is also interesting — while it is not immediately clear what this represents, it might indicate a further increase in secretory machinery in the distal axon, which could promote regeneration.

These findings indicate that protrudin overexpression, particularly active protrudin, has a significant impact on the local secretory machinery present in the axon, which may play a role in mediating protrudin's neuroprotective and regenerative effects.  Additionally, these results may account for the finding that active protrudin has a stronger regenerative effect than WT protrudin, but that the two constructs do not significantly differ in measures of RAB11 or integrin transport [@petrovaProtrudinFunctionsEndoplasmic2020].

<!--chapter:end:text/Chapter_3.Rmd-->

---
output:
  word_document: default
  html_document: default
  pdf_document: default
---

# Discussion {.unnumbered #DISCUSSION}

```{=latex}
\markboth{DISCUSSION}{}
\setcounter{chapter}{4}
\setcounter{section}{0}
\setcounter{figure}{0}
```

## Results

### Protrudin's role in axonal transport

Perhaps the most surprising finding of this project has been that protrudin overexpression has little if any effect on lysosome or late endosome transport in cortical neurons.  Initially, this seems to conflict with previous work in other cell types, which suggest that protrudin has a strong effect on late endosome transport and positioning, [@raiborgRepeatedEREndosome2015; @hongPtdIns3PControlsMTORC12017].  However, this is in fact consistent with the mechanism proposed in those studies,  which identifies FYCO1 as the actual adaptor between late endosomes and kinesin.  As numerous RNAseq data sets show that there is extremely little FYCO1 in CNS neurons (figure \@ref(fig:FYCO1-RNAseq-full-figure)), it seems likely that this mechanism is not active in these neurons.  Instead, anterograde lysosome/late endosome transport in axons is probably mediated primarily by the BORC/ARL8B/SKIP mechanism, as suggested by Farias et al. [@fariasBORCKinesin1Ensemble2017].

This apparent cell-type variability in protrudin function has important implications for its development as a regenerative gene therapy.  Further work will be required to characterise the effects of protrudin overexpression on different cell types and tissues, and to ensure that therapeutic vectors target protrudin expression to the correct cellular population.

In addition, this finding raises interesting questions about the role of FYCO1 in regeneration.  As FYCO1 appears to facilitate protrudin's role in cellular outgrowth, but is largely absent from mature CNS neurons, it is possible that FYCO1 expression is correlated with the intrinsic regenerative capacity of different cell types.  Investigating this further might shed more light on why most CNS neurons are such poor regenerators, and identify novel targets to promote regeneration.

The effect of active protrudin on Golgi satellite transport (figure \@ref(fig:ST3GAL5-full-figure)), in contrast with late endosomes (in particular those marked by RAB7, as shown in figure \@ref(fig:RAB7-full-figure)), shows that protrudin has specific and distinct effects on different organelles in the axon.  This is further confirmed by Petrova et al., which showed that both wild type and active protrudin increased the number of RAB11 recycling endosomes in the distal axon, an effect not seen with any of the transport markers used in this thesis [@petrovaProtrudinFunctionsEndoplasmic2020].  Based on these results, we can confidently say that protrudin does not indiscriminately increase axonal transport or localisation, but rather specifically mediates the organisation and behaviour of particular organelles through distinct mechanisms.


### Protrudin's role in local translation

Given its effect on ERGIC localisation (figure \@ref(fig:ERGIC53-plot)) and the dynamics of Golgi satellite transport (figure \@ref(fig:ST3GAL5-full-figure)), it appears that protrudin overexpression — particularly active protrudin — has a significant effect on the local secretory machinery in axons.  Considering the importance of local translation on axon function and growth, as discussed previously, it is easy to see how this might contribute to both protrudin's neuroprotective and regenerative effects.  Additionally, recent work has indicated a direct link between the level of local translation in axons and their regenerative capacity, supporting the idea that protrudin could act by coordinating machinery for local protein synthesis and processing [@vanerpAgerelatedLossAxonal2021].

This is worth considering in the context of the previous finding that protrudin increases the amount of RAB11 recycling endosomes in the distal axon [@petrovaProtrudinFunctionsEndoplasmic2020].  Bowen et al. showed that recycling endosomes can play a role in the secretion of locally translated proteins in dendrites, either through Golgi satellites or entirely bypassing Golgi-related compartments [@bowenGolgiindependentSecretoryTrafficking2017].  Therefore, it is possible that these endosomes also comprise part of the secretory machinery in axons, in addition to ERGIC and Golgi satellites. 

Further work will be required to identify the molecular mechanisms at play in this process, and whether it is a result of direct protrudin interactions or is downstream of other cellular effects.  This may well vary for each component of the secretory pathway — for example, protrudin can bind to RAB11 directly to facilitate recycling endosome transport, but no such interactions have yet been identified for ERGIC or Golgi satellites.  However, the presence of numerous Golgi-related proteins in protrudin interactomes (figure \@ref(fig:proteomics-full-figure)) strongly suggests a direct involvement in ER-Golgi interactions.


## Future directions

While this project has provided some answers to how protrudin can promote survival and regeneration, it also raises new questions which should be addressed in future studies.  In addition to the follow-up experiments mentioned above, several other systems should be investigated in the context of protrudin overexpression to understand their impact on its neuroprotective and regenerative effects.

### Autophagy

Protrudin's effects on LC3 localisation, both in HeLa cells and cortical neurons (figure \@ref(fig:LC3-full-figure)), suggest an active role in regulating autophagy.  The preliminary results demonstrated in this project suggest that protrudin may increase autophagy or autophagosome biogenesis.  However, Hong et al. actually found the opposite — protrudin *depletion* promoted autophagy initiation in cultured epithelial cells [@hongPtdIns3PControlsMTORC12017].  

It is very likely that this effect varies by cell type, similar to the effect on lysosomal transport, and for the same reason — FYCO1 acts as an adaptor for autophagosome transport, and is involved in autophagosome maturation [@pankivFYCO12010; @olsvikFYCO1ContainsCterminally2015].  However, there are other potential mechanisms through which protrudin could affect neuronal autophagy in the absence of FYCO1, as both ER contact sites and RAB11 endosomes have been implicated in early autophagosome formation [@bieberSituStructuralAnalysis2022; @puriRAB11APositiveCompartmentPrimary2018]

With this in mind, it would be worthwhile to examine further what effect protrudin overexpression has on autophagy, particularly in CNS neurons.  Given the abundance of literature linking autophagy to neuronal survival [reviewed in @overhoffMechanismsNeuronalSurvival2021], this may well represent another pathway through which protrudin acts, particularly in a neuroprotective role.

### Lipids {#discussion-lipids}

Numerous results throughout this thesis suggest a link between protrudin and lipid metabolism.  The gene ontology analysis in section \@ref(GO-analysis) highlighted a number of protrudin interactions with genes involved in lipid metabolism.  The unusual localisation of BODIPY C~5~ ceramide in HeLa cells expressing protrudin also supports the idea of an effect on lipid pathways in the cell (figure \@ref(fig:ceramide-full-figure)).  Furthermore, the enzyme ST3GAL5, used in this thesis as a marker for Golgi satellites, is an enzyme important for the production of gangliosides, glycolipids that form a key component of neuronal cell membranes and are important for axonal growth and maintenance [reviewed in @sipioneGangliosidesBrainPhysiology2020].  Given protrudin's effect on the transport of these organelles, this could suggest a change to how lipids are metabolised and processed in the axon.  Ewan et al. identified changes in lipid metabolism as a key factor distinguishing PNS from CNS axon regeneration, suggesting that protrudin could potentially promote regeneration through these pathways [@ewanAscendingDorsalColumn2021].

In a collaborative project with the Williams lab at the Karolinska Institutet, mice were injected intravitreally with AAV2 encoding the CAG protrudin constructs used in this thesis.  Lipid mass spectroscopy of these mice's optic nerves showed that either WT or active protrudin expression decreased the level of ceramides while increasing hexosylceramides, pointing to an effect on sphingolipid synthesis pathways (data not shown).  Further work is ongoing in this area to understand how protrudin overexpression influences lipid pathways in the cell, and what effect this has on neuronal survival and regeneration.

### Mitochondria

Previous work has suggested that protrudin may play a role at ER-mitochondrial contact sites [@elbaz-alonPDZD8InteractsProtrudin2020; @chingQuantifyingInterorganelleMembrane2021], although it is not yet clear what effects this may have on the cell.  Preliminary EM data from another collaboration with the Williams lab show some unusually long mitochondria in the optic nerves of mice expressing active protrudin, which were not observed with a GFP control (data not shown).  Work is ongoing to confirm this result and examine potential mechanisms.

## Implications for glaucoma therapy

Given that the initial aim of this project was to develop protrudin into a gene therapy for glaucoma, it is worth considering these findings in that context.  While we were unable to perform *in vivo* experiments during this project, the results presented in this thesis still have important implications for future work in this area.

As discussed above, the lack of any apparent effect of protrudin expression on axonal lysosome and late endosome transport, due to the absence of FYCO1, indicates that protrudin is likely to have very different effects on different cell types.  While initial *in vivo* experiments with protrudin have shown very positive results, with significantly improved retinal ganglion cell survival and regeneration after an optic nerve crush, care should be taken to look out for any expression outside of this target cell population, and to characterise the effect of protrudin overexpression in glial and epithelial cell lines [@petrovaProtrudinFunctionsEndoplasmic2020].  

Furthermore, the results presented in chapters 2 and 3 of this thesis identify a new cellular system — the local secretory pathway — through which protrudin might act to promote survival and regeneration in CNS neurons.  Other components of this pathway, particularly any that might regulate localisation or inter-organelle interactions, should therefore be examined for potential neuroprotective and regenerative benefits.  While it may be possible to identify entirely new gene therapy candidates in this way, it might also be possible to identify proteins that can act synergistically with protrudin for improved therapeutic effects.  

## Conclusion — A unifying site of action

The results of this project, taken in combination with previous work, suggest that protrudin is coordinating an 'axon trafficking centre', increasing ER tubules, ERGIC, and recycling endosomes — all key components of the local secretory pathway — in the distal axon.  Through the actions of the virtuous cycle, this arrangement of organelles can promote integrin delivery, facilitate local protein translation and processing, and encourage growth-promoting signalling cascades to increase survival and axonal regeneration.

Whether this coordination occurs through direct interactions or downstream of other cellular effects is unclear, but it seems likely that this is a contributing factor to protrudin's effectiveness as a CNS therapy.  Future work in this area should be focused on the structure and nature of interactions between pathway components (ER, ERGIC, Golgi satellites, and endosomes), how they are recruited to sites of axonal injury or degeneration, and whether they are directly associated with regenerative ability.


<!--chapter:end:text/Discussion.Rmd-->


# Appendix {.unnumbered #APPENDIX}

```{=latex}
\markboth{APPENDIX}{}
\setcounter{chapter}{5}
\setcounter{section}{0}
\setcounter{figure}{0}
```

## Supplementary Figures {#SUPPLEMENT}






\begin{figure}
\includegraphics{./figures/full/suppl-ring-1} \caption[Supplementary figure; Example image of a ring-like structure in a neuron]{Example image of a ring-like structure in a neuron co-expressing active protrudin and LAMP1.  Note that LAMP1 does not label the structure directly, but appears to label an adjacent organelle.  The larger rings towards the top of the cell have a much dimmer protrudin 'ring', and appear to be vacuoles.  Scale bar is 20 \textmu{}m.}(\#fig:suppl-ring)
\end{figure}

<!-- Note: won't render without Ch3. -->
(ref:suppl-gc-cap) Axon terminal area of DIV3 vs DIV15 rat cortical neurons, A) for each marker and B) pooled together.  All show a significant decrease in axon terminal area during development, with the exception of SURF4.  Given the substantially smaller measurements in DIV3 neurons stained for SURF4 compared to other markers, this suggests that SURF4 is confined to the central region of the developing growth cone.  All *n* = 26 or 27 cells per condition across three batches, except SLC38A1 (*n* = 18 cells, three batches).  Wilcoxon rank-sum *p* values are shown at the top of each plot.
\begin{figure}
\includegraphics{./figures/full/suppl-gc-area-1} \caption[Supplementary figure; axon terminal area in developing cortical neurons]{(ref:suppl-gc-cap)}(\#fig:suppl-gc-area)
\end{figure}



## Plasmid Maps {#plasmid-maps}

![](../figures/plasmid-maps-1-1.png)<!-- --> 

![](../figures/plasmid-maps-2-1.png)<!-- --> 

![](../figures/plasmid-maps-3-1.png)<!-- --> 


## Code {#CODE}

In this section, I have included many of the ImageJ macros (written in the ImageJ Macro language) and R scripts that I wrote to simplify collecting and analysing data over the course of this project.  All are freely available to use and modify; if you use them extensively for your own work, please cite this thesis.  You might find the occasional 'TODO' in with the more descriptive comments; I have left these in place as suggestions for future improvements.

### ImageJ Macros

#### Axon puncta counter
Used to streamline the process of manually counting axonal puncta, as in \@ref(fig:GS-puncta-full-figure).  Displays the first image from each timelapse stack in a directory, plots a low-opacity trace of the axon to be analysed, and selects the multipoint tool for the user.  Results are saved to a CSV file at the end of the batch.  Requires a folder of STK or TIF image stacks and RGN or ROI files with matching names. 

``` cpp
setBatchMode(false);//interactive

function main(i){
	//---duplicate fist frame of stack, close original, and make all changes on duplicate---
	rename("orig");
	run("Duplicate...", "title=["+getInfo("image.filename")+"_duplicate] duplicate range=1-1");
	close("orig");
	rename("duplicate");//for closing later and to obscure file name for blind analysis

	//---load and measure ROI, draw transparent over image---
	//loaded in batch runner
	//run("ROI Manager...");
	roiManager("select", 0);
	run("Measure");
	ROI_length = getResult("Length", 0);
	roiManager("Show All");

	//---multipoint tool, dialog to confirm---
	close("Results");
	setTool("multipoint");
		
	Dialog.createNonBlocking("Confirm points");
	Dialog.addMessage("Click 'OK' to confirm points.");
	//TODO - option to skip/exclude?
	Dialog.show();
	
	run("Measure");//will count 1 if no points added - defaults to last active ROI
	//check if any points have been added
	if(selectionType() == -1){//no points added
		count = 0;
	}
	else{
		count = getValue("results.count");
	}
		
	//---write filename, point count, ROI length to Table---
	selectWindow("Puncta counts");//TODO pass as parameter
	Table.set("File", i, stacks[i]);
	Table.set("ROI_length", i, ROI_length);
	Table.set("Count", i, count);
	Table.update();
	
	//---close image and extra windows
	close("duplicate");//not working
	//tables handled in batch runner
}

//---batch runner---
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "puncta_counts");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.show();
ext = Dialog.getChoice();

files = getFileList(dir);
//exclude directories
temp_stacks = newArray(0);
temp_ROIs = newArray(0);
for(i = 0; i < files.length; i++){
	if(!endsWith(files[i], "/")&&!endsWith(toLowerCase(files[i]), ".ini")){
		if(endsWith(toLowerCase(files[i]), ".stk")||endsWith(toLowerCase(files[i]), ".tif")){
			temp_stacks = Array.concat(temp_stacks,files[i]);
		}
		//if(endsWith(toLowerCase(files[i]), ".roi")){
		//	temp_ROIs = Array.concat(temp_ROIs,files[i]);
		//}
	}
}
stacks = temp_stacks;
//rois = temp_ROIs//unnecessary?
shuffle(stacks);//random order to reduce bias

//create custom results table
Table.create("Puncta counts");
Table.setColumn("File", newArray(0));
Table.setColumn("ROI_length", newArray(0));
Table.setColumn("Count", newArray(0));
	
for(i = 0; i < stacks.length; i++){
	open(dir + stacks[i]);
	
	//find and open matching ROI
	if(ext == "stk") {roi_name = replace(replace(stacks[i], ext, "roi"), "_W\\d+_T", "");}
	else {roi_name = replace(replace(stacks[i], ext, "roi"), "_ch\\d+.*(?=\\.roi$)", "");}

	roiManager("open", dir + roi_name);
	roiManager("Select", 0);
	roiManager("Rename", "axon");//obscure name for impartiality while tracing

	main(i);
	//Close results, images, etc.//close("*");
	saveAs("Results", dir + "puncta_counts/" + stacks[i] + "_puncta.csv");
	roiManager("reset");	
	run("Clear Results");
}

//save table
selectWindow("Puncta counts");
Table.save(dir + "puncta_counts/counts.csv");

//-------------------------------
//Fisher Yates shuffle, from ImageJ example macro RandomizeArray.txt
function shuffle(array) {
   n = array.length;  // The number of items left to shuffle (loop invariant).
   while (n > 1) {
      k = randomInt(n);     // 0 <= k < n.
      n--;                  // n is now the last pertinent index;
      temp = array[n];  // swap array[n] with array[k] (does nothing if k==n).
      array[n] = array[k];
      array[k] = temp;
   }
}

// returns a random number, 0 <= k < n
function randomInt(n) {
   return n * random();
}
```
#### Dendrite section crop {#dend-crop}
Used to crop dendrite sections of a defined length for spine tracing or counting.  Can run on individual images or a folder of cell body images.  Could also be used for axon sections or other cell projections, but will only measure and crop in straight lines.

``` cpp
setBatchMode(false);//interactive

function main(){
	//---duplicate image, close original, and make all changes on duplicate---
	rename("orig");
	run("Duplicate...", "title=["+getInfo("image.filename")+"_duplicate] duplicate");
	close("orig");
		
	//---resize to avoid cutting off edges during rotation step---
	getDimensions(width, height, channels, slices, frames);
	diagonal = Math.ceil(sqrt(width*width + height*height)); //not sure what ^2 is doing but it's definitely not squared
	run("Canvas Size...", "width=" + diagonal + " height=" + diagonal + " position=Center zero");
		
	//---establish scale and desired length to measure---
	Dialog.createNonBlocking("Select dendrite segment");
	Dialog.addNumber("Scale (pixels/micron)", 6.25);
	Dialog.addNumber("Segment length (microns)", 20);
	Dialog.addNumber("Width for cropping (pixels)", 120);
	Dialog.addMessage("Please use the straight line tool to select a segment of dendrite, then click 'OK'.");
	Dialog.show();
	scale = Dialog.getNumber();
	segment = Dialog.getNumber();
	cropwidth = Dialog.getNumber();
	
	run("Set Scale...", "distance=" + scale + " known=1 unit=μm");
	//still operates in pixels - adjust to pixel length for setting newX/newY
	pixLength = scale*segment;
	
	getSelectionCoordinates(X,Y);//missing ; here?
	Angle = getValue("Angle");
	Length = getValue("Length");
	rAngle = Angle * PI/180;
		
	//---create new line from same starting point to desired length---
	newX = Math.ceil(X[0] + pixLength*cos(rAngle));
	newY = Math.ceil(Y[0] - pixLength*sin(rAngle));
	
	makeLine(X[0], Y[0], newX, newY);
		
	//---confirm new line before cropping---
	Dialog.createNonBlocking("Confirm dendrite segment");
	Dialog.addMessage("Click 'OK' to confirm segment.");
	Dialog.show();
		
	//---rotate and crop image---
	//image
	run("Rotate... ", "angle=" + Math.round(Angle) + " grid=1 interpolation=Bilinear");
	//ROI
	run("Rotate...", "rotate angle=" + Math.round(Angle));
	
	getSelectionCoordinates(rX, rY);
	makeRotatedRectangle(rX[0], rY[0], rX[1], rY[1], cropwidth);
	run("Crop");
}

//---batch runner---
Dialog.create("Batch selection");
Dialog.addCheckbox("Run as batch?", true);
Dialog.show();
batch = Dialog.getCheckbox();

if(batch){
	//TODO - directory selection and iteration
	//main();//placeholder
	dir = getDirectory("Choose a Directory");
	File.makeDirectory(dir + "dendrite_sections");
	
	files = getFileList(dir);
	//exclude directories
	temp = newArray(0);
	for(i = 0; i < files.length; i++){
		if(!endsWith(files[i], "/")&&!endsWith(toLowerCase(files[i]), ".ini")){
			temp = Array.concat(temp,files[i]);
		}
	}
	files = temp;
	print(files.length);
	print(files[0]);
		
	for(i = 0; i < files.length; i++){
		open(dir + files[i]);
		print(getTitle());
		main();
		saveAs("Tiff", dir + "dendrite_sections/" + files[i] + "_DENDRITE.tif");
		close("*");
	}
}
else{
	main();
}
```
#### Dendritic spine measurement export
Exports a CSV of dendritic spine lengths, after each has been traced with a segmented line and added to the ROI manager.  Also saves the ROIs to a ZIP file.

``` cpp
//For saving ROIs and measurements from traced (segmented line) dendritic spines

dir = getDirectory("image");
File.makeDirectory(dir + "spines");

roiManager("Measure");

img = getTitle();

num = roiManager("count");
for (i=0; i<num; i++){
	setResult("file", i, img);
}

saveAs("Results", dir + "spines/" + img + "_spines.csv");

//Save ROIs
roiManager("Save", dir + "spines/" + img + "_spines.zip");
```
#### Maximum intensity projection batch runner
Runs over a folder of TIF or STK stack files to quickly generate maximum intensity projections for each.

``` cpp
setBatchMode(true);

//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "max_projections");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.show()

ext = "." + Dialog.getChoice();

files = getFileList(dir);
stacks = newArray(0);

print(ext);
print(files.length);

//select stacks for processing
for(i = 0; i < files.length; i++){
	if(endsWith(toLowerCase(files[i]), ext)){
		stacks = Array.concat(stacks,files[i]);
	}
}

print(stacks.length);

for(i = 0; i < stacks.length; i++){
	showProgress(i, stacks.length);
	open(dir + stacks[i]);

	rename("orig");//original file
	run("Z Project...", "projection=[Max Intensity]");
	close("orig");

	saveAs("Tiff", dir + "max_projections/" + stacks[i] + "_MAX.tif");
}
```
#### Sort mixed TIF files into stacks
Works through a folder of individual slice TIF files (e.g. those generated by the LAS-AF export tool) and attempts to create Z-stacks by matching file names.  This is somewhat configurable, but is designed to work on images named in the format 'condition_cell_slice_channel', for example GFP_C1_z00_c01.  Can also be re-run over the generated folder of TIF stacks to create multi-channel hyperstacks. 

``` cpp
//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
file_list = getFileList(dir);

output = newArray("stacks", "hyperstacks");
Dialog.create("Output type");
Dialog.addRadioButtonGroup("Output", output, 2, 1, "stacks");
Dialog.show();

out = Dialog.getRadioButton();

//filter to TIFs only
files = newArray(0);
for(i=0; i<file_list.length; i++){
	if(endsWith(file_list[i], ".tif")){
		files = Array.concat(files, file_list[i]);
	}
}

File.makeDirectory(dir + out + "/");

//configurable

Dialog.create("Setup");
Dialog.addMessage("Please enter the format of your file names between '.lif' and '.tif'.\nThe keywords 'condition', 'cell', 'slice', and 'channel'\nstand in for the corresponding values.");
Dialog.addString("Format", "_condition_cell_slice_channel", 50);
Dialog.addCheckbox("No .lif prefix", false);
Dialog.show();

structure = Dialog.getString();
no_pref = Dialog.getCheckbox();

//structure = "_condition_cell_slice_channel"
regex_start = ".*\\.lif"
regex_condition = "[A-Za-z0-9\\-]+"
regex_cell = "[A-Za-z0-9\\-\\.\\_]+"
regex_slice = "[zt][0-9]+"
regex_channel = "ch[0-9]+"
regex_end = "\\.tif"

if(no_pref == true){
	regex_start = "^";
}

regex_structure = structure_to_regex(structure, regex_condition, regex_cell, regex_slice, regex_channel);
regex_structure = regex_start + regex_structure + regex_end;

//pull conditions
if(indexOf(structure, "condition") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "condition")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "condition") + 9), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		cond = replace(files[i], pre_regex, "");
		cond = replace(cond, post_regex, "");
		
		if(List.get(cond) == ""){
			List.set(cond, cond);
		}
	}
	
	List.toArrays(cond_keys, cond_values);
}
else{
	cond_values = newArray("");
}

//pull cells
if(indexOf(structure, "cell") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "cell")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "cell") + 4), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		cells = replace(files[i], pre_regex, "");
		cells = replace(cells, post_regex, "");
		
		if(List.get(cells) == ""){
			List.set(cells, cells);
		}
	}
	
	List.toArrays(cells_keys, cells_values);
}
else{
	cells_values = newArray("");
}

//pull channels
if(indexOf(structure, "channel") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "channel")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "channel") + 7), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		chan = replace(files[i], pre_regex, "");
		chan = replace(chan, post_regex, "");
		
		if(List.get(chan) == ""){
			List.set(chan, chan);
		}
	}
	
	List.toArrays(chan_keys, chan_values);
}
else{
	chan_values = newArray("");
}

Array.print(cond_values);
Array.print(cells_values);
Array.print(chan_values);

//possible combinations
for(i=0; i<cond_values.length; i++){
	condition = cond_values[i];
	for(j=0; j<cells_values.length; j++){
		cell = cells_values[j];
		for(k=0; k<chan_values.length; k++){
			channel = chan_values[k];

			regex = replace(structure, "condition", condition);
			regex = replace(regex, "cell", cell);
			regex = replace(regex, "slice", regex_slice);
			if(out == "stacks"){
				regex = replace(regex, "channel", channel);
			}
			if(out == "hyperstacks"){
				regex = replace(regex, "channel", "");
				regex = regex_start + regex;
			}			
			print("regex - " + regex);
			print(i + ", " + j + ", " + k);
			
			//check for matching file
			matching_files = Array.filter(files, "(" + regex + ")");
			print("matches - " + matching_files.length);
			if(matching_files.length > 0){
				if(out == "stacks"){
					setBatchMode(true);
				//open stack and generate title
					//run("Image Sequence...", "dir=" + dir + " filter=(" + regex + ") sort");
					File.openSequence(dir, " filter=(" + regex +")");
					title = condition + "_" + cell + "_" + channel + ".tif";
					saveAs("Tiff", dir + "stacks/" + title);
				}
				if(out == "hyperstacks"){
					setBatchMode(false);//concatenate function not working in batch mode
					param_string = "";
					for (l = 0; l < matching_files.length; l++) {
						open(dir + matching_files[l]);
						image_number = l + 1;
						param_string = param_string + "image" + image_number + " ";
					}
					//get number of slices from first open stack
					selectWindow(matching_files[0]);
					getDimensions(width, height, channels, slices, frames);
					total_slices = slices;
					if(matching_files.length > 1){//need at least two for hyperstack, otherwise leave as-is
						run("Concatenate...", param_string);
						run("Stack to Hyperstack...", "order=xyzct channels="+ matching_files.length +" slices="+ total_slices +" frames=1 display=Color");
					}
					title = condition + "_" + cell + ".tif";
					saveAs("Tiff", dir + "hyperstacks/" + title);
				}
			}			
			run("Close All");
		}
	}
}

function structure_to_regex(str, cond_r, cell_r, slice_r, chan_r){
	str = replace(str, "condition", cond_r);
	str = replace(str, "cell", cell_r);
	str = replace(str, "slice", slice_r);
	str = replace(str, "channel", chan_r);
	return str;
}

//TODO - fix looping if regex not matched
```
#### Neuron fluorescence quantification
##### Interactive macro {#fluor-quant}
Used to simplify fluorescence quantification in growth cones, neuronal cell bodies or entire neurons.  Walks the user through tracing various features of the cell, and saves ROIs and measurements as ZIP and CSV files, respectively.  Designed to work with a folder of multi-channel Z-stacks to begin, although should also work with single-channel stacks.

``` cpp
//open image manually for now

dir = getInfo("image.directory");//directory of image - for saving results
File.makeDirectory(dir + "fluorescence_quantification");
initial_name = getInfo("image.title");

getDimensions(width, height, channels, slices, frames);
channel_options = Array.getSequence(channels + 1);
channel_options = Array.deleteIndex(channel_options, 0);//remove 0 index - readjust after selection
proj_options = newArray("Sum Slices", "Max Intensity");
image_options = newArray("whole cell", "cell body", "growth cone");

Dialog.createNonBlocking("Settings");
Dialog.addChoice("Channel to measure", channel_options);//minor bug - adding .0 to end of each
Dialog.addRadioButtonGroup("Projection type", proj_options, 1, 2, "Sum Slices");
Dialog.addRadioButtonGroup("Image type", image_options, 3, 1, "whole cell");
Dialog.show();

ch = Dialog.getChoice();
proj = Dialog.getRadioButton();
type = Dialog.getRadioButton();

ch = parseInt(ch);//ROI manager handles channels as 1-indexed

run("Z Project...", "projection=["+ proj +"]");

run("ROI Manager...");
roiManager("Show None");

if(type == "cell body" || type == "whole cell"){
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace cell body, then click 'okay'.");
	Dialog.show();
	roiManager("Add");
	roiManager("Select", 0);
	roiManager("Rename", "cell body");

	roiManager("Deselect");
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace nucleus, then click 'okay'.");
	Dialog.show();
	roiManager("Add");
	roiManager("Select", 1);
	roiManager("Rename", "nucleus");

	//create cytoplasm ROI
	roiManager("Select", newArray(0,1));
	roiManager("AND");
	roiManager("Add");
	roiManager("Select", 2);
	roiManager("Rename", "t1");
	
	roiManager("Select", newArray(0,2));
	roiManager("XOR");
	roiManager("Add");
	roiManager("Select", 3);
	roiManager("Rename", "cytoplasm");

	roiManager("Select", 2);
	roiManager("Delete");
	//---

	//duplicate and shift each for background measurement
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace a dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 3);
	roiManager("Rename", "dendrite 1");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 4);
	roiManager("Rename", "dendrite 1 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace another dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 5);
	roiManager("Rename", "dendrite 2");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 6);
	roiManager("Rename", "dendrite 2 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace another dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 7);
	roiManager("Rename", "dendrite 3");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 8);
	roiManager("Rename", "dendrite 3 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace the axon initial segment, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 9);
	roiManager("Rename", "AIS");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 10);
	roiManager("Rename", "AIS background");
	roiManager("translate", 10, 10);
}
if(type == "whole cell"){
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace the full axon, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 11);
	roiManager("Rename", "axon");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 12);
	roiManager("Rename", "axon background");
	roiManager("translate", 10, 10);
}
if(type == "growth cone" || type == "whole cell"){
	//check number of ROIs first
	roi_count = roiManager("count");

	roiManager("Deselect");
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace growth cone, then click 'okay'.");
	Dialog.show();
	
	roiManager("Add");
	roiManager("Select", roi_count);//zero indexed, but count from 1
	roiManager("Rename", "growth cone");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", roi_count + 1);
	roiManager("Rename", "growth cone background");
	roiManager("translate", 10, 10);
}

//loop through and move all ROIs to measurement channel
for (i = 0; i < roiManager("count"); i++) {
	roiManager("Select", i);
	RoiManager.setPosition(ch);
}

roiManager("show all with labels");
Dialog.createNonBlocking("Adjustments");
Dialog.addMessage("Adjust background ROIs as necessary, then click 'okay'");
Dialog.show();

//-----MEASUREMENT-----
run("Set Measurements...", "area mean standard modal min integrated median display redirect=None decimal=3");
roiManager("Deselect");//make sure everything is measured, not just last one adjusted
roiManager("Measure");

//TODO - save ROIs and results table
Dialog.createNonBlocking("Save");
Dialog.addMessage("Click 'okay' to save ROIs and results and close windows.");
Dialog.show();

//ROIs
roiManager("Save", dir + "fluorescence_quantification/" + initial_name + "_ROIs.zip");
//results
saveAs("Results", dir + "fluorescence_quantification/" + initial_name + "_Results.csv");

close("*");//image windows
close("Roi Manager");
close("Results");
```
##### Additional runs
Allows you to reuse ROI files generated from running the above macro to calculate fluorescence intensities for a different channel or Z-projection type on the same images.

``` cpp
//select hyperstacks directory
stacks_dir = getDirectory("Choose the directory containing stack files");
stacks_list =  getFileList(stacks_dir);

//select ROIs directory
ROIs_dir = getDirectory("Choose the directory containing ROI ZIP files");
ROIs_list = getFileList(ROIs_dir);

//select output directory
out_dir = getDirectory("Choose location to save results");

//---match names, report number of matches-----
//technically unnecessary, remove this block if running slowly

//_ROIs.zip added to end of stack name, including .tif
matches_count = 0;
st_matches = newArray();
for (i = 0; i < stacks_list.length; i++) {
	st = stacks_list[i];
	st_roi = Array.filter(ROIs_list, st + "_ROIs.zip");
	if (st_roi.length > 0){
		matches_count++;
		st_matches = Array.concat(st_matches, st);
	}
}

Dialog.createNonBlocking("Press OK to continue");
Dialog.addMessage("There are " + matches_count + " stacks with available ROI files.  Do you want to continue?");
Dialog.show();
//-----

//pick projection type, channel to measure
proj_options = newArray("Sum Slices", "Max Intensity", "Average Intensity");

Dialog.createNonBlocking("Settings");
Dialog.addNumber("Channel to measure", 1, 0, 3, "");
Dialog.addRadioButtonGroup("Projection type", proj_options, 1, 2, "Sum Slices");
Dialog.addString("Output file suffix", "_new");
Dialog.show();

ch = Dialog.getNumber();
proj = Dialog.getRadioButton();
suffix = Dialog.getString();

ch = parseInt(ch);

//***BATCH***
setBatchMode(false);//runs into issues with results table not clearing if run in batch mode, for no apparent reason
for (i = 0; i < st_matches.length; i++) {
	st = st_matches[i];
	//open hyperstack, create projection
	open(stacks_dir + st);
	run("Z Project...", "projection=[" + proj + "]");//should stay selected
	//open ROIs
	roiManager("Open", ROIs_dir + st + "_ROIs.zip");
	//loop through and move all ROIs to measurement channel
	for (j = 0; j < roiManager("count"); j++) {
		roiManager("Select", j);
		RoiManager.setPosition(ch);
	}
	//measure, save results
	run("Set Measurements...", "area mean standard modal min integrated median display redirect=None decimal=3");
	roiManager("Deselect");//make sure everything is measured
	roiManager("Measure");
	saveAs("Results", out_dir + st + suffix + "_Results.csv");
	
	close("*");//image windows
	close("Roi Manager");
	close("Results");//BUG - occasionally ending up with wrong ROI matches, multiple results copies in some
}
//***********
```
#### Intensity profile export
Generates and saves a CSV containing fluorescence intensity profile information from an image with one or more channels and a line or segmented line ROI.  

``` cpp
setBatchMode(false);

//open images manually - should be multi channel max projection
dir = getInfo("image.directory");//directory of image - for saving results
File.makeDirectory(dir + "intensity_profiles");
initial_name = getInfo("image.title");

getDimensions(width, height, channels, slices, frames);
print("ch = " + channels + " s = " + slices + " f = " + frames);

//draw ROI line/polyline
roiManager("add");

for (i = 1; i < channels + 1; i++) {
	Stack.setChannel(i);
	print(i);
	profile = getProfile();
  	for (j=0; j<profile.length; j++)
      setResult("Value_ch" + i, j, profile[j]);
	updateResults;
}

//export CSV and ROI
saveAs("Results", dir + "intensity_profiles/" + initial_name + "_profile.csv");
roiManager("save selected", dir + "intensity_profiles/" + initial_name + ".roi")
```
#### Quick montage generator
Generates labelled montages of single- and multi-channel images of the sort used in this thesis (e.g. figure \@ref(fig:HeLa-ERES-grid-full-figure)).  Includes option to pause and edit or annotate (adding arrows, changing image order, etc.) before generating final montage.  Requires single-channel images to start. 

``` cpp
setBatchMode("false");

//get open images
img = getList("image.titles");
img_arr = Array.concat(img, "none");

//set channels for merge - clean this up?
Dialog.create("Options");
Dialog.addMessage("Select channels");
Dialog.addChoice("Red", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Green", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Blue", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Gray", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Cyan", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Magenta", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Yellow", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addCheckbox("Adjust brightness/contrast?", false);
Dialog.addCheckbox("Label images?", true);
Dialog.addString("Font size", 55);
Dialog.addCheckbox("Scalebar?", true);
Dialog.addString("Size", 20);//TODO - units
Dialog.addString("Final scale", 0.5);//TODO - number field?
Dialog.addCheckbox("Pause to annotate?", false);
Dialog.show();

c1 = Dialog.getChoice();
c1_label = Dialog.getString();
c2 = Dialog.getChoice();
c2_label = Dialog.getString();
c3 = Dialog.getChoice();
c3_label = Dialog.getString();
c4 = Dialog.getChoice();
c4_label = Dialog.getString();
c5 = Dialog.getChoice();
c5_label = Dialog.getString();
c6 = Dialog.getChoice();
c6_label = Dialog.getString();
c7 = Dialog.getChoice();
c7_label = Dialog.getString();
BC = Dialog.getCheckbox();
to_label = Dialog.getCheckbox();
label_size = Dialog.getString();
scalebar = Dialog.getCheckbox();
scalebar_size = Dialog.getString();
scale = Dialog.getString();
annotation_pause = Dialog.getCheckbox();

if (BC == true){
	for (i = 0; i < img.length; i++) {
		selectWindow(img[i]);
		autoBC();
	}
}



channelString = "";
if (c1 != "none"){ channelString = channelString + "c1=" + c1 + " "; }
if (c2 != "none"){ channelString = channelString + "c2=" + c2 + " "; }
if (c3 != "none"){ channelString = channelString + "c3=" + c3 + " "; }
if (c4 != "none"){ channelString = channelString + "c4=" + c4 + " "; }
if (c5 != "none"){ channelString = channelString + "c5=" + c5 + " "; }
if (c6 != "none"){ channelString = channelString + "c6=" + c6 + " "; }
if (c7 != "none"){ channelString = channelString + "c7=" + c7 + " "; }

run("Merge Channels...", channelString + "create keep ignore");

//add scalebar if option checked - defaulting to white for now
if(scalebar == true){
	selectWindow("Composite");
	run("Scale Bar...", "width=20 height=18 thickness=" + (5/scale) +" font=14 color=White background=None location=[Lower Left] horizontal hide overlay");
}

run("Flatten");

//label images if option is checked
if(to_label == true){
	setFont("SansSerif", label_size, " antialiased bold");
	buffer = Math.ceil(label_size/10);	
	if (c1 != "none" && c1_label != ""){selectWindow(c1); run("RGB Color"); h = getHeight(); setColor("red"); drawString(c1_label, buffer, h-buffer);}
	if (c2 != "none" && c2_label != ""){selectWindow(c2); run("RGB Color"); h = getHeight(); setColor("green"); drawString(c2_label, buffer, h-buffer);}
	if (c3 != "none" && c3_label != ""){selectWindow(c3); run("RGB Color"); h = getHeight(); setColor("blue"); drawString(c3_label, buffer, h-buffer);}
	if (c4 != "none" && c4_label != ""){selectWindow(c4); run("RGB Color"); h = getHeight(); setColor("gray"); drawString(c4_label, buffer, h-buffer);}
	if (c5 != "none" && c5_label != ""){selectWindow(c5); run("RGB Color"); h = getHeight(); setColor("cyan"); drawString(c5_label, buffer, h-buffer);}
	if (c6 != "none" && c6_label != ""){selectWindow(c6); run("RGB Color"); h = getHeight(); setColor("magenta"); drawString(c6_label, buffer, h-buffer);}
	if (c7 != "none" && c7_label != ""){selectWindow(c7); run("RGB Color"); h = getHeight(); setColor("yellow"); drawString(c7_label, buffer, h-buffer);}
}


run("Images to Stack", "name=Stack title=[] use");
//TODO - make sure order stays consistent - numerical/alphabetical? or by channel?

if(annotation_pause == true){
	Dialog.createNonBlocking("Annotation");
	Dialog.addMessage("Add desired annotations to images, then click \"OK\"");
	Dialog.show();
}

panels = img.length + 1;
run("Make Montage...", "columns=" + panels + " rows=1 scale=" + scale);
saveAs("PNG");//will prompt for name

run("Close All");



/*-------------------------------------------------*/

function autoBC(){
//from Kota Miura and Damien Guimond 
//http://imagej.1557.x6.nabble.com/Auto-Brightness-Contrast-
//and-setMinAndMax-td4968628.html
	AUTO_THRESHOLD = 5000; 
	getRawStatistics(pixcount); 
	limit = pixcount/10; 
	threshold = pixcount/AUTO_THRESHOLD; 
	nBins = 256; 
	getHistogram(values, histA, nBins); 
	i = -1; 
	found = false; 
	do { 
	        counts = histA[++i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i < histA.length-1)) 
	hmin = values[i]; 
	i = histA.length; 
	do { 
	        counts = histA[--i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i > 0)) 
	hmax = values[i]; 
	setMinAndMax(hmin, hmax); 
	run("Apply LUT"); 
}
```
#### Kymograph generator
Generates kymographs from a folder of image stacks and ROIs.  Includes options for contrast adjustment, background correction, and bleach correction, which can be adjusted to improve visibility of faint particles.  Can be very slow depending on which options are selected.

``` cpp
setBatchMode(false);
//not all macros/plugins used work in batch mode

//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "kymographs");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.addString("Experiment prefix", "");
Dialog.addChoice("ROI format", newArray("roi", "rgn"), "roi");
Dialog.addNumber("Line width", 5);
Dialog.addCheckbox("Brightness/contrast adjustment?", true);
Dialog.addCheckbox("Background subtraction?", false);
Dialog.addNumber("Rolling ball radius", 20.0);
Dialog.addMessage("\n");
Dialog.addCheckbox("Bleach correction?", true);
Dialog.addMessage("This will increase processing \ntime by roughly 30 mintues per \nstack, but will produce much \ncleaner kymographs");
Dialog.show()

ext = "." + Dialog.getChoice();
pref = Dialog.getString();
roi = "." + Dialog.getChoice();
lwd = Dialog.getNumber();
bc = Dialog.getCheckbox();
bgsubtract = Dialog.getCheckbox();
bgradius = Dialog.getNumber();
bleach = Dialog.getCheckbox();

files = getFileList(dir);
stacks = newArray(0);

print(ext);
print(files.length);

//select stacks for processing
for(i = 0; i < files.length; i++){
	if(endsWith(toLowerCase(files[i]), ext)){
		stacks = Array.concat(stacks,files[i]);
	}
}

print(stacks.length);

for(i = 0; i < stacks.length; i++){
	showProgress(i, stacks.length);

	//check for matching ROI before starting
	roi_name = replace(replace(replace(stacks[i], pref, ""), ext, roi), "_W\\d+( .{2})?_T", "");
	print(stacks[i]);
	print(roi_name);

	if(File.exists(dir + roi_name)){
		
		open(dir + stacks[i]);
		
		//create duplicate for processing, no edits on original stack file
		rename("orig");
		run("Duplicate...", "title=["+stacks[i]+"_duplicate] duplicate");
		close("orig");
	
		//bleach correction
		if(bleach == true){
			run("Bleach Correction", "correction=[Histogram Matching]");
			rename(stacks[i]+"_duplicate");//renaming new corrected file to match 'original' duplicate
			close("duplicate");//closing 'original' duplicate
		}
	
		//select and open ROI file for kymograph
		
		if(roi == ".rgn"){
			run("Metamorph ROI", "open=[" + dir + roi_name + "]" );
		}
		else{
			roiManager("open", dir + roi_name);
		}
			
		if(roiManager("count") == 1){//TODO - handle multiple ROIs
	
			createKymograph(lwd, 0);
	
			//background subtraction
			if(bgsubtract == true){
				run("Subtract Background...", "rolling=" + bgradius + " light");//TODO - adjust for optional inversion
			}
	
			//contrast adjustment
			if(bc == true){
				autoBC();
			}
			//file saving
			selectWindow("Kymograph");
			save(dir + "kymographs/" + stacks[i] + "_kymograph.tif");
		}
		roiManager("reset");
	}
	run("Close All");
}

function createKymograph(lwd, roiNo){
	
	//run("KymographBuilder", "input=" + stacks[i]+"_duplicate");
		//broken with new imageJ update
		
	roiManager("select", roiNo);
	run("Multi Kymograph", "linewidth=" + lwd);
	selectWindow("Kymograph");
	
	rename("Kymograph");//ensure that window name is consistent - might change with plugin updates
	
	run("Invert");//TODO - make optional
	
	/*KymographBuilder sometimes adds a line of saturated pixels to the far right, 
	which throws off contrast adjustment.  Cropping to avoid*/
	/*getDimensions(w, h, c, s, f);
	makeRectangle(0, 0, w-1, h);
	run("Crop");
	*/
	setOption("ScaleConversions", true);
	run("16-bit");//"Apply LUT" in autoBC doesn't work on 32 bit produced by MultipleKymograph
}

function autoBC(){
//from Kota Miura and Damien Guimond 
//http://imagej.1557.x6.nabble.com/Auto-Brightness-Contrast-and-
//setMinAndMax-td4968628.html
	AUTO_THRESHOLD = 5000; 
	getRawStatistics(pixcount); 
	limit = pixcount/10; 
	threshold = pixcount/AUTO_THRESHOLD; 
	nBins = 256; 
	getHistogram(values, histA, nBins); 
	i = -1; 
	found = false; 
	do { 
	        counts = histA[++i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i < histA.length-1)) 
	hmin = values[i]; 
	i = histA.length; 
	do { 
	        counts = histA[--i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i > 0)) 
	hmax = values[i]; 
	setMinAndMax(hmin, hmax); 
	run("Apply LUT"); 
}
```
#### Export kymograph traces to CSV {#kymo-export}
Used to export manual kymograph traces (segmented line ROIs, added to the ROI manager) into CSV format for analysis in R.  Includes a numeric index for each trace, and X and Y coordinates for each point along the line.

``` cpp
Table.create("ROI details");

num = roiManager("count");
for (i=0; i<num; i++){
	roiManager("select", i);
	Roi.getCoordinates(xpoints, ypoints);
	base = Table.size;
	for (p=0; p<xpoints.length; p++){
		Table.set("ROI", base + p, i + 1);//1-index for R analysis
		Table.set("X", base + p, xpoints[p]);
		Table.set("Y", base + p, ypoints[p]);
	}
}

print(getTitle());
Table.save(getDirectory("image") + getTitle() + "_traces.csv");

//ADD ROI SAVE
```


### R Scripts

#### Convert XML files from Cell Counter ImageJ plugin to CSVs
Generates CSVs from the XML files exported by the Fiji Cell Counter plugin's 'Save Markers' feature.  Requires some configuration before use — there are included code blocks to use this for either counting transfected cells or classifying dendritic spines.

``` r
library(xml2)

dir = choose.dir(caption = "Choose directory containing Cell Counter XML files.")
files = list.files(dir, pattern = '.(xml|XML)$', recursive = F)

counts = do.call(rbind, lapply(files, function(f){
  xml = read_xml(paste(dir, f, sep = '/'))
  xml.marker_data = xml_child(xml, search = 'Marker_Data')
  

  ## cell transfection quantification ##
  ## 'intact' and 'dead' cell counter groups, in that order ##
  intact = xml_child(xml.marker_data, search = 2)
  dead = xml_child(xml.marker_data, search = 3)
  
  intact.count = xml_length(intact) - 2 #subtracting to account for type and name fields
  dead.count = xml_length(dead) - 2 #subtracting to account for type and name fields
  
  df = data.frame(file = f,
                  intact = intact.count,
                  dead = dead.count)
  ##############################################################

  ## comment out the above block and uncomment this block for dendritic spines classification ##
  ## dendritic spine manual classification, with groups 'mushroom', 'thin', 'stubby', and 'filopodia', in that order ##
  #
  # mushroom = xml_child(xml.marker_data, search = 2)
  # thin = xml_child(xml.marker_data, search = 3)
  # stubby = xml_child(xml.marker_data, search = 4)
  # filopodia = xml_child(xml.marker_data, search = 5)
  # 
  # mushroom.count = xml_length(mushroom) - 2 #subtracting to account for type and name fields
  # thin.count = xml_length(thin) - 2
  # stubby.count = xml_length(stubby) - 2
  # filopodia.count = xml_length(filopodia) - 2
  # 
  # df = data.frame(file = f, 
  #                 mushroom = mushroom.count,
  #                 thin = thin.count,
  #                 stubby = stubby.count,
  #                 filopodia = filopodia.count)
  ##############################################################
  
  return(df)
  
}))

write.csv(counts, file = paste(dir, "cell_counter_counts.csv", sep = '/'))
```
#### Calculate frame rate from individual timelapse images {#timestamp-corr}
Calculates a 'true' frame rate for a MetaMorph timelapse from the timestamps on individual frames.  See \@ref(live-imaging) for a description of the issue that prompted this fix.

``` r
#to correct for frame rate change in metamorph due to differing exposure/number of channels
#effectively slower than specified rate if long exposure or multiple channels
#this checks the difference between timestamps on individual frame TIFs to establish actual frame rate and allow comparison between kymographs with different settings

library(tiff)
library(stringr)
library(lubridate)
library(hms)
library(dplyr)

dir = choose.dir("Choose TIF directory")#WINDOWS-SPECIFIC
expt = readline(prompt = "Enter an identifier in the form 'experiment_condition' for saving:")
files = list.files(dir, pattern = '.(tif(f)?|TIF(F)?)$', recursive = F)#TODO - handle recursion from experiment file, but skip any TIF stacks if present (most should be .stk)

#get creation timestamps from TIF metadata
timestamps = sapply(files, function(f){
    filepath = paste(dir, f, sep = "\\")
    #escape spaces
    filepath = gsub(" ", "\ ", filepath)
    f.tiff = readTIFF(filepath, info = T)
    metadata = attr(f.tiff, "description")
    acquisition_time = str_match(metadata, 
                              '\\r\\n\\t\\t<prop id=\\"acquisition-time-local\\"\\ type=\\"time\\" value=\\"(.+)\\">')[[2]] #captured group
    #timestamp = as_hms(as_datetime(acquisition_time))#handle manually to account for MetaMorph bug - dropping leading zeroes in miliseconds field
    acquisition_time.split= str_match(acquisition_time, '\\d{8} (\\d{2}):(\\d{2}):(\\d{2})\\.(\\d+)')
    time.hour = acquisition_time.split[2]
    time.min = acquisition_time.split[3]
    time.sec = paste(acquisition_time.split[4], str_pad(acquisition_time.split[5], width = 3, side = 'left', pad = '0'), sep = ".")
    timestamp = as_hms(paste(time.hour, time.min, time.sec, sep = ":"))#might bug out over lunchtime if not 24hr time
    return(timestamp)
  })
timestamps.df = data.frame(file = files, time = timestamps)

#split filenames for analysis
files.split = as.data.frame(str_match(files, '(.+)_(C\\d+)_(.+)_w(\\d{1})(\\d{3}).*?_t(\\d+).(tif|TIF)'))
timestamps.df$condition = files.split[,2]
timestamps.df$cell = files.split[,3]
timestamps.df$video_ID = files.split[,4]
timestamps.df$channel = files.split[,5]
timestamps.df$wavelength = files.split[,6]
timestamps.df$frame = files.split[,7]

#adjust types - leaving factors as is for now
timestamps.df$channel = as.numeric(as.character(timestamps.df$channel))
timestamps.df$wavelength = as.numeric(as.character(timestamps.df$wavelength))
timestamps.df$frame = as.numeric(as.character(timestamps.df$frame))

#unique ID for grouping
timestamps.df$groupID = sapply(1:nrow(timestamps.df), function(i){ r = timestamps.df[i,]; paste(r$condition, r$cell, r$video_ID, r$channel, sep = "_") })

#DROP FIRST FRAMES
#most variability here - either very long or very short gap between first and second frames
#remove first for better frame rate estimation
timestamps.df = timestamps.df %>% group_by(groupID) %>% filter(!frame == min(frame)) %>% ungroup()
#should also have the effect of removing groups with only one frame, but leaving in handling code just in case

#find average times between frames
framerates = data.frame(ID = unique(timestamps.df$groupID), stringsAsFactors = F)

framerates$steps = lapply(framerates$ID, function(id){#list avoids sporadic error e.g. Error in `$<-.data.frame`(`*tmp*`, steps, value = c(0.542999982833862,  :   replacement has 359 rows, data has 8
  df = filter(timestamps.df, groupID == id)
  if(nrow(df) == 1){ 
    return(NA) 
  }
  else{
    steps = sapply((min(df$frame)):(max(df$frame)-1), function(f){#TODO - handle/error for missing frames
      (df[df$frame == f + 1, "time"]) - (df[df$frame == f, "time"])
    })
    return(unlist(steps))#sapply returning as a list for some reason
  }
})
framerates$avg_step = sapply(framerates$steps, mean)
framerates$sd_step = sapply(framerates$steps, sd)
framerates$min_step = sapply(framerates$steps, min)
framerates$max_step = sapply(framerates$steps, max)

framerates$steps_by_elapsed = unlist(sapply(framerates$ID, function(id){#calculate 'average' step size by dividing total time elapsed by number of frames
  df = filter(timestamps.df, groupID == id)
  if(nrow(df) == 1){ 
    return(NA) 
  }
  else{
    elapsed = df[df$frame == max(df$frame), "time"] - df[df$frame == min(df$frame), "time"]
    frames = length(unique(df$frame))#unique probably unnecessary?
    s = elapsed/frames
    return(s)
  }
}))#also coming back as a list, for some reason
#reasonably consistent with average - most variation still down to first/second frame transition

#rounding to 2 decimal places - should be enough to account for exposure variations
framerates$framerate = round((1/framerates$avg_step), digits = 2)

write.csv((framerates %>% select(!steps)), file = paste0(dir, "\\", expt, "_frame_rates.csv"))
```
#### Analyse kymograph traces from CSV
Calculates a number of parameters based on the CSV kymograph data exported by ImageJ macro \@ref(kymo-export).  Includes information such as the direction and speed of each individual particle movement, as well as average distance, average velocity, and the total number of particles traced in each kymograph.

``` r
library(ggplot2)
library(gridExtra)

analyse_traces <- function(csv_path = NULL, x_scale = 1, y_scale = 1, mov_threshold = 5){#x scale um/pixel, y scale time per frame, mov_threshold distance to be considered non-static - default from Shi et. al. 2017
  if(missing(csv_path)){
    csv_path = file.choose()
  }
  
  traces = read.csv(csv_path, col.names = c("ROI", "X", "Y"))
  #account for any 'backwards' tracing
  traces = do.call(rbind, lapply(unique(traces$ROI), 
                function(t){
                  df = traces[traces$ROI == t,];
                  ystart = df$Y[1];
                  yfin = df$Y[length(df$Y)];
                  if (ystart > yfin){#'backwards' trace
                    df = df[nrow(df):1,];#flip
                  }
                  #TODO - y change == 0 case
                  return(df);
                }
              ))
  
  #-----per-segment analysis-------------
  #iterate over segments; fix any going in wrong y-direction; return velocity, distance, direction
  per_seg.df = do.call(rbind, lapply(unique(traces$ROI), function(roi){ 
    roi.df = traces[traces$ROI == roi,]; 
    seg.df = do.call(rbind, lapply(2:nrow(roi.df), function(i){
        #cleaning - direction
        ydiff = (roi.df$Y[i] - roi.df$Y[i-1])*y_scale;
        if (ydiff <= 0){
          ydiff = 1*y_scale #effectively 1 frame minimum time for any movement
        }
        #other calculations
        xdiff = (roi.df$X[i] - roi.df$X[i-1])*x_scale;#convert to um
        
        v = xdiff/ydiff;
        d = xdiff;
        
        if(d > mov_threshold){ dr = "anterograde" }
        else if (d < -mov_threshold){ dr = "retrograde"}
        else{ dr = "static" }
        
        return(data.frame(velocity = v, distance = d, direction = dr, stringsAsFactors = F))
      
    }
    ))
    return(data.frame(velocity = seg.df$velocity, distance = seg.df$distance, direction = seg.df$direction, ROI = roi, stringsAsFactors = F))  
  }
  ))
  if(is.null(per_seg.df)){ per_seg.df = data.frame(velocity = numeric(0), distance = numeric(0), direction = character(0), ROI = integer(0)) }  
 
  #-----per-trace analysis-------------
  num_traces = length(unique(traces$ROI))
  
  per_trace.net_distance = unlist(sapply(unique(traces$ROI), function(roi){ 
                                    roi.df = traces[traces$ROI == roi,]; 
                                    dist = roi.df$X[length(roi.df$X)] - roi.df$X[1];
                                    return(dist)
                                    }
                                    ))
  
  per_trace.net_velocity = unlist(sapply(unique(traces$ROI), function(roi){ 
                                    roi.df = traces[traces$ROI == roi,]; 
                                    dist = roi.df$X[length(roi.df$X)] - roi.df$X[1];
                                    time = roi.df$Y[length(roi.df$Y)] - roi.df$Y[1];
                                    return(dist/time)
                                  }
                                  ))
    
  #------------------------------------
  
  results = list("per_seg" = per_seg.df, 
                 "num_traces" = num_traces, 
                 "per_trace.net_distance" = per_trace.net_distance,
                 "per_trace.net_velocity" = per_trace.net_velocity)#TODO - return per_trace as df
  
  return(results)
}

graph_results <- function(res_list){
  if(is.null(names(res_list))){ names(res_list) = paste0('cond_', 1:length(res_list)) }
}
```

# References {.unnumbered #BIB}
```{=latex}
\markboth{REFERENCES}{}
```

<!--chapter:end:text/Appendix.Rmd-->

