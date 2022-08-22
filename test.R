library(tidyverse)
library(ggthemes)

# GENERATING EXAMPLE DATA ======================================================
generateFullYearCommitteeEntry <- function(committee.name) {
  # . COMMITTEE NAME ===========================================================
  committee.name <- rep(committee.name, 12)
  
  # . DATES ====================================================================
  days <- rep(1, 12)
  months <- 1:12
  years <- rep(2022, 12)
  response.date <- tibble(days, months, years) %>% 
    mutate(my_date = paste(days, months, years, sep = '-')) %>% 
    mutate(my_date = as.Date(my_date, format = '%d-%m-%Y')) %>% 
    pull(my_date)
  
  # . COUNCIL PERIOD ===========================================================
  council.period <- response.date
  
  # . SUBMITTER ROLE ===========================================================
  submitter.role <- sample(c('Chair', 'Council', 'Ordinary Member'), size = 12, replace = TRUE)
  
  # . EXPECTED NMEETINGS =======================================================
  expected.nmeetings <- rep(2, 12)
  
  # . ACTUAL NMEETINGS =========================================================
  actual.nmeetings <- sample(x = 0:2, size = 12, replace = TRUE)
  
  # . TRUE/FALSE ===============================================================
  met.quorum <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  submitted.minutes <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  submitted.council.update <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  completed.council.submission <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  reason.no.meetings <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  reason.no.quorum <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  reason.no.meeting <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  reason.no.minutes <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  reason.no.council.update <- sample(x = c('0', '1'), size = 12, replace = TRUE)
  
  return(tibble(
  	# Dates
  	response.date,
  	council.period,
  	# Committee Identity
  	committee.name,
  	submitter.role,
  	# Meeting specific
  	expected.nmeetings,
  	actual.nmeetings,
  	# Binary
  	met.quorum,
  	submitted.minutes,
  	submitted.council.update,
  	completed.council.submission,
  	reason.no.meeting,
  	reason.no.quorum,
  	reason.no.minutes,
  	reason.no.council.update
  ))
}

# GENERATING DATA FRAME ========================================================
committee.names <- factor(as.character(1:10), levels=as.character(1:10))
tmp <- bind_rows(lapply(committee.names, FUN = generateFullYearCommitteeEntry))

summarized.committees <- tmp %>%
  group_by(committee.name) %>%
  summarize(
    meeting.compliance.ratio = sum(actual.nmeetings) / sum(expected.nmeetings),
    meeting.quorum = mean(as.numeric(met.quorum)),
    submitted.minutes = mean(as.numeric(submitted.minutes)),
  	submitted.council.update = mean(as.numeric(submitted.council.update)),
  	completed.council.submission = mean(as.numeric(completed.council.submission)),
  	reason.no.meeting = mean(as.numeric(reason.no.meeting)),
  	reason.no.quorum = mean(as.numeric(reason.no.quorum)),
  	reason.no.minutes = mean(as.numeric(reason.no.minutes)),
  	reason.no.council.update = mean(as.numeric(reason.no.council.update))
  )

summarized.committees %>%
  ggplot() +
    geom_col(aes(x = committee.name, y = meeting.compliance.ratio), fill = 'firebrick', color = 'black') +
    labs(x = 'Committee Name', y = 'Meeting Compliance Ratio') +
    theme_clean() +
    theme(legend.position = 'none')

summarized.committees %>%
  ggplot() +
    geom_col(aes(x = committee.name, y = meeting.quorum), fill = 'firebrick', color = 'black') +
    labs(x = 'Committee Name', y = 'Meeting Compliance Ratio') +
    theme_clean() +
    theme(legend.position = 'none')






























