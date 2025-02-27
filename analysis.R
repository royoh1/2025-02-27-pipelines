library(tidyverse)
library(janitor)
library(broom)


data <- read_csv("data/titanic.csv")

data <- janitor::clean_names(data)

ggplot(data=data, aes(x=pclass)) +
    geom_bar()

ggplot(data, aes(x=survived)) +
    geom_bar()
    
model <- glm(survived ~ as.factor(pclass) + sex + age + fare, data=data, family=poisson)

summary(model)

coef <- broom::tidy(model)

coef <- coef %>%
    dplyr::mutate(or=exp(estimate))

ggplot(coef %>% dplyr::filter(term != "(Intercept)"), aes(x=term, y=or)) +
    geom_point() +
    coord_flip() +
    geom_hline(yintercept=1)