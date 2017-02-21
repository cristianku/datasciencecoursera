if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurant.csv",method="curl")

restData <- read.csv("./data/restaurant.csv")

summary(restData)

#name         zipCode             neighborhood councilDistrict       policeDistrict
#MCDONALD'S                  :   8   Min.   :-21226   Downtown    :128   Min.   : 1.000   SOUTHEASTERN:385   
# POPEYES FAMOUS FRIED CHICKEN:   7   1st Qu.: 21202   Fells Point : 91   1st Qu.: 2.000   CENTRAL     :288   
# SUBWAY                      :   6   Median : 21218   Inner Harbor: 89   Median : 9.000   SOUTHERN    :213   
# KENTUCKY FRIED CHICKEN      :   5   Mean   : 21185   Canton      : 81   Mean   : 7.191   NORTHERN    :157   
# BURGER KING                 :   4   3rd Qu.: 21226   Federal Hill: 42   3rd Qu.:11.000   NORTHEASTERN: 72   
# DUNKIN DONUTS               :   4   Max.   : 21287   Mount Vernon: 33   Max.   :14.000   EASTERN     : 67   
# (Other)                     :1293                    (Other)     :863                    (Other)     :145   
#                          Location.1    
# 1101 RUSSELL ST\nBaltimore, MD\n:   9  
# 201 PRATT ST\nBaltimore, MD\n   :   8  
# 2400 BOSTON ST\nBaltimore, MD\n :   8  
# 300 LIGHT ST\nBaltimore, MD\n   :   5  
# 300 CHARLES ST\nBaltimore, MD\n :   4  
# 301 LIGHT ST\nBaltimore, MD\n   :   4  
# (Other)                         :1289  

str(restData)

#'data.frame':	1327 obs. of  6 variables:
#  $ name           : Factor w/ 1277 levels "1919","19TH HOLE",..: 9 1 990 3 4 2 6 7 8 5 ...
#$ zipCode        : int  21206 21231 21224 21211 21223 21218 21205 21211 21205 21231 ...
#$ neighborhood   : Factor w/ 173 levels "Abell","Arlington",..: 53 52 18 66 104 33 98 133 98 157 ...
#$ councilDistrict: int  2 1 1 14 9 14 13 7 13 1 ...
#$ policeDistrict : Factor w/ 9 levels "CENTRAL","EASTERN",..: 3 6 6 4 8 3 6 4 6 6 ...
#$ Location.1     : Factor w/ 1210 levels "1000 ALICEANNA ST\nBaltimore, MD\n",..: 833 324 550 755 484 532 498 525 500 571 ...


quantile(restData$councilDistrict, na.rm=T)
# 0%  25%  50%  75% 100% 
# 1    2    9   11   14 

quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9))

#50% 75% 90% 
#9  11  12 


table(restData$zipCode, useNA="ifany") # it creates a column called ifany with the NA found

#2 dimension table by zipCode and councilDistrict


table(restData$councilDistrict, restData$zipCode)


#check for missing values
sum(is.na(restData$councilDistrict))
# [1] 0
 
any(is.na(restData$councilDistrict))
# [1] FALSE

all(restData$zipCode > 0 )
# [1] FALSE


colSums(is.na(restData))

# name         zipCode    neighborhood councilDistrict  policeDistrict      Location.1 
# 0               0               0               0               0               0 

all(colSums(is.na(restData))==0)

# [1] TRUE

