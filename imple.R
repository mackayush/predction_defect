
#@author~Ayush Pandey
#Date:16/02/2015
#licence~ Need Permission to use this work
#setting a working directory change it with acc.
3setwd("E:/st ml/dataset")
3getwd()
# dataframe to read pc1 and kc1 csv files
pc1 <- read.csv("E:/st ml/dataset/pc1.csv")
kc1 <- read.csv("E:/st ml/dataset/kc1.csv")
# partioning a kc1 file into two data file 
# trainig will contain 75% data
# testing have 25% data
smp_size <- floor(0.75 * nrow(kc1))
set.seed(123)
train_ind <- sample(seq_len(nrow(kc1)), size = smp_size)
 
train <- kc1[train_ind, ]
test <- kc1[-train_ind, ]
view(test)
#introducing test id in order to match outputs
# id is unique identifier for the rows
test$ID<-seq.int(nrow(test))
testvalidater<-data.frame(Id=test$ID,defects=test$defects)
 View(testvalidater)
# saving testvalidator data into files
write.csv(testvalidater, file = "testcompri.csv", row.names = FALSE)
#writng test file in csv file
#after removing defects col
test<-test[,!(colnames(test) %in% c("defects"))]
write.csv(test, file = "test.csv", row.names = FALSE)
test<-read.csv("test.csv",stringsAsFactors=FALSE)
#playing with test data
#84% of classes are not deefecting ,rest have defects
prop.table(table(train$defects))
#now importing rf library
library(randomForest)
set.seed(415)
fit <- randomForest(as.factor(defects) ~ 
                      loc + v.g. + ev.g. + iv.g. + n + v + l + d + i + e + b+ 
                      t + lOCode + lOComment + lOBlank + locCodeAndComment + 
                      uniq_Op + uniq_Opnd + total_Op + total_Opnd + 
                      branchCount , data=train, importance=TRUE, ntree=2000)
#predicitng data in test set into particular class

Prediction <- predict(fit, test)
# making submit data frame
submit <- data.frame(Id = test$ID, defects = Prediction)
write.csv(submit, file = "testpredicted.csv", row.names = FALSE)

#saved the result set into file
