library(tidyverse)

data_library <- read.csv("data_online.csv", stringsAsFactors = FALSE)

data_GG <- read.csv("data_GG_RestingState.csv", stringsAsFactors = FALSE)
data_GG <- data_GG %>% 
  select(starts_with('HRV_'), Participant) %>% 
  mutate(Database = "GG_RestingState") %>% 
  mutate(Recording_Length = rep(8, times = nrow(data_GG))) %>% 
  filter(Participant != 'S200122')

# data_Fiction <- read.csv("data_Fiction_RestingState.csv", stringsAsFactors = FALSE)
# data_Fiction <- data_Fiction %>% 
#   select(starts_with('HRV_'), Participant) %>% 
#   mutate(Database = "Fiction_RestingState") %>% 
#   mutate(Recording_Length = rep(8, times = nrow(data_Fiction)))

# Combine data
data_combined <- rbind(data_library, data_GG)
# data_combined <- rbind(data_combined, data_Fiction)

write.csv(data_combined, "data_combined.csv", row.names = FALSE)


# hrv_cols <- names(select(data_combined, -Database, -Recording_Length, -Participant))
# 
# nans <- data_combined %>% 
#   group_by(Database) %>%
#   select(one_of(hrv_cols)) %>%
#   summarise_all(function(x) sum(is.na(x)) / n())
# 
# nans <- nans[sapply(nans, function(x) if(is.character(x)) return(TRUE) else sum(x) > 0)]
# nans
# data_combined %>%
#   filter(is.na(HRV_RMSSD)) %>%
#   select(Participant, Database)

