library(tidyverse)

data_library <- read.csv("data_online.csv", stringsAsFactors = FALSE)

data_GG <- read.csv("data_GG_RestingState.csv", stringsAsFactors = FALSE)
data_GG <- data_GG %>% 
  select(starts_with('HRV_'), Participant) %>% 
  mutate(Database = "GG_RestingState") %>% 
  mutate(Recording_Length = rep(8, times = nrow(data_GG))) %>% 
  filter(Participant != 'S200122')  # incomplete data

# Combine data
data_combined <- rbind(data_library, data_GG)

write.csv(data_combined, "data_combined.csv", row.names = FALSE)
