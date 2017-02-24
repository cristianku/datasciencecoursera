library(dplyr)

if (!file.exists("./data")){dir.create("./data")}
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

#, method="curl")
download.file(fileUrl1, destfile="./data/reviews.csv")  

download.file(fileUrl2, destfile="./data/solutions.csv")

reviews <- read.csv("./data/reviews.csv")

solutions <- read.csv("./data/solutions.csv")

names(reviews)
# [1] "id"          "solution_id" "reviewer_id" "start"       "stop"        "time_left"   "accept"     

names(solutions)
# [1] "id"         "problem_id" "subject_id" "start"      "stop"       "time_left"  "answer"    


mergedData= merge( reviews, solutions, by.x = "solution_id", by.y = "id", all=T)
