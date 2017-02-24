install.packages(repos=NULL, pkgs="plyr_1.8.3.tar.gz")

library(plyr)

df1 = data.frame (id=sample(1:10),x=rnorm(10))
df2 = data.frame (id=sample(1:10),y=rnorm(10))
df3 = data.frame (id=sample(1:10),z=rnorm(10))

dflist = list(df1,df2,df3)
join_all(dflist)