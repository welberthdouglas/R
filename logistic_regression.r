#------------------------------------------------------------------#
#                        Logistic Regression                       #
#__________________________________________________________________#

require(ISLR)    # library used for the examples
names(Smarket)   # shows the data names in the Smarket dataset
?Smarket

pairs(Smarket,col=Smarket$Direction)   # plot all the variables against all the variables, color coded by the response (Direction)

# Performing the logistic Regression with the function glm

glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial)   # family=binomial sets the method of the lm to logistic regression

glm.probs=predict(glm.fit,type="response")  #Predicts the response  
glm.probs[1:5]                              #shows the first 5 preditions for the data used to fit the model
                                            #logistic regression returns probabilities, in that case all are close to 0.5%
                                            #which is reasonable since de data consists of stock market data

# setting a threshold for the classificator using the ifelse command

glm.pred=ifelse(glm.probs>0.5,"UP","DOWN")
attach(Smarket)   #attaching the dataframe to make variables available by name

# CREATING A CONFUSION MATRIX

table(glm.pred,Direction)  

mean(glm.pred==Direction)                  # Calculates the total error rate of the model ( times when glm.pred is equal to Direction/ total # of observations)


# Dividing the data into training and test sets

trainv=Year<2005                           # makes a subset of the dataframe containing only data prior to 2005

# Fitting the data using only the training set

glm.fit=glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial,subser=trainv)
#      !!!!!     See if works with update
#glm2.fit=update(glm.fit,data=Smarket,subset=trainv)

# predicting for the test set

glm.probs=predict(glm.fit,newdata=Smarket[!trainv],type="response")
glm.pred=ifelse(glm.probs>0.5,"UP","DOWN")
Direction.2005=Smarket$Direction[!trainv]   # creating a subset of data for the test data

table(glm.pred,Direction.2005)  
mean(glm.pred==Direction.2005) 


