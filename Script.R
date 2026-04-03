features <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/features.txt")
activity_labels <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/activity_labels.txt")

x_test <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/bicki/OneDrive/Desktop/M.S. CYBER/SPRING 26/DAT 511/Group/UCI HAR Dataset/train/subject_train.txt")

#Merge

colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)

merged_data <- rbind(train_data, test_data)

# Extract Measurements
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", features$V2)
clean_data <- merged_data[, c(1, 2, mean_std_columns + 2)]

# Descriptive activity names
colnames(activity_labels) <- c("activity", "activity_name")
clean_data <- merge(clean_data, activity_labels,
                    by = "activity",
                    all.x = TRUE)

clean_data$activity <- clean_data$activity_name
clean_data$activity_name <- NULL

# Descriptive Variable Names

names(clean_data) <- gsub("^t", "Time_", names(clean_data))
names(clean_data) <- gsub("^f", "Frequency_", names(clean_data))
names(clean_data) <- gsub("Acc", "Accelerometer_", names(clean_data))
names(clean_data) <- gsub("Gyro", "Gyroscope_", names(clean_data))
names(clean_data) <- gsub("Mag", "Magnitude_", names(clean_data))
names(clean_data) <- gsub("-mean\\(\\)", "_Mean", names(clean_data))
names(clean_data) <- gsub("-std\\(\\)", "_STD", names(clean_data))
names(clean_data) <- gsub("-", "_", names(clean_data))

# Create Tidy Data

tidy_dataset <- clean_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)



