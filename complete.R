complete <- function(directory, id= 1:332)
     {

        complete_data <- rep(0,length(id) )

                for ( i in id)
        {
                
                dat <- rbind(dat,read.csv(paste0(directory , "/" , sprintf("%03d",i), ".csv" ) ) )
                complete_data[i] <- sum(complete.cases(dat))
        }
        
        data.frame(id = id, nobs = complete_data)
        
             
     }
                     
                     