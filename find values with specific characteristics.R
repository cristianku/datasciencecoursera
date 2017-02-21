if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurant.csv",method="curl")

restData <- read.csv("./data/restaurant.csv")


table(restData$zipCode %in% c("21212"))
# FALSE  TRUE 
# 1299    28 

table(restData$zipCode %in% c("21212","21213"))

# FALSE  TRUE 
# 1268    59 

