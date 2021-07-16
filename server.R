# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    # selected model (car model)
    car = reactive(input$model)
    
    # selected make (company)
    make = reactive(input$make)
    
    # selected location (availability)
    loc = reactive(input$location)
    
    
    
    # if apply is hit, calculate probabilities and store in a data frame
    disp_table = reactive({
        df = toyota
        df = df %>% filter(Model == car()) %>% 
            select(Model, Model_Year, Cost, MPG_city, MPG_hw)
        df
    })
    
    disp_img = reactive({
        df = toyota
        df = df %>% filter(Model == car()) %>% 
            select(Image) %>% 
            .[1,]
    })
    
    output$img <- renderUI({
        tags$img(src = disp_img(), alt = "Image of a car", width = "50%", height = "50%")
    })
    output$tbl <- renderTable(disp_table())
    
    #testing, delete later
    #output$tbl2 <- renderTable(input$symptoms)
    
    #observeEvent(input$diagnose, output$tbl3 <- renderTable(symptoms_table2()))
    
    
})
