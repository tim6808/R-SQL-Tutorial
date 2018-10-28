library(shiny)
library(ggplot2)
library(DT)
library(leaflet)

textA <-textOutput("textFromServer")

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

shinyUI(fluidPage(
  
  titlePanel(textA),

  sidebarLayout(
    sidebarPanel(
      
      numericInput("num_A", "Num_A", value = 0,  min = 1, max = 100),
      numericInput("num_B", "Num_B", value = 0,  min = 1, max = 100),
      # submitButton("Update View", icon("refresh")),
      helpText("Tim add this bouutn to help people to...."),
      # verbatim text
      # verbatimTextOutput("textFromWhere"),
       h1(textOutput("textFromWhere")),
      selectInput("state", "Choose a state:",
                  list(`East Coast` = c("NY", "NJ", "CT"),
                       `West Coast` = c("WA", "OR", "CA"),
                       `Midwest` = c("MN", "WI", "IA"))
      ),
      textOutput("result"),
      
      checkboxInput("somevalue", "not select", FALSE),
      verbatimTextOutput("value"),
      
      dateRangeInput("daterange", "Date range:",
                     start  = "2001-01-01",
                     end    = "2010-12-31",
                     min    = "2001-01-01",
                     max    = "2012-12-21",
                     format = "mm/dd/yy",
                     separator = " - "),
      

      
       h2("data is fun?"),
       h3("data is fun?")
    ),

    mainPanel(
      h1("data is fun?"),
      sliderInput("obs", "Number of observations:",
                  min = 0, max = 1000, value = 500
      ),
      plotOutput("distPlot"),
      
      leafletOutput("mymap"),
      p(),
      actionButton("recalc", "New points"),
      
      plotOutput("ratingPlot"),
      DT::dataTableOutput("cageTable")

    )
  )
))
