setwd("~/Desktop")
getwd()

library(readxl)
library(tidyverse)
fst_tbl <- read_xlsx("book1.xlsx", col_names = TRUE)


fst_tbl %>%
  ggplot(aes(x = pop1, y = pop2, fill = fst)) + 
  geom_tile() + 
  labs(x = "Population 1", y = "Population 2") + 
  ggtitle("Population differentiation of King Mackerel Stocks") +
  theme(plot.title = element_text(hjust = 0.5))
ggsave(filename = 'FST of king mack pops.png', width = 5, height = 5, bg = "transparent")
