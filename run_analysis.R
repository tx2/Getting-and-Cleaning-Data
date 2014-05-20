# Merges the training and the test sets to create one data set.
x <- rbind(read.table("UCI HAR Dataset/test/X_test.txt"), read.table("UCI HAR Dataset/train/X_train.txt"))

# Extracts only the measurements on the mean and standard deviation for each measurement. 
names <- read.table("UCI HAR Dataset/features.txt")
extracted <- x[, sort(c(grep('mean()', names[,2], fixed=T), grep('std()', names[,2], fixed=T)))]
names(extracted) <- sort(c(grep('mean()', names[,2], fixed=T, value=T), grep('std()', names[,2], fixed=T, value=T)))

# Uses descriptive activity names to name the activities in the data set
y <- rbind(read.table("UCI HAR Dataset/test/y_test.txt"), read.table("UCI HAR Dataset/train/y_train.txt"))
actnames <- read.table("UCI HAR Dataset/activity_labels.txt")
factors <- split(actnames[,1], actnames[,2])
y[,1] <- factor(y[,1])
levels(y[,1]) <- factors

# Appropriately labels the data set with descriptive activity names.
extracted <- cbind(y[,1],extracted)
names(extracted) <- c("activity", names(extracted)[2:67])

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
s <- rbind(read.table("UCI HAR Dataset/test/subject_test.txt"), read.table("UCI HAR Dataset/train/subject_train.txt"))
extracted <- cbind(s,extracted)
names(extracted) <- c("subject", names(extracted)[2:67])

library(reshape2)
melted <- melt(extracted, id=c("subject", "activity"), measure.vars=c(3:68))
dcast(melted, subject + activity ~ variable, mean)