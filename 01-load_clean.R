library(tidyverse)
library(janitor)

data <- read_csv("data/titanic.csv")

data <- janitor::clean_names(data)

data

write_csv(data, "data/titanic_clean.csv")