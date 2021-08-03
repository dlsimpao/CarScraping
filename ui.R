library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Car Information - xxxxx"),
    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Limited make and locations for now:"),
            selectInput("make", "Select Make:", c("Toyota", "Hyundai","Honda"), selected = "Toyota"),
            selectInput("model", "Select Model:",  ""),
            selectInput("location", "Select location", c("xxxxx")),
            
            actionButton("search","Search")
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("tbl"),
            uiOutput("img")

        )
    )
))
