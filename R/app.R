# LOADING DEPENDENCIES =========================================================
# . Data manipulations
library(dplyr)
library(ggplot2)
library(magrittr)
library(ggthemes)

# . Dashboard
library(shiny)
library(shinydashboard)

# FUNCTIONS ====================================================================
.mean <- function(column) {
  mean(as.numeric(column))
}

quotient <- function(column1, column2) {
  sum(column1) / sum(column2)
}

summarizeCommittees <- function(df) {
  df %>%
    group_by(committee.name) %>%
    summarize(
      meeting.compliance.ratio     = quotient(actual.nmeetings, 
                                              expected.nmeetings),
      meeting.quorum               = .mean(met.quorum),
      submitted.minutes            = .mean(submitted.minutes),
      submitted.council.update     = .mean(submitted.council.update),
      completed.council.submission = .mean(completed.council.submission),
      reason.no.meeting            = .mean(reason.no.meeting),
      reason.no.quorum             = .mean(reason.no.quorum),
      reason.no.minutes            = .mean(reason.no.minutes),
      reason.no.council.update     = .mean(reason.no.council.update)
  )
}

complianceRatio <- function(df) {
  df %>%
    ggplot() +
      geom_col(aes(x = committee.name, y = meeting.compliance.ratio), 
               fill = 'firebrick', color = 'black') +
      labs(x = 'Committee Name', y = 'Meeting Compliance Ratio') +
      theme_clean() +
      theme(legend.position = 'none')
}

# USER INTERFACE ===============================================================
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


ui <- dashboardPage(
  dashboardHeader(title = 'GSS Key Performance Index'),
  dashboardSidebar(),
  dashboardBody(
    inputFile,
    sidebarPanel(
      mainPanel(
        plotOutput('contents')
      )
    )
  )
)

# SERVER FUNCTION ==============================================================
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  output$contents <- renderPlot({
    req(input$kpiData)
    df <- read.csv(input$kpiData$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote)
    
    summarizedCommittees <- summarizeCommittees(df)
    return(complianceRatio(summarizedCommittees))
  })
}

# RUN APP ======================================================================
shinyApp(ui = ui, server = server)
