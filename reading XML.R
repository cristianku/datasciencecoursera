setwd("/home/cristianku/Projects/DataScienceCoursera")

if (!file.exists("data")) { dir.create("data")}

library (XML)

fileUrl <- "http://www.w3schools.com/xml/simple.xml"

doc <- xmlTreeParse (fileUrl, useInternal= TRUE)

rootNode <- xmlRoot(doc)

print(rootNode)

print(xmlName(rootNode))

names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode , xmlValue)

xpathSApply(rootNode, "//name", xmlValue)


fileUrl <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"

doc <- htmlTreeParse (fileUrl, useInternal= TRUE)

scores <- xpathSApply(doc, "//div[@class='score']",xmlValue)
print(scores)

teams <- xpathSApply(doc, "//li[@class='team-name']",xmlValue)
print(teams)

