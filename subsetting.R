set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
# PUT IN DIFFERENT ORDER
X <- X[sample (1:5),];

#PUT SOME NA VALUES
X$var2[c(1,3)]= NA

#subset a specific column
X[,1]
X[,"var1"]

#subset a  ROW RANGE  / specific column
X[1:2,"var2"]

#subset with condition ( ALL COLUMNS)

X[X$var1 <= 3 & X$var3> 11,]

# var1 var2 var3
# 1    3    6   15
# 4    2    8   13
# 5    1   10   12

X[X$var1 <= 3 | X$var3> 15,]

#exclude the NA:

#BEFORE:
X[X$var2 > 8 , ]

#var1 var2 var3
#NA     NA   NA   NA
#4       1   10   11
#NA.1   NA   NA   NA
#5       4    9   13

#AFTER:
X[which(X$var2 > 8 ), ]

#var1 var2 var3
#4    1   10   11
#5    4    9   13
