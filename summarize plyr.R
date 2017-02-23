library(plyr)
ddply(InsectSprays, .(spray), summarize , sum=sum(count))
#   spray sum
#1     A 174
#2     B 184
#3     C  25
#4     D  59
#5     E  42
#6     F 200

# Creating a new variable with the total sum within a group ( like the over partition count(*) in sql)

spraySums <- ddply ( InsectSprays, .(spray), summarize, sum= ave(count, FUN=sum) )
head(spraySums)

#   spray sum
#1     A 174
#2     A 174
#3     A 174
#4     A 174
#5     A 174
#6     A 174

