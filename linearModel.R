> set.seed(20)
> x <- rnorm(100)
> e <- rnorm(100,0,2)
> summary(e)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-3.5860 -1.2220  0.5151  0.1795  1.6970  3.8320 
> summary(x)
Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-2.890000 -0.600500 -0.024860  0.004908  0.768400  2.208000 
> plot (x,y)
Error in xy.coords(x, y, xlabel, ylabel, log) : object 'y' not found
> plot (x,e)
> y <- 0.5 + 2*x + e
> summary(y)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 
> plot( x,y)
> 