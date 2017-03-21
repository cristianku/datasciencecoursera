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


par("lty")
# [1] "solid"

par("col")
#[1] "black"

par("pch")
# [1] 1

par("mfrow")
#[1] 1 1


## Base Plotting Functions

# plot : make a scatterplot

# lines : add lines to a plot given a vector x and a vector y: this function just connect the dots

#points: add points to a plot

#text: add text labels to a plot using specified x, y coordinates

#title: add annotations to x, y , axis labels, titles, subtitle , outer margin

#mtext : add arbitrary text to margins( inner or outer ) of the plot

#axis : adding axis ticks / labels



# Base plot with annotation

with ( airquality, plot( Wind, Ozone, main = "Ozone and Wind in New York city "))
with (subset(airquality, Month == 5 ) , points (Wind, Ozone, col="blue"))
with (subset(airquality, Month != 5 ) , points (Wind, Ozone, col="red"))
legend( "topright", pch= 1, col=c("blue", "red"), legend = c("May", "Other Months"))


# Base plot with Regression Line
with ( airquality, plot( Wind, Ozone, main = "Ozone and Wind in New York city ", pch = 20))
model <- lm( Ozone ~ Wind, airquality)
abline(model, lwd =2 )

# Multiple base Plots

par ( mfrow= c(1,2), mar=c(4,4,2,1) , oma= c(0,0,2,0) ) 

model1 <- lm( Ozone ~ Wind, airquality)
model2 <- lm( Ozone ~ Solar.R, airquality)

with( airquality, { plot( Wind, Ozone, main = "Ozone and Wind")
                    abline(model1, lwd =2 )
                    plot( Solar.R, Ozone, main = "Ozone and Solar Radiation")
                    abline(model2, lwd =2 )
                    mtext("Ozone and Weather in New York City", outer = T)
})



# Demo

x <- rnorm(100)
y <- rnorm(100)

plot ( x,y)

title("Scatter Plot")

text(-2,-2, "Label")

legend ("topleft", legend = "Data")
legend ("topleft", legend = "Data", pch=20)

fit <- lm( x~y)
abline(fit)
abline(fit, lwd = 3, col="blue")
plot ( x,y, xlab= "Weight", ylab= "Height")

z <- rpois(100, 2)

par (mfrow=c(2,1))
plot ( x,y, pch=20)
plot ( x,z, pch=20)

g <- gl( 2, 50, labels=c("Male", "Female"))


par (mfrow=c(1,1))
plot ( x, y, type="n")  # type = n , not plotting immediately
points ( x[g=="Male"], y[g=="Male"], col="green")  
points ( x[g=="Female"], y[g=="Female"], col="red", pch=19) 

## plotting to pdf file
pdf(file="data/myplot.pdf")
par (mfrow=c(1,1))
plot ( x, y, type="n")  # type = n , not plotting immediately
points ( x[g=="Male"], y[g=="Male"], col="green")  
points ( x[g=="Female"], y[g=="Female"], col="red", pch=19) 
dev.off()


