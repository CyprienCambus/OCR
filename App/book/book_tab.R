
book_tab <- argonTabItem(
  tabName = "book",
  
  argonRow(
    argonColumn(width =  5,
                argonH1("Original book", display = 4)
    ),
    argonColumn(width = 7,
                argonH1("Optical Character Recognition results", display = 4)
    )
  )
  ,
  argonRow(
    argonCard(
      width = 4,
      src = NULL,
      status = "success",
      shadow = TRUE,
      hover_shadow = TRUE,
      argonRow(
        argonColumn(
          width = 12,
          uiOutput("image_book")
        )
      )
    ),
    argonCard(
      width = 8,
      src = NULL,
      status = "success",
      shadow = TRUE,
      hover_shadow = TRUE,
      argonRow(
        argonColumn(
          width = 12,
          textOutput("book_text")
          
        )
      )
    )
  )
)