url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
#con = (url)
#htmlCode = readLines(con)
#close(con)
#print(htmlCode)

library(XML)
html <- htmlTreeParse(url, useInternalNodes= T)

print (xpathSApply (html, "//title", xmlValue))

print (xpathSApply (html, "//td[@id='col-citedby']", xmlValue))

##### get from HTTR package

library(httr)
html2 = GET(url )
content2 = content(html2, as="text")
parsedHtml = htmlParse(content2, asText = TRUE)
print(xpathSApply ( parsedHtml,"//title",xmlValue))


### Accessing Websites with passwords
#https://www.r-bloggers.com/search/web+scraping/
#https://cran.r-project.org/web/packages/httr/httr.pdf

fleetcor_html = GET( "https://selfserve.fleetcor.pl/GFNSMEPLWWW/Pages/Public/Login.aspx?ReturnUrl=%2fGFNSMEPLWWW%2fPages%2fcommon%2fhome.aspx"
            , authenticate("PL00001910","Polska123"))

content_fleetcor = content(fleetcor_html, as="text")
parsed_fleetcor = htmlParse(content_fleetcor, asText = TRUE)
print(xpathSApply ( parsed_fleetcor,"//Nazwa firmy",xmlValue))

