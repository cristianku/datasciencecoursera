#source("https://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

library(rhdf5)
created = h5createFile("example.h5")
created