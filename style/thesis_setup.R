#based on report_setup.R from First year report

library(ggplot2)
library(grid)




#colours
colours = character()
colours.protrudin = character()

#Protrudin colours - expanded from ColourBrewer Dark2
colours.protrudin["GFP"] = '#8AC926'
colours.protrudin["mCherry"] = '#FF595E'
colours.protrudin["WT"] = '#E6AB02'
colours.protrudin["Mut2"] = '#7570B3'

colours.protrudin["ER"] = '#D95F02'
colours.protrudin["FFAT"] = '#1B9E77'
colours.protrudin["RBD"] = '#E7298A'
colours.protrudin["KIF5"] = '#66A61E'
colours.protrudin["FYVE"] = '#A6761D'

colours.protrudin["NA"] = '#666666'

#rest selected using coolors.co

colours["Scr"] = '#6A4C93'
colours["CALY"] = '#55DDE0'

colours["Arl8b"] = '#734B5E'
colours["Myrlysin"] = '#086788'
colours["SKIP"] = '#FFA630'

colours["LAMP1"] = '#723D46'

colours["GFP"] = colours.protrudin["GFP"]
colours["mCherry"] = colours.protrudin["mCherry"]
colours["NA"] = colours.protrudin["NA"]


#ggplot2 theme

report_theme = theme_bw(base_size = 18) + 
  theme(legend.background = element_rect(fill = "#FFFFFF00"),
        plot.tag = element_text(size = rel(2)))

#TODO - change discrete palette for grayscale print-friendliness
d_format = list(scale_color_brewer(palette = "Dark2"),
                scale_fill_brewer(palette = "Dark2"))
c_format = list(scale_colour_viridis_c(),
                scale_fill_viridis_c())


image_as_ggplot <- function(img){#read in image using readbitmap::read.bitmap
  img.grob = rasterGrob(img)
  img.gg = ggplot(data.frame()) + annotation_custom(img.grob) + theme_void()
  return(img.gg)
}

