best <- function(state, outcome) {
        ## Read outcome data
        outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available" ,stringsAsFactors=FALSE)
        
        ## Check that state and outcome are valid
        
        if (!(state %in% outcome_data$State)) {
                stop ("invalid state")
        }       

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
        
        # filtering only the state from input
        good_state <- outcome_data$State == state
        
        outcome_data <- outcome_data[good_state,]
        
        ## removing NA and filter
        good_cases <- complete.cases(outcome_data)

        outcome_data  <- outcome_data [good_cases,]
        
        
        ## Calculate min
        ## Return hospital name in that state with lowest 30-day death
        min_Deaths <- min( outcome_data$Deaths)
        
        min_Hospital <- outcome_data$Deaths == min_Deaths
        min_Hospital <- outcome_data [min_Hospital , "Hospital"]
        
        sort(min_Hospital)[1]

}