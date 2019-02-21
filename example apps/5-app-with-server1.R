library(shiny)


# "read in" data
my_data <- mtcars

# user interface
ui <- 
  fluidPage(
    titlePanel("My first app!"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "column",
          label = "Column used to plot histogram:",
          choices = names(my_data)
        )
      ), 
      mainPanel(
        plotOutput(outputId = "plot")
      )
    )
  )


# server logic
server <- function(input, output) {
  
  ## What happens if you run the app as it is?
  ## 
  ## 
  ## Uncomment the lines below and fill in the blanks
  ## so the histogram will appear in the app
  
  
  # ...$... <- ...({
    
    hist(
      x = my_data[["mpg"]],
      main = paste("Histogram of", "mpg"),
      xlab = "mpg"
    )
    
  # })
  
}


shinyApp(ui = ui, server = server)
