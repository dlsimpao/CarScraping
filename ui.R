library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Car Information - 93311"),
    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Limited make and locations for now:"),
            selectInput("make", "Select Make:", c("Toyota", "Hyundai","Honda"), selected = "Toyota"),
            selectInput("model", "Select Model:",  ""),
            selectInput("location", "Select location", c("93311")),
            
            actionButton("search","Search")
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("tbl"),
            uiOutput("img")

        )
    )
))
