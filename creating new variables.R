if  (!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"

download.file(fileUrl,destfile = "./data/restaurants.csv",method="curl")

restData <- read.csv("./data/restaurants.csv")

# subsetting variables
#new variable nearMe --> appending it at the end of the dataset
restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

# FALSE  TRUE 
# 1314    13 

#Creating binary variables
restData$zipWrong = ifelse(restData$zipCode < 0 , TRUE, FALSE)
table(restData$zipWrong, restData$zipCode< 0)

# quantile(restData$zipCode)
# 0%      25%      50%      75%     100% 
# -21226.0  21202.0  21218.0  21225.5  21287.0 

#creating categorical variables
restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))

# table(restData$zipGroups)

# (-2.123e+04,2.12e+04]  (2.12e+04,2.122e+04] (2.122e+04,2.123e+04] (2.123e+04,2.129e+04] 
# 337                   375                   282                   332 

table(restData$zipGroups,restData$zipCode)

# -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216 21217
# (-2.123e+04,2.12e+04]      0   136   201     0     0     0     0     0     0     0     0     0     0     0     0     0
# (2.12e+04,2.122e+04]       0     0     0    27    30     4     1     8    23    41    28    31    17    54    10    32
# (2.122e+04,2.123e+04]      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
# (2.123e+04,2.129e+04]      0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0

# 21218 21220 21222 21223 21224 21225 21226 21227 21229 21230 21231 21234 21237 21239 21251 21287
# (-2.123e+04,2.12e+04]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
# (2.12e+04,2.122e+04]     69     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
# (2.122e+04,2.123e+04]     0     1     7    56   199    19     0     0     0     0     0     0     0     0     0     0
# (2.123e+04,2.129e+04]     0     0     0     0     0     0    18     4    13   156   127     7     1     3     2     1


# easier cutting
# easier cutting
# easier cutting


library(Hmisc)
# break down automatically by QUANTILE 
restData$zipGroups =cut2(restData$zipCode,g = 4)

table(restData$zipGroups)

# [-21226,21205) [ 21205,21220) [ 21220,21227) [ 21227,21287] 
# 338            375            300            314 

#factor variables 

restData$zcf <- factor(restData$zipCode)
restData$zcf [1:10]

# [1] 21206 21231 21224 21211 21223 21218 21205 21211 21205 21231
# 32 Levels: -21226 21201 21202 21205 21206 21207 21208 21209 21210 21211 21212 21213 21214 21215 21216 21217 21218 ... 21287


class(restData$zcf)
# [1] "factor"


#levels of factor variables


