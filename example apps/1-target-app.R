#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
  
  # Application title
  titlePanel("My first app!"),
  
  # Sidebar with a select input for column of data to use in the histogram
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "column",
        label = "Column used to plot histogram:",
        choices = names(mtcars)
      )
    ),
    
    # Show a histogram of the selected column
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Define server logic required to plot a histogram
server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    # plot the histogram of the specified column of data
    hist(
      x = mtcars[[input$column]],
      main = paste("Histogram of", input$column),
      xlab = input$column
      )
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

