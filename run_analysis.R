#load in test data

x_test <- read.csv("X_test.txt", sep = "", header = FALSE)
y_test <- read.csv("y_test.txt", sep = "", header = FALSE)
y_train <- read.csv("y_train.txt", sep = "", header = FALSE)
x_train <- read.csv("X_train.txt", sep = "", header = FALSE)

#column bind the y & x files
train <- cbind(y_train, x_train)
test <- cbind(y_test,x_test)

#rowbind these two sets into a single frame
master <- rbind(train,test)

#get variable names
features <- read.csv("features.txt", sep = "", header = FALSE)

#create variable names
names(master) <- c("activity",t(features[2]))

#replace activity names

library(plyr)
dummy <- as.character(master$activity)
master$activity <- revalue(dummy,c("1" = "Walking", "2"="Walking_upstairs", "3"="Walking_downstairs", "4"="Sitting", "5"="Standing","6"="Laying"))
activity <- master$activity

#isolate mean & std deviation columns, bind then add activty column back in
mean <- master[,grep("mean\\(\\)",colnames(master))]
std<-master[,grep("std\\(\\)",colnames(master))]
master1 <- cbind(activity,mean,std)

#transform master1 into a data table, output to csv:
libary(data.table)
master1<-data.table(master1)
write.csv(master1, file="master.csv")

#create data frame of mean values by activity, output to csv:
means <- master1[, lapply(.SD, mean), by = activity]
write.csv(means, file="means.csv")
