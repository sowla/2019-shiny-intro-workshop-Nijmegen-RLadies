library(shiny)


# user interface
ui <- 
  fluidPage(
    titlePanel("My first app!"),
    sidebarLayout(
      sidebarPanel(), 
      mainPanel()
    )
  )


# server logic
server <- function(input, output) {}


shinyApp(ui = ui, server = server)
