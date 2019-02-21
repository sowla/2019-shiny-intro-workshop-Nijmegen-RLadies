library(shiny)


# "read in" data
my_data <- mtcars

# user interface
ui <- fluidPage(
  
  titlePanel("My more complicated app!"),
  
  sidebarLayout(
    sidebarPanel(
      # change input type and parameter(s) if appropriate
      checkboxGroupInput(
        inputId = "columns",
        label = "Columns to display:",
        choices = names(my_data),
        selected = names(my_data)
      )
    ),
    
    mainPanel(
      # change output type and id
      tableOutput(outputId = "table")
    )
  )
)


# server logic
server <- function(input, output) {
  
  # change output type and id
  output$table <- renderTable({
    
    # remember to check how the input looks, eg:
    # cat(input$columns)
    # class(input$columns)
    
    # add link to input
    my_data[1:10, input$columns, drop = FALSE]
    
  })
  
}

shinyApp(ui = ui, server = server)
