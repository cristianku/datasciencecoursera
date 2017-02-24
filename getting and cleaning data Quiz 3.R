fileurl1 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
dst1 = './data/2006_housing.csv'
download.file(fileurl1, dst1)
data1 = read.csv(dst1)
agricultureLogical = data1$ACR == 3 & data1$AGS == 6
head(which(agricultureLogical), 3)


library(jpeg)
fileurl2 = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
dst2 = './data/jeff.jpg'
download.file(fileurl2, dst2, mode = "wb")
data2 = readJPEG(dst2, native = TRUE)
quantile(data2, probs = c(0.3, 0.8))


library()
fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
dst3a = './data/q3a.csv'
fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
dst3b = './data/q3b.csv'
download.file(fileurl3a, dst3a)
download.file(fileurl3b, dst3b)
gdp = fread(dst3a, skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
edu = fread(dst3b)
merge = merge(gdp, edu, by = 'CountryCode')
nrow(merge)

arrange(merge, desc(Rank))[13, Economy]

# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? 

tapply(merge$Rank, merge$`Income Group`, mean)
# High income: nonOECD    High income: OECD  Lower middle income           Low income  Upper middle income 
# 91.91304             32.96667            107.70370            133.72973             92.13333 

# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

library(Hmisc)
merge$RankGroups <- cut2(merge$Rank, g=5)
table(merge$RankGroups, merge$`Income Group`)



#                     High income: nonOECD High income: OECD Lower middle income Low income Upper middle income
#[  1, 39)                    4                18                   5          0                  11
#[ 39, 77)                    5                10                  13          1                   9
#[ 77,115)                    8                 1                  12          9                   8
#[115,154)                    5                 1                   8         16                   8
#[154,190]                    1                 0                  16         11                   9


