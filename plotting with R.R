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

#lty = the line type ( default is solid line ), can be dashed, dotted, etc..

#lwd = the line width , specified as an integer multiple

#col = the plotting, specified as a number , string, or hex code: the colors() function gives you a vector of colors by name

#xlab = character string for the x-axis label

#ylab = character string for the y-axis label

# global plotting parameters

# the par() is used to specify global graphics parameters

#las = the orientation of x-axis on the plot
#bg  = the background color
#mar = the margin size
#oma = the outer margin size ( default is 0 for all sides )
#mfrow= number of plots per row , column ( plots are filled row-wise)
#mfcol = number of plots  per row , column ( plots are filled column-wise)





