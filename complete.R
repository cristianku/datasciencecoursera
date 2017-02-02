complete <- function(directory, id= 1:332)
     {
        dat <- data.frame()
        complete_data <- rep(0,length(id) )

        for ( i in 1:length(id) )
        {
                
                dat <- read.csv(paste0(directory , "/" , sprintf("%03d",id[i]), ".csv" ) ) 
                complete_data[i]<- sum(complete.cases(dat))
        }
        
        data.frame(id = id, nobs = complete_data)
      
             
     }
                     
                     