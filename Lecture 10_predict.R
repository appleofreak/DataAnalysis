#Exercise from Lecture 10
#Predicting fuel efficiency
data(mtcars)
head(mtcars)
plot(mpg~wt, data=mtcars)
plot(mpg~cyl, data=mtcars)
plot(mpg~wt, data=mtcars, col=cyl+2) #Using some other colour

#Simple linear model
model1 <- lm(mpg~wt, data=mtcars)
summary(model1)
plot(mpg~wt, col= cyl+2, data=mtcars)
abline(model1)

#multiple Regression model
model2 <- lm(mpg~wt + hp + am, data=mtcars)
summary(model2)

model3 <- lm(mpg~wt + hp, data=mtcars)
summary(model3)
