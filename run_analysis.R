# You should create one R script called run_analysis.R that does the following.
#
# 1. Merges the training and the test sets to create one data set. 
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
library(dplyr)

# Loading xtest and naming the measurements
# Read the data on features
features <- read.table("./UCI HAR Dataset/features.txt")
# Read the test and train
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# REQUIREMENT 4: Appropriately labels the data set with descriptive variable names.
colnames(test) <- features$V2  
colnames(train) <- features$V2

# REQUIREMENT 2: Extract only the mean() and std() columns
wanted <- grep("mean()|std()", features$V2)
test <- test[, wanted]
train <- train[, wanted]

# REQUIREMENT 3: Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
act_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
act_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(act_test) <- c("activity")
colnames(act_train) <- c("activity")
act_test <- mutate(act_test, activity = factor(1*activity, labels=activity_labels$V2))
act_train <- mutate(act_train, activity = factor(1*activity, labels=activity_labels$V2))

# Add the activity column to the data
test <- cbind(act_test, test)
train <- cbind(act_train, train)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_test) <- c("subject")
colnames(subject_train) <- c("subject")
test <- cbind(subject_test, test)
train <- cbind(subject_train, train)

# REQUIREMENT 1: Combine both the train and test data sets into one data set.
combined <- rbind(test, train)


# REQUIREMENT 5: Create a new data set 'summary' which shows the average of each measurement, by subject
# and activity
# Group by subject and then activity
grouped <- group_by(combined, subject, activity)
summary <- summarize_all(grouped, mean)
write.table(summary, "tidy_dataset.txt")
