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
server <- function(input, output) {}


shinyApp(ui = ui, server = server)
