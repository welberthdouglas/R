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

