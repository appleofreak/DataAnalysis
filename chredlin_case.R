#Redlining case
install.packages("readxl")
library(readxl)
install.packages("faraway", dependencies = TRUE)
library(faraway)
data(chredlin) #Data from 1970's study between insurance and redlining in Chicago
View(chredlin)

#Redlining is when they refuse to sell houses to certain people
#We do not know the race of those denied insurance, we only know their racial composition in a zip code
#Hence we cannot simply expect any correlation (if found) to extend to an individual level from the group relations

#Initializing
data(chredlin)
summary(chredlin)
#Inferences from summary below
#1. Wide range in race variable between minimum and maximum value
#2. Assuming all zip codes are not homogenous ie it is not impossible to derive meaning from this data
#3. Skewness in theft and income
#4. Weird behavior of involact, high number of zeroes, hard to draw any standalone inference

#Relevance of North and South
par(mfrow=c(2,3))
for (i in 1:6) stripchart (chredlin [,i], main=names(chredlin)[i], method="jitter") #jitter hides overplotting

#Deep Dive 1: Involact and Race
model1 <- lm(involact~race, data = chredlin)
#summary(model1)

#Involact represents the new FAIR plan policies and renewals per 100 housing units
#Model1 demonstartes how homeowners in Zip codes with high percentage of minorities are taking the default FAIR plam insurance at a higher rate compared to the others.

#We also have fire and theft as factors that could be denying insurnace so it is too soon to jump to any conclusion just yet
#Deep Dive 2: Accouing for the effect of fire and theft
plot(chredlin$race, chredlin$involact) 
abline(lm(involact~race, chredlin))

plot(chredlin$race, chredlin$fire) 
abline(lm(fire~race, chredlin))

plot(chredlin$race, chredlin$theft) 
abline(lm(theft~race, chredlin))

#Full Model to decide on what actually matters
model3 <- lm(involact ~ race + fire + theft + age + income, chredlin)
summary (model3)
#A common practice is to use log(income) instead of income, that helps solve the skewness 
#1. Income is also a measure where elasticity depends hence taking log helps deal with the elasticity
#2. Income is more multipliable than addable
#Accouting for that
model3 <- lm(involact ~ race + fire + theft + age + log(income), chredlin)
summary (model3)

#Income is an interesting case here because not everybody in our group here has an equally distributed income but to talk about race and consider the story to check if redlining is actually happening lets focus on the rest of the residual plot for now
plot(fitted(model3), residuals(model3))
qqnorm(residuals(model3))
qqline(residuals(model3))
#Nothing that stands out as a outlier yet, moving on

chredlin [c(6,24),] #High theft and high fire zip codes

model4 <- lm(involact ~ race+fire+theft+age+income, chredlin, subset = -c(6,24)) #Excluding the high fire and theft points 
summary(model4)
#I had my doubts on income but here fire, theft (and somehow even age) seem to have become insignificant

#Lets stick with model4 for now, but remove income
model5 <- lm(involact ~ race+fire+theft+age, chredlin, subset = -c(6,24)) 
summary(model5) #here, fire seems significant and has a really low p (or high t whatever)

model6 <- lm(involact ~ race+fire+ income, chredlin, subset = -c(6,24))
summary(model6) #With income accounted, race p value is 0.0667

model7 <- lm(involact ~ race+fire, chredlin, subset = -c(6,24))
summary(model7) #Without income accounted, race p value is 0.0036 
#Is race more significant when we ignore income?

#finally
model8 <- lm(involact ~ race+fire+theft+age, chredlin)
summary(model8)

#How is the issue divided between north and south
model.north <- lm(involact ~ race+fire+theft+age, subset = (side=="n"), chredlin)
summary (model.north)
model.south <- lm(involact ~ race+fire+theft+age, subset = (side=="s"), chredlin)
summary (model.south)
#Effect of race shows more in North than it does in South



#Short conclusion: whereas there is some relationship between the fire scare and involact, there still seems to be a strong evidence of race for redlining

#Some other questions
#1. Number of people affected is small to be generalized
#2. Missing variable, say people having performed poorly during their insurnace interviews etc
#3. We saw the division between north and south, what if it is further divided into even smaller segments and we see this is prevalent in a very small part in the north and not widespread at all?

#Hence despite having a very solid relation here, we still cannot be sure enough to simply link race to redlining because the above questions remain unaswered based on the data we have.
