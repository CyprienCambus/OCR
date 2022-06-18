library(shiny)
library(argonR)
library(argonDash)
library(magrittr)
library(base64enc)
library(tesseract)
library(magick)
library(stringr)
library(shinycssloaders)
library(glue)

# template
source("sidebar.R")
source("navbar.R")
source("header.R")
source("footer.R")

# elements
source("cards/cards_tab.R")
source("tabs/tabsets_tab.R")
source("alerts/alerts_tab.R")
source("functions.R")

# App
shiny::shinyApp(
  ui = argonDashPage(
    title = "Argon Dashboard Demo",
    author = "David",
    description = "Argon Dash Test",
    
    sidebar = argonSidebar,
    navbar = argonNav, 
    header = argonHeader,
    body = argonDashBody(
      argonTabItems(
        cards_tab,
        tabsets_tab,
        alerts_tab
      )
    )
  ),
  server = function(input, output,session) {
    options(shiny.maxRequestSize=30*1024^2)
    base64 <- reactive({
      inFile <- input$ticket_input
      if(!is.null(inFile)){
        dataURI(file = inFile$datapath, mime = "image/jpg")
      }
    })
    
    output$image<- renderUI({
      if(!is.null(base64())){
        tags$div(
          tags$img(src= base64(), width="100%"),
          style = "width: 400px;"
        )
      }
    })
    
    
    base64_book <- reactive({
      inFile <- input$book_input
      if(!is.null(inFile)){
        dataURI(file = inFile$datapath, mime = "image/jpg")
      }
    })
    
    output$image_book <- renderUI({
      if(!is.null(base64_book())){
        tags$div(
          tags$img(src= base64_book(), width="100%"),
          style = "width: 400px;"
        )
      }
    })
    
    df <- reactive({
      req(!is.null(base64()))
      raw <- preprocess(input$ticket_input$datapath)
      res <- c(get.info(raw, "Carte"), get.info(raw, "date"), get.info(raw, "heure"))
      return(res)
    })
    
    output$euros <- renderUI({
      df()[1]
    })
    
    output$dates <- renderUI({
      df()[2]
    })
    
    output$heures <- renderUI({
      df()[3]
    })
    
    output$book_text <- renderText({
      req(!is.null(input$book_input))
      get.book.info(input$book_input$datapath)
    })
    
    
  }
)