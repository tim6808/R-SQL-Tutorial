
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

res <- dbSendQuery(DBtest, "
  SELECT
  title_id,
  original_title,
  premiered
  FROM titles 
                   
  limit 3")
# dbFetch(res)
movieData<-dbFetch(res)

# clear data & Disconnect with DB
dbClearResult(res)
dbDisconnect(DBtest)

str(movieData)

# SELECT
# "movieTitle"."original_title",
# "movieTitle"."title_id",
# "movieTitle"."premiered",
# "movieRatings"."rating"
# 
# FROM "titles" as "movieTitle"
# left join "ratings" as "movieRatings" on "movieTitle".title_id ="movieRatings".title_id 
# 
# Where "movieRatings"."rating" --<> null
# 
# order by "movieRatings"."rating" desc
# limit 100




# Please don't try it on the 5G DB it will take 5min.
# SELECT
# "movieTitle"."original_title",
# "movieTitle"."title_id",
# "movieTitle"."premiered",
# "movieRatings"."rating",
# "movieCrew"."person_id",
# "moviePeople"."name"
# 
# 
# FROM "titles" as "movieTitle"
# left join "ratings" as "movieRatings" on "movieTitle".title_id ="movieRatings".title_id 
# left join "crew" as "movieCrew" on "movieTitle".title_id ="movieCrew".title_id 
# left join "people" as "moviePeople" on "movieCrew".person_id ="moviePeople".person_id 
# 
# 
# Where "moviePeople"."name"  ='Nicolas Cage'--not null --William Shakespeare
# 
# order by "movieRatings"."rating" desc
# limit 100
