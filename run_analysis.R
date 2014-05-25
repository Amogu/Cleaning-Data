xtest <- read.table("X_test.txt", header = FALSE)
ytest <- read.table("y_test.txt", header = F)
subjecttest <- read.table("subject_test.txt", header = F)
subjecttrain <- read.table("subject_train.txt", header = F)
xtrain <- read.table("X_train.txt", header = F)
ytrain <- read.table("y_train.txt", header = F)
train1 <- cbind(xtrain,subjecttrain)
train <- cbind(train1,ytrain)

test1 <- cbind(xtest,subjecttest)
test <- cbind(test1, ytest)
features <- read.table("features.txt", header = F, stringsAsFactors = FALSE)

features[562,] <- c(562, "subject")
features[563,] <- c(563, "activity")
data <- rbind(train, test)
names(data) <- features[,2]
colselect <- grep("std|mean|subject|activity|Mean", names(data))

data <- data[, colselect]
names(data) <- tolower(gsub("[^[:alnum:]]","", names(data)))
activity <- read.table("activity_labels.txt")

data[,88] <- activity$V2[match(data[,88], activity$V1)]

write.csv(dataSummary, file = "datacsv.csv", col.names = NA)
write.table(dataSummary, file = "datatxt.txt", col.names = NA)


