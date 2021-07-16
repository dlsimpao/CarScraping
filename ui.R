library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Car Scraping - Toyota - 93311"),
    
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Limited make and locations for now:"),
            selectInput("make", "Select Make:", c("Toyota")),
            selectInput("model", "Select Model:",  toyota$Model),
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
