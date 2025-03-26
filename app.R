library(shiny)
library(DT)
library(quantmod)
library(ggplot2)
library(dplyr)

# UI
ui <- fluidPage(
  titlePanel("Real-Time Stock Market Dashboard"),
  sidebarLayout(
    sidebarPanel(
      textInput("stock", "Enter Stock Symbol:", "AAPL"),
      actionButton("update", "Get Data"),
      sliderInput("days", "Days of Data:", min = 30, max = 365, value = 90)
    ),
    mainPanel(
      plotOutput("stockPlot"),
      dataTableOutput("stockTable")
    )
  )
)

# Server
server <- function(input, output) {
  stock_data <- eventReactive(input$update, {
    stock_symbol <- toupper(input$stock)
    getSymbols(stock_symbol, src = "yahoo", auto.assign = FALSE)
  })
  
  output$stockPlot <- renderPlot({
    req(stock_data())
    df <- data.frame(Date = index(stock_data()), coredata(stock_data()))
    df <- df %>% select(Date, contains("Adjusted")) %>% tail(input$days)
    colnames(df)[2] <- "Price"
    
    ggplot(df, aes(x = Date, y = Price)) +
      geom_line(color = "blue", size = 1) +
      labs(title = paste("Stock Price for", input$stock), x = "Date", y = "Price") +
      theme_minimal()
  })
  
  output$stockTable <- renderDataTable({
    req(stock_data())
    df <- data.frame(Date = index(stock_data()), coredata(stock_data()))
    df <- df %>% select(Date, contains("Adjusted")) %>% tail(input$days)
    colnames(df)[2] <- "Price"
    
    datatable(df)
  })
}

# ✅ This must be at the end
shinyApp(ui, server)
