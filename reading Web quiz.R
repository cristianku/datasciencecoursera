url <- "http://biostat.jhsph.edu/~jleek/contact.html"
##### get from HTTR package
con = (url)
htmlCode = readLines(url)
close(url)



print(c("Char in 10th row ",  nchar(html_result[10]) ))
print(c("Char in 20th row ",  nchar(html_result[20]) ))
print(c("Char in 30th row ",  nchar(html_result[30]) ))
print(c("Char in 100th row ",  nchar(html_result[100]) ))

