#source("https://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

file.remove("example.h5")
library(rhdf5)
created = h5createFile("example.h5")
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
print(h5ls("example.h5"))

A = matrix(1:10, nr=5, nc =2 )
h5write(A, "example.h5","foo/A")

B = array( seq ( 0.1, 2.0, by = 0.01), dim = c(5,2,2))
attr(B,"scale") <- "liter"
h5write(B,"example.h5", "foo/foobaa/B")
print(h5ls("example.h5"))


readA = h5read("example.h5", "foo/A")
print(readA)

#readB = h5read("example.h5", "foo/foobaa/B")
#print(readB)

#--- writing and reading chunks
h5write(c(12,13,14), "example.h5", "foo/A", index = list(1:3,1) )

print(h5read("example.h5", "foo/A"))

#H5close("example.h5")

                  