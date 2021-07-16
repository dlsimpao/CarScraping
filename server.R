# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output, session) {
    # selected make (company)
    make = reactive(input$make)
    
    # selected model (car model)
    models = reactive({
        if(make() == "Toyota"){
            df = toyota$Model
        }else if(make() == "Hyundai"){
            df = hyundai$Model
        }
        df
    })
    
    
    # selected location (availability)
    loc = reactive(input$location)
    
    
    
    # if apply is hit, calculate probabilities and store in a data frame
    disp_table = eventReactive(input$search,{
        if(input$make == "Toyota"){
            df = toyota
            df = df %>% filter(Model == input$model) %>% 
                select(Model, Model_Year, Cost, MPG_city, MPG_hw)
        }else if(input$make == "Hyundai"){
            df = hyundai
            df = df %>% filter(Model == input$model) %>% 
                select(Model, Model_Year, Cost, MPG_city, MPG_hw, Elec_hpkw,
                       Elec_Range_miles)
        }
        df
    })
    
    disp_img = eventReactive(input$search,{
        if(input$make == "Toyota"){
            df = toyota
            df = df %>% filter(Model == input$model) %>% 
                select(Image) %>% 
                .[1,] 
        }else if(input$make == "Hyundai"){
            df = hyundai
            df = df %>% filter(Model == input$model) %>% 
                select(Image) %>% 
                .[1,] 
        }
        df
    })
    
    output$img <- renderUI({
        tags$img(src = disp_img(), alt = "Image of a car", width = "50%", height = "50%")
    })
    output$tbl <- renderTable(disp_table())
    
    # observe changes in make, give models
    observe({
        updateSelectInput(session,"model",
                          choices = models(),
                          selected = models()[[1]]
        )
    })
    
    #testing, delete later
    #output$tbl2 <- renderTable(input$symptoms)
    
    #observeEvent(input$diagnose, output$tbl3 <- renderTable(symptoms_table2()))
    
    
})
