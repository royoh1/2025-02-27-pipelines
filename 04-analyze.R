library(readr)
library(ggplot2)

model <- read_rds('output/model.RDS')

coef <- broom::tidy(model)
coef

coef <- coef %>%
    dplyr::mutate(or=exp(estimate))

ggplot(coef %>% dplyr::filter(term != "(Intercept)"), aes(x=term, y=or)) +
    geom_point() +
    coord_flip() +
    geom_hline(yintercept=1)
