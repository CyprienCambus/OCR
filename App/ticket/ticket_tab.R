ticket_tab <- argonTabItem(
  tabName = "ticket",
  
  # classic cards
  argonRow(
    argonColumn(width =  5,
      argonH1("Original image", display = 4)
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
          uiOutput("image")
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
          offset = 3,
          argonInfoCard(
            value = withSpinner(uiOutput("euros"), proxy.height = "10px", size = 0.5),  
            title = "Ticket amount", 
            icon = icon("euro"), 
            icon_background = "info",
            gradient = TRUE,
            background_color = "orange",
            hover_lift = TRUE,
            width = 6
          )
          
        )
      ),argonRow(
        argonColumn(
          width = 12,
          offset = 3,
          argonInfoCard(
            value = withSpinner(uiOutput("dates"), proxy.height = "10px", size = 0.5), 
            title = "Date", 
            icon = icon("calendar"), 
            icon_background = "warning",
            gradient = TRUE,
            background_color = "success",
            hover_lift = TRUE,
            width = 6
          )
          
        )
      ), 
      argonRow(
        argonColumn(width = 12,
                    offset = 3,
                    argonInfoCard(
                      value = withSpinner(uiOutput("heures"), proxy.height = "10px", size = 0.5),
                      title = "Time",  
                      icon = argonIcon("time-alarm"), 
                      icon_background = "danger",
                      gradient = TRUE,
                      background_color = NULL,
                      hover_lift = TRUE,
                      width = 6
                    )
        )
      )
    )
  )
)