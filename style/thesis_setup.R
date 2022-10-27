#based on report_setup.R from First year report

library(ggplot2)
library(grid)
library(showtext)

#Fonts
fig.path = "figures/"
showtext_auto()


#Colours
colours = character()
colours.protrudin = character()

#Protrudin colours - expanded from ColourBrewer Dark2

#colours.protrudin["GFP"] = '#8AC926'#too close to WT
#colours.protrudin["mCherry"] = '#FF595E'

colours.protrudin["Control"] = '#7570B3'
colours.protrudin["WT"] = '#E6AB02'
colours.protrudin["Active"] = '#FF595E'

colours.protrudin["ER"] = '#D95F02'
colours.protrudin["FFAT"] = '#1B9E77'
colours.protrudin["RBD"] = '#E7298A'
colours.protrudin["KIF5"] = '#66A61E'
colours.protrudin["FYVE"] = '#6A4C93'
colours.protrudin["NA"] = '#666666'

#rest selected using coolors.co

colours["Arl8b"] = '#734B5E'
colours["Myrlysin"] = '#086788'
colours["SKIP"] = '#FFA630'

colours["LAMP1"] = '#723D46'

colours["DIV3"] = '#119DA4'
colours["DIV15"] = '#4B3F72'

#ggplot2 theme

custom_add = theme(legend.background = element_rect(fill = "#FFFFFF00"),
                   text = element_text(family = "Readex Pro"),
                   plot.tag = element_text(size = rel(2)),
                   legend.position = 'none')

report_theme = theme_classic(base_size = 18) + custom_add

report_blank = theme_void(base_size = 18) + custom_add

#TODO - change discrete palette for grayscale print-friendliness
d_format = list(scale_colour_manual(values = c(colours.protrudin, colours)),
                 scale_fill_manual(values = c(colours.protrudin, colours)))
c_format = list(scale_colour_viridis_c(),
                scale_fill_viridis_c())


image_as_ggplot <- function(img){#read in image using readbitmap::read.bitmap
  img.grob = rasterGrob(img)
  img.gg = ggplot(data.frame()) + annotation_custom(img.grob) + report_blank
  return(img.gg)
}

