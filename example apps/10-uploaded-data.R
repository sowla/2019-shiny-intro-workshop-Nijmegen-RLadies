library(shiny)

ui <- fluidPage(
  
  titlePanel("My more complicated app!"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput(
        inputId = "file",
        label = "Please upload a file:",
        accept = c("text/csv",
          "text/comma-separated-values,text/plain",
          ".csv",
          ".txt")
      ),
      selectInput(
        inputId = "column",
        label = "Column used to plot histogram:",
        # don't give choices at the beginning (since there's no file)
        choices = c("Select column" = "")
      )
    ),
    
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)


server <- function(input, output, session) {
  
  # read in data and make sure it updates dynamically
  my_data <- reactive({
    req(input$file)
    read.csv(input$file$datapath, row.names = 1)
  })
  
  # update column names every time a file is uploaded
  observeEvent(input$file, {
    updateSelectInput(
      session = session,
      inputId = "column",
      choices = names(my_data())
    )
  })

  output$plot <- renderPlot({
    
    hist(
      # read current value of my_data by adding `()`
      x = my_data()[[input$column]],
      main = paste("Histogram of", input$column),
      xlab = input$column
    )
    
  })
  
}

shinyApp(ui = ui, server = server)
