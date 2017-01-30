#DOWNLOADING THE DATA SET INTO YOUR WORKING DIRECTORY

if (!file.exists("./Dataset")) {
        dir.create("./Dataset")
}
fileUrl <-
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Dataset/Dataset.zip")
unzip(zipfile = "./Dataset/Dataset.zip", exdir = "./Dataset")


#READING AND SAVING THE DATA FILES

x_test <- read.table("./Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <-
        read.table("./Dataset/UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <-
        read.table("./Dataset/UCI HAR Dataset/train/subject_train.txt")

features <- read.table('./Dataset/UCI HAR Dataset/features.txt')
activity_labels <-
        read.table('./Dataset/UCI HAR Dataset/activity_labels.txt')


#COLUMN NAMING AND MERGING TEST AND TRAINING DATA BY "ROW-BINDING"

colnames(activity_labels) <- c("Activity_Label", "Activity")

x_tot <- rbind(x_train, x_test)
colnames(x_tot) <- features[, 2]

y_tot <- rbind(y_train, y_test)

subject_tot <- rbind(subject_train, subject_test)


#MERGING ALL DATA BY "COLUMN-BINDING"

complete_data <- cbind(y_tot, subject_tot, x_tot)


#SELECTING ONLY MEAN AND STANDARD DEVIATION COLUMNS

logical_mean_sd <-
        grepl(("mean"), names(complete_data)) |
        grepl(("std"), names(complete_data))

complete_data_mean_sd <-
        cbind(Activity_Label = complete_data[, 1],
              NumSubject = complete_data[, 2],
              complete_data[, logical_mean_sd])

Final_data_set <-
        merge(complete_data_mean_sd,
              activity_labels,
              by = 'Activity_Label')


#CREATING A SECOND DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

New_data_set <-
        aggregate(. ~ NumSubject + Activity_Label, Final_data_set, mean)
