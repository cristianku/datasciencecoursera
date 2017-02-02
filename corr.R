corr <- function(directory, threshold = 0) {
        
        cr <- c() 
        
        for(f in 1:length(c(1,2))){
                data <- read.csv(paste0(directory , "/" , sprintf("%03d",f), ".csv" ) ) 
                data <- data[complete.cases(data),]
                if ( nrow(data) > threshold ) {
                        cr <- c(cr, cor(data$sulfate, data$nitrate) ) # append corralations
                }
        }
        
        
        
        cr

        }
