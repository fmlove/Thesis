#to correct for frame rate change in metamorph due to differing exposure/number of channels
#effectively slower than specified rate if long exposure or multiple channels
#this checks the difference between timestamps on individual frame TIFs to establish actual frame rate and allow comparison between kymographs with different settings

library(tiff)
library(stringr)
library(lubridate)
library(hms)
library(dplyr)

dir = choose.dir(default = 'C:\\Users\\fl299\\PhD\\Data\\Mine\\Spinning Disc', "Choose TIF directory")#WINDOWS-SPECIFIC
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
