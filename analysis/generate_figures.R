#run all analysis files and generate figures

library(rmarkdown)
library(here)

render(here("analysis/Ptdn_LAMP1_analysis.Rmd"), "pdf_document")
render(here("analysis/Ptdn_Rab7_analysis.Rmd"), "pdf_document")
render(here("analysis/Protrudin_proteomics.Rmd"), "pdf_document")
render(here("analysis/Protrudin_spine_type_analysis.Rmd"), "pdf_document")
render(here("analysis/Protrudin_spine_length_analysis.Rmd"), "pdf_document")
render(here("analysis/HeLa_screen.Rmd"), "pdf_document")
render(here("analysis/ER-Golgi_localisation.Rmd"), "pdf_document")
