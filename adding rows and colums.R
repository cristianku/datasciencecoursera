set.seed(13435)

X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
# PUT IN DIFFERENT ORDER
X <- X[sample (1:5),];

#PUT SOME NA VALUES
X$var2[c(1,3)]= NA

# adding a new column:
X$var4 = rnorm(5)

#   var1 var2 var3       var4
#1    2   NA   15  0.1875960
#4    1   10   11  1.7869764
#2    3   NA   12  0.4966936
#3    5    6   14  0.0631830
#5    4    9   13 -0.5361329

Y <- cbind(X, rnorm(5))
Y
#   var1 var2 var3       var4    rnorm(5)
#1    2   NA   15  0.1875960  0.62578490
#4    1   10   11  1.7869764 -2.45083750
#2    3   NA   12  0.4966936  0.08909424
#3    5    6   14  0.0631830  0.47838570
#5    4    9   13 -0.5361329  1.00053336