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

#renaming columns
chicago <- rename( chicago , pm25 = pm25tmean2)

# > head(chicago )
# city tmpd   dptp       date pm25 pm10tmean2 o3tmean2 no2tmean2
# 1 chic 31.5 31.500 1987-01-01   NA   34.00000 4.250000  19.98810
# 2 chic 33.0 29.875 1987-01-02   NA         NA 3.304348  23.19099


# calculate a deviation from the mean

chicago <- mutate ( chicago , pm25trend = pm25 - mean(pm25, na.rm =TRUE ))

head(filter(chicago, pm25trend > 0))

#grouping 

# factor ( categorizing between cold and hot )
chicago <- mutate ( chicago, tempcat = factor( 1* ( tmpd > 80 ) , labels = c("cold", "hot")))
head(chicago )

hotcold <- group_by(chicago, tempcat)


summarize ( hotcold, pm25= mean(pm25, na.rm=TRUE), o3= max(o3tmean2), no2 = median(no2tmean2))

# A tibble: 3 <U+00D7> 4
# tempcat     pm25        o3      no2
# <fctr>    <dbl>     <dbl>    <dbl>
#   1    cold 15.97807 66.587500 24.54924
#   2     hot 26.48118 62.969656 24.93870
#   3      NA 47.73750  9.416667 37.44444


chicago %>% mutate(month= as.POSIXlt(date)$mon + 1 ) %>% summarize (pm25 = mean(pm25,na.rm=TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

#pm25      o3      no2
#1 16.23096 66.5875 24.55556

# group by month
chicago %>% mutate(month= as.POSIXlt(date)$mon + 1 ) %>% group_by(month) %>%summarize (pm25 = mean(pm25,na.rm=TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

# month     pm25       o3      no2
# <dbl>    <dbl>    <dbl>    <dbl>
# 1      1 17.76996 28.22222 25.35417
# 2      2 20.37513 37.37500 26.78034
# 3      3 17.40818 39.05000 26.76984
# 4      4 13.85879 47.94907 25.03125
# 5      5 14.07420 52.75000 24.22222
# 6      6 15.86461 66.58750 25.01140
# 7      7 16.57087 59.54167 22.38442
# 8      8 16.93380 53.96701 22.98333
# 9      9 15.91279 57.48864 24.47917 
# 10    10 14.23557 47.09275 24.15217
# 11    11 15.15794 29.45833 23.56537
# 12    12 17.52221 27.70833 24.45773


