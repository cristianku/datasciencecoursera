# 
# columnmean <- function(y, removeNA=TRUE) {
#         nc <- ncol(y)
#         means <- numeric(nc)
#         for ( i in 1:nc) {
#                 means[i] <- mean( y[,i], na.rm = removeNA)
#         }
#         means 
#         
# } 

pollutantmean <- function ( directory, pollutant, id = 1:332)  {
        
        dat <- data.frame()
        
        for ( i in id)
        {
        
                dat <- rbind(dat,read.csv(paste0(directory , "/" , sprintf("%03d",i), ".csv" ) ) )
        }
                
        mean(dat[,pollutant], na.rm = TRUE)
}
        
        