############################################################################################################################
Author: Pratima Kshetry
This file contains R code that helps to predict Boston housing prices as well as creates vizualizations...
The dataset is available at: https://archive.ics.uci.edu/ml/datasets/Housing
######################################################################################################

setwd("E:\\Assignments\\DiggingIntoData\\HW2-Prediction&Classification\\Dataset")

train_data<-read.csv("E:\\Assignments\\DiggingIntoData\\HW2-Prediction&Classification\\Dataset\\house_train.csv",
               strip.white=TRUE,
               stringsAsFactors=FALSE,
               na.strings=c("NA",""))

########################Question 2##################################
#Predict 2013 home prices from state information only

attach(train_data)
lm.out<-lm(price2013 ~ state)  ###Regression Model
summary(lm.out)

coef<-coefficients(lm.out) ##Display the coefficients of MODEL
write.csv(coef,train_data="CountyStateRegression.csv") ##Write the output to a csv train_data
par(mfrow=c(2,2))
###Diagonostic plots of the model
plot(lm.out)
par(mfrow=c(1,1))
#####Average price of Home in Dc
newdata<-data.frame(state="DC")
predDC<-predict(lm.out,newdata)
predDC

#####Average price of Home in wv
data1<-data.frame(state="WV")
predWV<-predict(lm.out,data1)
predWV

###############################End of Part 2######################################

#####################################Question 3 Begins##############################
######Predict 2013 home prices from state and county information
attach(train_data)
lm1.out<-lm(price2013~state+county)   ##Regression Model
summary(lm1.out)
par(mfrow=c(2,2))
###Diagonostic plots of the model
plot(lm1.out)
par(mfrow=c(1,1))

####Which counties have highest and lowest Regression Coefficient################
##Display coefficients of lm1
coef1<-coefficients(lm1.out)
write.csv(coef1,train_data="CountyStateRegression.csv")
  ###Use the csv table to identify counties with highest and lowest coefficients.





