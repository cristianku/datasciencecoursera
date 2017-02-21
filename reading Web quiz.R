url <- "http://biostat.jhsph.edu/~jleek/contact.html"
##### get from HTTR package
con = (url)
htmlCode = readLines(url)
close(con)



print(c("Char in 10th row ",  nchar(htmlCode[10]) ))
print(c("Char in 20th row ",  nchar(htmlCode[20]) ))
print(c("Char in 30th row ",  nchar(htmlCode[30]) ))
print(c("Char in 100th row ",  nchar(htmlCode[100]) ))

