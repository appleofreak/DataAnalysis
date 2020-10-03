#Introduction to GGplot
install.packages("ggplot2")
install.packages("tidyverse")
library(dplyr)
install.packages("ggthemes")
install.packages("plyr")

library(plyr)
data(baseball)
View(baseball)

#Session 12 data
ex12 <- read_excel("/Users/toggle/Downloads/Ex_11.1.2u GRADES.xls")
View(ex12)

model1 <- lm(BASIC ~ SEX, data=ex12)
summary (model1)

model2 <- lm(BASIC ~ ELECT + GRADE, data=ex12)
summary(model2)

model3 <- lm(BASIC ~ ELECT * GRADE, data=ex12)
summary(model3)
