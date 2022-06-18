fra <- tesseract("fra")
eng <- tesseract("eng")


preprocess <- function(file){
  input <- image_read(file)
  text <- input %>%
    image_resize("500x") %>%
    image_convert(type = 'Grayscale') %>%
    image_trim(fuzz = 40) %>%
    image_write(format = 'jpg', density = '300x300') %>%
    tesseract::ocr(engine = fra) 
  text <- str_replace(text, ' / ', '\n')
  text <- unlist(strsplit(text, "\\\n"))
  text <- str_to_lower(text)
}


get.info <- function(raw_text, param){
  
  if (param == "date"){
    res <- raw_text[grep(pattern = "Date", raw_text, ignore.case = T)]
    res <- sub(".*date : ", "", res) 
  }else if(param == "heure"){
    res <- raw_text[grep(pattern = "Heure", raw_text, ignore.case = T)]
    res <- sub(".*heure : ", "", res) 
  }else{
    res <- raw_text[grep(pattern = "Carte", raw_text, ignore.case = T)]
    res <- sub(".*carte bancaire nfc ", "", res) 
  }
  
  return(res)
}


get.book.info <- function(file){
  input <- image_read(file)
  text <- input %>%
    image_resize("500x") %>%
    image_convert(type = 'Grayscale') %>%
    image_trim(fuzz = 30) %>%
    image_write(format = 'jpg', density = '300x300') %>%
    tesseract::ocr(engine = eng) 
  
  text <- unlist(strsplit(text, "\\\n"))
  text <- text[-1]
  return(glue_collapse(text, sep = "\n"))
}



