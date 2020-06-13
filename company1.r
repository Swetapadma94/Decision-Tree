library(caret)
library(C50)
com<- read.csv("E:\\Assignment\\Decession Tree\\Company_Data.csv")
View(com)
dim(com)

com$Sales<-as.factor(com$Sales)
class(com$Sales)
##traininglocal <- createDataPartition(com$Sales,p=.75,list = F)
##View(traininglocal)
traininglocal1<- createDataPartition(com$Sales,p = .65,list =F)
traininglocal1
training1 <-com[traininglocal1,]
training1
dim(training1)
testing1<- com[-traininglocal1,]
testing1
dim(testing1)
table(com$Sales)
table(training1$Sales)
table(testing1$Sales)
model1<-C5.0(training1$Sales~.,data = training1)
model1
##pred1<- predict.C5.0(model1,newdata = testing1,trials = model1$trials["Actual"],type = "class",na.action = na.pass)
##pred1

pred1<-predict.C5.0(model1,newdata = testing1[,-1])
table(pred11)
x<-table(testing1$Sales,pred1)
x
x <- table(testing1$Sales,pred1)
sum(diag(x)/sum(x))
plot(model1)
confusionMatrix(pred1,testing11$Sales)
## Bagging##
acc1<- c()
for (i in 1:100)
{
  print(i)
  intraininglocal<-createDataPartition(com$Sales,p = .65,list = F)
  training11<- com[traininglocal,]
  View(training11)
  testing11<- com[-intraininglocal1,]
  View(testing11)
 ## Model building###
  fittree<-C5.0(training11$Sales~.,data=training11)
  model11<-predict.C5.0(fittree,testing11[,-1])
  model11
  pred11<-predict.C5.0(fittree,testing11)
pred11

y<-table(testing11$Sales,pred11)
y
acc1<-c(acc1,sum(diag(y))/sum(y))
}
acc1
sum(acc1)
confusionMatrix(pred11,testing11$Sales)
