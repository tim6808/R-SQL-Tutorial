
library(dplyr)
con <- DBI::dbConnect(RSQLite::SQLite(), "IMDB_S.sqlite")

alltables = dbListTables(con)
alltables
flights_db <- tbl(con, "ratings")

alltables = dbListTables(DBtest)
alltables

flights_db <- tbl(con, "ratings")



query <- tbl(con, "ratings")

src_tbls(con)