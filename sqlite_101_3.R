
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
alltables = dbListTables(DBtest)
alltables

ratingsTable<-dbReadTable(DBtest, "ratings")
# before open it PLEASE know your data
str(ratingsTable)
summary(ratingsTable) 

# get  rating
rating<-as.matrix(ratingsTable[2])
# quantile
ratingQ<-quantile(x<-rating)

str(ratingQ)
ratingQ

hist(x=ratingQ, 
     main="quantile of rating",         # 圖片的名稱
     xlab="rating",                      # X軸的名稱
     ylab="count")                  # Y軸的名稱


boxplot(ratingQ, # Y ~ X  
       data = ratingQ,       # data
       xlab = "Month",          # X name
       ylab = "Ozone (ppb)",    # Y name
       col ="gray")             # color


# please try to get votes


dbDisconnect(DBtest)