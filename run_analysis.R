# Getting and Cleaning Data Coursera Data Project
# Combine Test and Training datasets into one tidy dataset

# The datasets are one zip file located here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Download the zip file and unzip

# Data information is located here:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# With background on wearable computing located here:
# http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/


# You should create one R script called run_analysis.R that does the following. 
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

######################################################################################################################
#
# Step 1. Merge the Test and Train Data into one dataset
#
# Set the working directory
setwd("C:/Users/Crusher/Documents/Coursera/Getting Cleaning Data/Assignment/UCI HAR Dataset")
getwd()

# Read all the data files required to build the complete dataset
# First - read in the data definition tables
features<-read.table("features.txt",sep="")
activity_labels<-read.table("activity_labels.txt",sep="")


# Second - read in the test data, validate, and column names
subject_test<-read.table("test/subject_test.txt",sep="")
x_test<-read.table("test/X_test.txt",sep="") 
y_test<-read.table("test/y_test.txt",sep="")

# The following shows there are 9 test subjects and their frequencies and no NA's
as.data.frame(table(subject_test,useNA = "ifany"))
# Then change the column name
names(subject_test)<-"Subject"

# The following shows the frequencies of the six different activities for the test subjects and no NA's
table(y_test)
# Then change the column name
names(y_test)<-"Activity"

# The following shows the values are all numerical and there are no NA's for any of the variables
summary(x_test)
# Use the features table column 2 to relabel x_test columns with the appropriate variable names
names(x_test)<-features$V2
names(x_test)


# Third - read in the train data
subject_train<-read.table("train/subject_train.txt",sep="")
x_train<-read.table("train/X_train.txt",sep="")
y_train<-read.table("train/y_train.txt",sep="")

# The following shows there are 21 training subjects and their frequencies and no NA's
as.data.frame(table(subject_train,useNA = "ifany"))
# Then change the column name
names(subject_train)<-"Subject"


# The following shows the frequencies of the six different activities for the train subjects and no NA's
table(y_train)
# Then change the column name
names(y_train)<-"Activity"

# The following shows the values are all numerical and there are no NA's for any of the variables
summary(x_train)
# Use the features table column 2 to relabel x_train columns
names(x_train)<-features$V2
names(x_train)


# Now combine the imported datasets and merge into one dataset

# Combine test data columns into a test dataset
test_data<-cbind(subject_test,y_test,x_test)

# Combine train data columns into a train dataset
train_data<-cbind(subject_train,y_train,x_train)

# Combine test and train data into one dataset
# rbind stacks one on top of the other
merged_data<-rbind(test_data,train_data)

# The merged dataset dimensions of 10299 obs. and 563 variables can be validated UIC website
# Put the finish touches on the complete dataset by order tehe data by subject # and activity # with plyr
ordered_data<-arrange(merged_data,Subject,Activity)

######################################################################################################################
#
# Step 2. Extract only the measurements on the mean and standard deviation for each observation.
#
# These variables are contain mean() and std() within thier variable name
#
# Use grep command to match variable names from the features data set
mean_variables<-features[grepl("mean()",features$V2,fixed=TRUE),]
std_variables<-features[grep("std()",features$V2,fixed=TRUE),]

# Combine the mean and std variable names and use the arrrange to preserve the order of the original dataset
mean_std_variables<-arrange(rbind(mean_variables,std_variables),V1)

# In order to proced, it is now time to remove the special characters from both the dataset and variables list
# Special characters have a way of putting a wrench in the works escpecially when it comes to modifying dataframes
mean_std_variables$V2<-str_replace_all(mean_std_variables$V2,"[[:punct:]]", "")
names(ordered_data)<-str_replace_all(names(ordered_data),"[[:punct:]]", "")

# Write the variable names for use in generating a codebook later
write.table(mean_std_variables$V2,file="variables.txt",sep="",row.names=FALSE)

# Cut / reduce the ordered dataset to just the data containing the mean() and std() variables
# Utilizing the ordered variable list mean_std_variables
merged_mean_std<-ordered_data[c("Subject","Activity",mean_std_variables$V2)]



######################################################################################################################
#
# Steps 3 & 4. 
#  Uses descriptive activity names to name the activities in the data set
#  Appropriately labels the data set with descriptive activity names. 
#

#  Replace numerical values of Activity with Activity Description with 
merged_mean_std$Activity<-factor(merged_mean_std$Activity, levels=activity_labels$V1, labels=activity_labels$V2 )
names(merged_mean_std)[2]<-"ActivityDescription"

# Create the tidy dataset in csv format for means and std variables
# Eventhough creating a csv file, need to name it .txt in order to upload it to Coursera
write.table(merged_mean_std,file="tidy_data.txt",sep=",",row.names=FALSE)


######################################################################################################################
#
# Step 5. Creates a second, independent tidy data set with the average of each variable for each activity 
#         and each subject.  
#  

# Use the Melt function from reshape2 package to reshape the dataset by Subject and Activity Description
melt_data<-melt(merged_mean_std,id=c("Subject","ActivityDescription"))
# Now use the dcast function to calculate the average of the variable by Subject and Activity Description
average_data<-dcast(melt_data,Subject+ActivityDescription ~ variable, mean)

# Create a second tidy dataset for the average value of the variables by Subject and Activity Description
# Eventhough creating a csv file, need to name it .txt in order to upload it to Coursera
write.table(average_data,file="tidy_data2.txt",sep=",",row.names=FALSE)
