#Group Assignment

#Exercise 1
install.packages("readxl")
library(readxl)
ex10sal91 <- read_excel("/Users/toggle/Downloads/MIM_DA_S10_ex10sal91.xlsx")
View(ex10sal91)

model1 <- lm(SAL92 ~ AGE, data= ex10sal91)
summary(model1)

model2 <- lm(SAL92 ~ EXPERI, data= ex10sal91)
summary(model2)

model3 <- lm(SAL92 ~ SEX, data= ex10sal91)
summary(model3)

model4 <- lm(EXPERI ~ AGE, data= ex10sal91)
summary(model4)

model5 <- lm(SAL92 ~ AGE + EXPERI+ SEX, data=ex10sal91)
summary(model5)

#group exercise for motor trends
data(mtcars)
#head(mtcars)
#View(mtcars)
modelcar <- lm(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data=mtcars)
#sumcars <- summary(mtcars)
#View(sumcars)
summary(modelcar)
alldata <- plot(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb, data=mtcars)
abline(alldata)


#Lecture
plot (mpg ~ hp, data=mtcars, col=am+9 , pch=19, cex= 2)
legend("topright", c("Automatic", "Manual"), col=c(1,2), pch = c(19,19))

simple_model <- lm(mpg ~ hp, data=mtcars)
plot (mpg ~ hp, data=mtcars, col=am+9 , pch=19, cex= 2)
abline(simple_model)

#Seperate lines for manual and automatic
#Categorical transmission varibale
better_model <- lm(mpg ~ hp + am , data=mtcars)
intercept_auto = coef(better_model)[1]
intercept_manual = coef(better_model)[1] + coef(better_model)[3]
slope= coef(better_model)[2]

plot(mpg ~ hp, data=mtcars, col=am+9 , pch=19, cex= 2)
legend("topright", c("Automatic", "Manual"), col=c(1,2), pch = c(19,19))
abline(intercept_auto, col= "blue", lty=1, lwd=2)
abline(intercept_manual, col= "green", lty=1, lwd=2)

plot(mpg ~ hp + am , data=mtcars, col=am+9 , pch=19, cex= 2)
legend("topright", c("Automatic", "Manual"), col=c(1,2), pch = c(19,19))
abline(better_model)

#Categorical Variables with more than two categories
?levels
new_data2 <- mtcars
is.factor(new_data2$cyl)
#False so its not a factor, so lets make it a factor variable
new_data2$cyl <- as.factor(new_data2$cyl) 
is.factor(new_data2$cyl)
#Now true
levels(new_data2$cyl)

modelcar <- lm(mpg ~ hp + cyl, data = mtcars)
plot(mpg ~ hp + cyl, data = modelcar)

intercept_4cyl <- coef(model_cylinder)[1]
intercept_6cyl <- coef(model_cylinder)[1] + coef(model_cylinder)[3]