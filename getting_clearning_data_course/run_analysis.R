library(dplyr)

train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE,  sep = "")
train_set_lables <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE,  sep = "",
                        colClasses = c("numeric"))
train_set_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE,  sep = "",
                               colClasses = c("numeric"))


test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE,  sep = "")
test_set_lables <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE,  sep = "",
                              colClasses = c("numeric"))
test_set_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE,  sep = "",
                                 colClasses = c("numeric"))

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE,  sep = "",
                       colClasses = c("numeric", "character"))

data_set <- rbind(train_set, test_set)
names(data_set) <- make.names(features[, 2], unique = TRUE)
extract_data <- select(data_set, contains("mean"), contains("std"))
extract_data$activity <- c(train_set_lables[, 1], test_set_lables[, 1])
extract_data$subject <- c(train_set_subjects[, 1], test_set_subjects[, 1])
tidy_data <- extract_data %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(tidy_data, 'tidy_data.txt', row.names = FALSE)
