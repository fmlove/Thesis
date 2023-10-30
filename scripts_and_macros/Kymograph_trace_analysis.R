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
