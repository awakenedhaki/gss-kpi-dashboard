# DEPENDENCIES =================================================================
library(shinydashboard)

# COMPONENTS ===================================================================
inputFile <- sidebarPanel(
  # Input: Select a file
  fileInput('kpiData', 'Select KPI CSV File',
            accept = c('text/csv',
                       'text/comma-separated-values,text/plain','.csv')),
  # Horizontal line
  tags$hr(),
  # Input: Checkbox if file has header
  checkboxInput('header', 'Header', TRUE),
  
  # Horizontal line
  tags$hr(),
  # Input: Select separator
  radioButtons('sep', 'Separator',
               choices = c(Comma = ',',
                           Semicolon = ';',
                           Tab = '\t'),
               selected = ','),
  
  # Horizontal line
  tags$hr(),
  # Input: Select quotes
  radioButtons('quote', 'Quote',
               choices = c(None = '',
                           "Double Quote" = '"',
                           "Single Quote" = "'"),
               selected = '"'),
)

# CONTAINERS ===================================================================
# . HEADER
header <- dashboardHeader(title = 'GSS Key Performance Index')

# . SIDEBAR
sidebar <- dashboardSidebar()

# . BODY
body <- dashboardBody(
  inputFile,
  sidebarPanel(
    plotOutput('contents')
    )
  )

# USER INTERFACE ===============================================================
ui <- dashboardPage(header, sidebar, body)