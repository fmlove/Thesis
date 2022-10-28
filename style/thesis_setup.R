#based on report_setup.R from First year report

library(ggplot2)
library(grid)
library(showtext)

#Fonts
font_add_google("Readex Pro")
showtext_auto()


#Colours - selected from ColourBrewer "Dark2" palette and misc. coolors palettes
colours = character()

#colours.protrudin["GFP"] = '#8AC926'#too close to WT
#colours.protrudin["mCherry"] = '#FF595E'


colours["Control"] = '#8AC926'
colours["WT"] = '#19647E'
colours["Active"] = '#FF595E'

#edit palette for mutants?  some fairly close to main set
colours[paste0('\U0394', 'ER')] = '#6A4CA4'
colours[paste0('\U0394', 'FFAT')] = '#D95F02'
colours[paste0('\U0394', 'RBD')] = '#1B9E77'
colours[paste0('\U0394', 'KIF5')] = '#F8298A'
colours[paste0('\U0394', 'FYVE')] = '#E6AB02'


colours["NA"] = '#BBBBBB'

colours["mushroom"] = '#067195'
colours["thin"] = '#FF950A' #'#FFA630'
colours["stubby"] = '#A74C86'
colours["filopodia"] = '#697A21' #'#7B9E87'

colours["DIV3"] = '#119DA4'
colours["DIV15"] = '#4B3F72'

#ggplot2 theme

custom_add = theme(legend.background = element_rect(fill = "#FFFFFF00"),
                   text = element_text(family = "Readex Pro"),
                   plot.tag = element_text(size = rel(2)),
                   legend.position = 'none',
                   strip.background = element_blank())

report_theme = theme_classic(base_size = 12) + custom_add

report_blank = theme_void(base_size = 12) + custom_add

#plot palettes
d_format = list(scale_colour_manual(values = colours),
                 scale_fill_manual(values = colours))
c_format = list(scale_colour_viridis_c(),
                scale_fill_viridis_c())

#font size for p values
p_fs = 2



image_as_ggplot <- function(img){#read in image using readbitmap::read.bitmap
  img.grob = rasterGrob(img)
  img.gg = ggplot(data.frame()) + annotation_custom(img.grob) + report_blank
  return(img.gg)
}


#taken from previous work on Huoviala et al. paper
view_colours <- function(){
  plot.new()
  ybottom = seq(1-(1/length(colours)), 0, length.out = length(colours))
  ytop = seq(1, (1/length(colours)), length.out = length(colours))
  rect(xleft = rep(0, length(colours)),
       ybottom = ybottom,
       xright = rep(1, length(colours)),
       ytop =  ytop,
       col = colours)
  text(x = rep(0.5, length(colours)), y = rowMeans(cbind(ybottom, ytop)), labels = names(colours))
}
