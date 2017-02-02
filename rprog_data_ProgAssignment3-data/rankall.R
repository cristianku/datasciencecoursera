rankall <- function( outcome, num = "best") {
        ## Read outcome data
        
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available" ,stringsAsFactors=FALSE)
        

        valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        if(!outcome %in% valid_outcomes) {
                stop (c("invalid outcome:", outcome, ",valid values are : heart attack, heart failure, pneumonia"))
        }       
        
        
        # Remove columns by outcome, only left HospitalName and Deaths by outcome
        if(outcome == "heart attack") {
                outcome_data = outcome_data[,c(2,7,11)]
        } else if(outcome == "heart failure") {
                outcome_data = outcome_data[,c(2,7,17)]
        } else if(outcome == "pneumonia") {
                outcome_data = outcome_data[,c(2,7,23)]
        }
        
        names(outcome_data) <- c("Hospital", "State", "Deaths")
        
        # Converting to numeric 
        outcome_data$Deaths <- as.numeric(outcome_data$Deaths)
        

        ## removing NA and filter
        good_cases <- complete.cases(outcome_data)
        outcome_data  <- outcome_data [good_cases,]
        
        
        ## ranking the data
        #splitting into each State
        splitted <- split ( outcome_data , outcome_data$State)
        
        #order within each element of the list splitted ( every object of the list splitted is a different State)
        splitted_ordered <- lapply(splitted, function(x) {
                #order by Deaths / Hospital
                x[order(x[,3], x[,1]),]             
                
                if (!is.numeric(as.numeric(num)) )
                 {if      (num =="best")  x$Hospital[1]
                  else if (num =="worst") x$Hospital[nrow(x)]
                  else                    stop (" Invalid num specified")
                 }
                else 
                 {
                 
                    if (as.numeric(num) > nrow(x) )
                         return (NA)
                    else
                         x$Hospital[as.numeric(num)]   
                         
                 }
        }
        )
        
        #Converting into data frame STATE / HOSPITAL ( unlisting the list )
        final_data <- data.frame(state=names(splitted_ordered), hospital=unlist(splitted_ordered))  
        
        #removing the rownames ( coming from the Object names of the list)
        rownames(final_data) <- NULL
        
        final_data

        
        
}