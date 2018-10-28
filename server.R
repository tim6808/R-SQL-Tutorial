library(shiny)


library(RSQLite)
library(DBI)

library(ggplot2)
library(dplyr) 


con <- dbConnect(RSQLite::SQLite(), "cage.db")
dbListTables(con)

dbReadTable(con, "cage")

res <- dbSendQuery(con, "SELECT * FROM cage limit 1000")
data_T<-dbFetch(res)
# str(data_T)
dbClearResult(res)
dbDisconnect(con)

arating <- data_T %>% 
  arrange(desc(rating)) %>%
  select(premiered, rating) %>%
  filter(rating != '<NA>')

# arating
# str(arating)

arating <- as.data.frame(sapply(arating, as.numeric))

arating_print <-arating %>%
  group_by(premiered) %>%
  summarise(avg_rating = mean(rating))


ymx<-strtoi(max(arating_print$premiered, na.rm = TRUE), base = 0L)
ymi<-strtoi(min(arating_print$premiered, na.rm = TRUE), base = 0L)


r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()


shinyServer(function(input, output) {
  
  output$maxyear <- renderText({ymx})
  output$minyear <- renderText({ymi})
  
  output$textFromServer <- renderText({"this is from server.R"})
  
  output$textFromWhere <- renderText({input$num_A + input$num_B })
  
  output$result <- renderText({
    paste("You chose", input$state)
  })
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points())
  })

  
  output$value <- renderText({ input$somevalue })

  output$distPlot <- renderPlot({

    hist(rnorm(input$obs))
    
  })
  output$ratingPlot <- renderPlot({
    
    ggplot(data = arating_print,
           mapping = aes(x = premiered, y = avg_rating)) +
      geom_line()
    
  })
  output$cageTable = DT::renderDataTable({
    data_T
  })
  
})
