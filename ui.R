library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(   
  titlePanel(title="Box Office Movies Performance Prediction"), 
  sidebarLayout(position = "left",  fluid="TRUE",                 
      sidebarPanel(width=3,
      HTML('<body bgcolor="#E6E6FA">') ,
      HTML('<p>This application classifies the movies of a given year into Hit,
              Flop and blockbuster based on the users ratings.
            </p><br>
            <p> Select an year from drop down below, and on your right, find the
            ratings distribution of movies in that year. <i> The ratings are
            taken from IMDB database</i>. Followed by a table of movies labeled 
            with Hit, Flop or blockbuster</p><br><br>') ,
      HTML('<br><br>'),
      h4('Select Year:'),
      HTML('<body bgcolor="#E6E6FA">') ,
      selectInput(inputId = "year",label="Year of Release:",choices=sort(unique(movies$year),decreasing=TRUE))
      ),
      mainPanel( width= 6, 
      plotOutput(outputId="plot"),
      dataTableOutput(outputId="table")
      
      )
  )
)
)
