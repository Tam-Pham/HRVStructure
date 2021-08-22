library(tidyverse)

data_library <- read.csv("data/data.csv", stringsAsFactors = FALSE)

data_GG <- read.csv("data/data_GG_RestingState.csv", stringsAsFactors = FALSE)
data_GG <- data_GG %>% 
  select(starts_with('HRV_'), Participant) %>% 
  mutate(Database = "GG_RestingState") %>% 
  mutate(Recording_Length = rep(8, times = nrow(data_GG)))

data_Fiction <- read.csv("data/data_Fiction_RestingState.csv", stringsAsFactors = FALSE)
data_Fiction <- data_Fiction %>% 
  select(starts_with('HRV_'), Participant) %>% 
  mutate(Database = "Fiction_RestingState") %>% 
  mutate(Recording_Length = rep(8, times = nrow(data_Fiction)))

# Combine data
data_combined <- rbind(data_library, data_GG)
data_combined <- rbind(data_combined, data_Fiction)

write.csv(data_combined, "data/data_combined.csv", row.names = FALSE)
