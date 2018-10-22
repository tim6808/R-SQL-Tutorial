# install.packages("RSQLite")

# install.packages("dplyr")

setwd(dir = "/Users/tim/NTUST/")
# setwd("c:/docs/mydir")  # note / instead of \ in windows 

getwd()
dir()

library(dplyr)
library(RSQLite)
# SQL way

sqlite <- dbDriver("SQLite")
DBtest <- dbConnect(sqlite,"IMDB_S.sqlite")
alltables = dbListTables(DBtest)
alltables

res <- dbSendQuery(DBtest, "
                   SELECT 
                   * 
                   FROM ratings 
                   
                   limit 3")
dbFetch(res)

#Clear the results of the last query
dbClearResult(res)


# R way
library(DBI)
con <- dbConnect(RSQLite::SQLite(), "IMDB_S.sqlite")
dbListTables(con)

dbReadTable(con, "titles")

res <- dbSendQuery(con, "SELECT * FROM titles limit 100")
data_T<-dbFetch(res)

head(data_T)

data_T %>% 
select(title_id, primary_title,premiered) %>%
  filter(premiered == '1892')


# Clear the result
dbClearResult(res)




# Create an ephemeral in-memory RSQLite database
con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

dbListTables(con)
# Disconnect from the database
dbDisconnect(con)




dbWriteTable(con, "d1", d1)


help.search("dbWriteTable")


sqlite <- dbDriver("SQLite")
tempDB <- dbConnect(sqlite,"temp.sqlite")
dbListTables(tempDB)
dbDisconnect(tempDB)

d1 <- matrix(c('A',12,'B',12,'C',21,'C',22,'D',11),ncol=2,byrow=TRUE)
colnames(d1) <- c("NM","num")
rownames(d1) <- c(1,2,3,4,5)

d1 <- as.table(d1)
d1

dbWriteTable(tempDB, "d1", d1)
?dbWriteTable


con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbWriteTable(con, "mtcars", mtcars[1:5, ])

dbReadTable(con, "mtcars")
str(d1)
str(mtcars[1:5, ])


x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
x 
dbWriteTable(con, "x", x)
dbListTables(con)
