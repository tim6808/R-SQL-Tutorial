
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
#  In this tutorial we gonna us IMDB as our dataset.()
DBtest <- dbConnect(sqlite,"IMDB_S.sqlite")
# DBtest <- dbConnect(sqlite,"imdb.db")
alltables = dbListTables(DBtest)
alltables

res <- dbSendQuery(DBtest, "
  SELECT
  *
  FROM titles 
")
# dbFetch(res)
movieData<-dbFetch(res)

# clear data & Disconnect with DB
dbClearResult(res)
dbDisconnect(DBtest)

str(movieData)

# Get data
movieData[movieData$type == 'movie', "primary_title"]


cc <-subset(movieData,type == 'movie')
str(cc)