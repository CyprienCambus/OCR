argonSidebar <- argonDashSidebar(
  tags$head(tags$style(
    type="text/css",
    "#my_sidebar img {max-width: 500px; width: 150px; height: auto}
    @media(max-width:767.98px){
      #my_sidebar img {width: 100px;}
    }
    "
  ),
  tags$style("
  @media(max-width:767.98px){
    #sidenav-collapse-main {
    position: relative;
}
.navbar-collapse .collapse-brand img {

    width: 46px!important;
}
  }
  "),
  tags$style(".navbar-vertical.navbar-expand-md .navbar-brand-img {
  max-height: 10rem;
}"),tags$style(".navbar-vertical.navbar-expand-md {
    position: fixed;
    top: 0;
    bottom: 0;
    display: block;
    overflow-y: auto;
    width: 100%;
    max-width: 250px;
    padding-right: 1.5rem;
    padding-left: 1.5rem;
    overflow-y: unset;
}
    @media(max-width:767.98px){

      .navbar-vertical.navbar-expand-md {position: relative;max-width: 100%;}
      .d-md-none {display: none;}
    }
")),
  vertical = TRUE,
  skin = "light",
  background = "white",
  size = "md",
  side = "left",
  id = "my_sidebar",
  includeCSS("www/custom.css"),
  brand_url = "https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html",
  brand_logo = "https://zupimages.net/up/22/24/jkwb.png",
  br(), br(), br(), br(), br(), br(),
  argonSidebarHeader(title = "Main Menu"),
  argonSidebarMenu(
    argonSidebarItem(
      tabName = "ticket",
      icon = argonIcon(name = "shop", color = "info"),
      "Sales receipt"
    ),
    argonSidebarItem(
      tabName = "book",
      icon = argonIcon(name = "books", color = "green"),
      "Book"
    ),
    argonSidebarItem(
      tabName = "info",
      icon = argonIcon(name = "planet", color = "warning"),
    "About tesseract"
    )
  )
)