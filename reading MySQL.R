library("RMySQL");
dbConnection <- dbConnect(MySQL(), user = "genome", host="genome-mysql.cse.ucsc.edu", db="hg19")

# show databases
databases_list <- dbGetQuery(dbConnection, "show databases;")
print(head(databases_list))

#aaaaaaaaaaaaaaaaa

# show tables list

tables_list <- dbListTables(dbConnection)
print(tables_list[1:5])


# list fields on specific table
affy_fields <- dbListFields(dbConnection, "affyU133Plus2")
print ( affy_fields)

# execute a single query 
select <- dbGetQuery(dbConnection,"select count(*) from affyU133Plus2 ")
print(head(select))

# read entire table 
#affyData <- dbReadTable(dbConnection,"affyU133Plus2")

#print(head(affyData))


# Create a Cursor and fetch entire cursor
affy_cursor <- dbSendQuery(dbConnection, "select * from affyU133Plus2 where misMatches between 1 and 3")
affy_fetch <- fetch(affy_cursor)
#print (head(affy_fetch))

print(quantile(affy_fetch$misMatches))
print(dim(affy_fetch))
#print(summary(affy_fetch))

dbClearResult(affy_cursor)

# Create a Cursor and fetch only n-rows

affy_cursor <- dbSendQuery(dbConnection, "select * from affyU133Plus2 where misMatches between 1 and 3")
affy_fetch2 <- fetch(affy_cursor,n=10)

dim(affy_fetch2)

dbClearResult(affy_cursor)



# Disconnect from Db

dbDisconnect(dbConnection)
