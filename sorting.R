set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
# PUT IN DIFFERENT ORDER
X <- X[sample (1:5),];

#PUT SOME NA VALUES
X$var2[c(1,3)]= NA


#   var1 var2 var3
#1    2   NA   15
#4    1   10   11
#2    3   NA   12
#3    5    6   14
#5    4    9   13

sort (X$var1)
# [1] 1 2 3 4 5

sort (X$var1, decreasing = T)
# [1] 5 4 3 2 1

sort (X$var2, na.last =  T)
# [1]  6  9 10 NA NA

# ORDERING
# ORDERING
# ORDERING

X[order(X$var1),]
#   var1 var2 var3
#4    1   10   11
#1    2   NA   15
#2    3   NA   12
#5    4    9   13
#3    5    6   14

#order by multiple variales
X[order(X$var1,X$var3),]

#   var1 var2 var3
#4    1   10   11
#1    2   NA   15
#2    3   NA   12
#5    4    9   13
#3    5    6   14





