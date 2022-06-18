info_tab <- argonTabItem(
  tabName = "info",
  br(), br(), br(), br(),br(), 
  argonRow(
    argonColumn(width = 4,
                offset = 4,
                htmltools::tags$div(
                  class = "card-profile-image",
                  htmltools::a(
                    href = "https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html",
                    htmltools::img(src='logo_tesseract.png', align = "center")
                  )
                )
                
    ),br(), br(), br(), br(), br(), br(), br(), br(), br(), br(),
    argonRow(
      argonColumn(offset = 6,
        img(src='Architechture-of-Tesseract-OCR.png', align = "center")
      )
    )
))