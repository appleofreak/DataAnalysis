#harmon Foods
install.packages("readxl")
library(readxl)
harmon.data <- read_excel("/Users/toggle/Documents/INSEAD/P1/Data Analysis/SCA14.2_UDJ_Supp_Harmon_UPDATED-1.xls")
View(harmon.data)
#Dependent Variable -> Sales
#Independent Variable -> Everything else
#SeasIndex is a dummy 

model1 <- lm(Sales ~ CP, data=harmon.data) #Effect of Consumer Packs on sales
model1_summary <- summary(model1)
plot(harmon.data$CP, harmon.data$Sales)
abline(model1)

#tring to find what is not significant
model2 <- lm(Sales ~ CP + DA + SeasIndx, data=harmon.data) 
model2_summary <- summary(model2)
model2_summary #All CP, DA and SeasIndex seem relevant because of their small p values
corre1 <-cor(harmon.data$CP, harmon.data$DA)  #checking for correlation
corre2 <-cor(harmon.data$CP, harmon.data$SeasIndx)
corre3 <-cor(harmon.data$DA, harmon.data$SeasIndx)
#All three independent varibles can coexist there is no multicolinearity till now
corre1
corre2
corre3













#Notes
#lower p value shows high impact
#high R2 shows smaller difference between observed and fitted data ie R2 shows goodness of fit
#Multicolinearity -> strong relationship between two independent varibales, generally correlation absolute value greater than 0.7, remove one with highest p value

