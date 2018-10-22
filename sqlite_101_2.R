
# check workstation
getwd()
# set workstation
setwd(dir = "/Users/tim/NTUST/")
# setwd("c:/docs/mydir")  # note / instead of \ in windows 
# Check again
getwd()

# install package
# install.packages("RSQLite")
# install.packages("dplyr")
# install.packages("DBI")

# learn about please use ?DBI


library(RSQLite)

sqlite <- dbDriver("SQLite")
#  In this tutorial we gonna us temp.sqlite as our dataset, it is a empty sqlite3 DB 
DBtest <- dbConnect(sqlite,"temp.sqlite")
alltables = dbListTables(DBtest)
alltables


# please create a data.frame  as follow and name it ratingData :
#   _id rating votes
# 1 1    5.8  1425
# 2 2    6.4   168
# 3 3    6.6  1023

# ratingData <- data.frame("_id" = 1:3, "rating" = c(5.8,6.4,6.6), "votes" = c("1425","168","1023"))

# insert data into temp.sqlite & check it
dbWriteTable(DBtest, "ratingData",ratingData)
dbListTables(DBtest)

# Remove table
# Before remove table we need to create a Transaction point
dbBegin(DBtest)
dbRemoveTable(DBtest, "ratingData")
# if something go bad...we still can Rollback
dbRollback(DBtest)
# after all the action we can Commit it
dbCommit(DBtest)  


# And please check the DB we used on SQLiteDatabaseBrowser or something like it.

# 
testDF<-dbReadTable(DBtest, "ratingData")

testDF
str(testDF)
typeof(testDF)
class(testDF)

# Please add 1 row of new Rating and print it out
# Answer
# newRating <- data.frame("_id" = 12, "rating" = c(8.9), "votes" = c("345663"))
# rbind(testDF,newRating)

# Disconnect
dbDisconnect(DBtest)


