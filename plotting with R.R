pollution <- read.csv("./data/avgpm25.csv")
head(pollution)

# base plot

library(datasets)
with ( cars, plot ( speed, dist ))

# LATTICE PLOT   ciao
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# gg plot 2
library(ggplot2)
qplot(displ, hwy, data= mpg)

# simple basic graphis : boxplot
library (datasets)
airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality , xlab = "Month", ylab = "Ozone (ppb ) ")


# plotting parameters:

#pch = the plotting sympol ( default is open circle)

#lty
