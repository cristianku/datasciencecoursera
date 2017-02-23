library(dplyr)
chicago <- readRDS ("./data/chicago.rds")

dim(chicago)

names(chicago)
#[1] "city"       "tmpd"       "dptp"       "date"       "pm25tmean2" "pm10tmean2" "o3tmean2"   "no2tmean2" 


# it selects all the columns between city and dptp

head(select(chicago, city:dptp))

# it selects all the columns except in this range between city and dptp

head(select(chicago, -(city:dptp)))

chic.f <- filter( chicago, pm25tmean2 > 30 & tmpd > 80)

# order by date column
chicago <- arrange( chicago, date)


