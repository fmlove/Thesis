library(xml2)

dir = choose.dir(caption = "Choose directory containing Cell Counter XML files.")
files = list.files(dir, pattern = '.(xml|XML)$', recursive = F)


counts = do.call(rbind, lapply(files, function(f){
  xml = read_xml(paste(dir, f, sep = '/'))
  xml.marker_data = xml_child(xml, search = 'Marker_Data')
  
  intact = xml_child(xml.marker_data, search = 2)
  dead = xml_child(xml.marker_data, search = 3)
  
  intact.count = xml_length(intact) - 2 #subtracting to account for type and name fields
  dead.count = xml_length(dead) - 2 #subtracting to account for type and name fields
  
  df = data.frame(file = f,
                  intact = intact.count,
                  dead = dead.count)
   
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
  return(df)
  
}))

write.csv(counts, file = paste(dir, "cell_counter_counts.csv", sep = '/'))

