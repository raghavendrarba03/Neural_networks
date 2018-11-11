str(iris)
set.seed(123); iris_mixed=iris[order(runif(150)), ]
iris_train=iris_mixed[1:120, ]
iris_test=iris_mixed[121:150, ]
library(nnet)
nn=nnet(Species~.,data=iris_train,size=2)
library(NeuralNetTools)
plotnet(nn)
nn_pre=predict(nn,iris_test[,1:4],type="class")
library("caret")
nn_pre<-as.factor(nn_pre)
confusionMatrix(nn_pre,iris_test[,5])

#Improving the model performance
set.seed(345); nn_imp=train(Species~.,data=iris_train,method="nnet"); nn_imp 
plotnet(nn_imp)
nn_imp_pre=predict(nn_imp,iris_test[,1:4],type="raw")
confusionMatrix(nn_imp_pre,iris_test[,5])
