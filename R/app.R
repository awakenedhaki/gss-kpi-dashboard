# DEPENDENCIES =================================================================
library(shiny)

# SOURCING SHINY COMPONENTS ====================================================
source('ui.R')
source('server.R')

# RUN APP ======================================================================
shinyApp(ui = ui, server = server)
