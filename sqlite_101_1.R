
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

# setup a connection with a DB in memory
con <- dbConnect(RSQLite::SQLite(), ":memory:")
# check~ there is no data and table in there
# this will show all the table in DB
dbListTables(con)

# dbDisconnect(con)

# Create  data.frame
x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
x 
#  ?dbWriteTable
dbWriteTable(con, "people", x)

dbListTables(con)

dbReadTable(con, "people")

# Create other data.frame 
y <- data.frame("SN" = 100:101, "Age" = c(58,73), "Name" = c("Jack","Tom"))
y 

# add data 
dbWriteTable(con, "people",y , append = TRUE)

dbReadTable(con, "people")
# overwrite data

#  please replace "append" with overwrite
# dbWriteTable(con, "people", x, overwrite = TRUE)
# dbReadTable(con, "people")


# Disconnect
dbDisconnect(con)

