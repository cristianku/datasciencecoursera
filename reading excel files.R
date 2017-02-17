setwd("/home/cristianku/Projects/DataScienceCoursera")

if (!file.exists("data")) { dir.create("data")}

fileUrl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD&bom=true"
download.file(fileUrl, destfile = "./data/cameras.xlsx", method="curl")

list.files("./data")

cameradata <- read.csv("/home/cristianku/Projects/DataScienceCoursera/data/cameras.csv",  header=TRUE)

head(cameradata)
