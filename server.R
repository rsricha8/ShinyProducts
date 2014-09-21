library(shiny)
library(ggplot2)

shinyServer(function(input, output) { 
  output$table<- renderDataTable({
    m <- movies[movies$year == input$year,]
    m$BoxOffice <- ifelse(m$rating>8.5,"Blockbuster",ifelse(m$rating>7.5,"Hit", "Flop"))
    m <- m[,c("title","BoxOffice")]
    names(m) <-c("Movie Title", "Box-Office")
    m
    })
  output$plot <- renderPlot({ 
   m <- movies[movies$year == input$year,]
   plot(density(m[,5]),xlab="User Ratings",main="")
   polygon(density(m[,5]), col="Cyan", border="red")
 })
})
