argonHeader <- argonDashHeader(
  gradient = TRUE,
  color = "success",
  separator = TRUE,
  separator_color = "secondary",
  fileInput("ticket_input", "Choose a sales receipt"
  ),
  fileInput("book_input", "Choose a book image"
  )
)