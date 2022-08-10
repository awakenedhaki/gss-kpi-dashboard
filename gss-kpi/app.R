# LOADING DEPENDENCIES =========================================================
library(shiny)

# CONSTANTS ====================================================================

# USER INTERFACE ===============================================================
# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel('GSS KPI Shiny Dashboard'),
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel()
  )
)

# SERVER FUNCTION ==============================================================
# Define server logic required to draw a histogram ----
server <- function(input, output) {
}

# RUN APP ======================================================================
shinyApp(ui = ui, server = server)





























