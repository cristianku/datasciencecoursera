library(reshape2)
head(mtcars)

#pratically it melts into 1 single column different compatible values from other columns

mtcars$carname <- rownames(mtcars)

carMelt <- melt(mtcars, id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))
head(carMelt,n=3)

# carname gear cyl variable value
# 1     Mazda RX4    4   6      mpg  21.0
# 2 Mazda RX4 Wag    4   6      mpg  21.0
# 3    Datsun 710    4   4      mpg  22.8

#casting data frames

cylData <- dcast( carMelt , cyl ~ variable)

cylData
#    cyl mpg hp
# 1   4  11 11
# 2   6   7  7
# 3   8  14 14

cylData <- dcast( carMelt , cyl ~ variable, mean)

cylData

#   cyl      mpg        hp
#1   4 26.66364  82.63636
#2   6 19.74286 122.28571
#3   8 15.10000 209.21429


# averaging values

head ( InsectSprays)
#   count spray
#1    10     A
#2     7     A
#3    20     A
#4    14     A
#5    14     A
#6    12     A
#    apply to the count   along with spray, function sum  
tapply(InsectSprays$count, InsectSprays$spray,sum)

#  A   B   C   D   E   F 
# 174 184  25  59  42 200 


#split

spIns <- split ( InsectSprays$count, InsectSprays$spray)
spIns

# $A
# [1] 10  7 20 14 14 12 10 23 17 20 14 13

# $B
# [1] 11 17 21 11 16 14 17 17 19 21  7 13


