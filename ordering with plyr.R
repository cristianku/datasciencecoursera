set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
# PUT IN DIFFERENT ORDER
X <- X[sample (1:5),];

#PUT SOME NA VALUES
X$var2[c(1,3)]= NA


#install.packages("plyr")
library(plyr)


arrange(X, var1)

#   var1 var2 var3
#1    1   10   11
#2    2   NA   15
#3    3   NA   12
#4    4    9   13
#5    5    6   14

# decreasing order
arrange(X, desc(var1))
