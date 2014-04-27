The gettingcleandataproject repository contains the files required to complete the project for the Getting and Cleaning Data Course taught by Prof. Jeff Leek from the Johns Hopkins Bloomberg School of Public Health on the Coursea.org website.

### The repo contains the following:
* run_analysis.R - which is the R code to generate the analysis and output the tidy datasets
* cookbook.md - which defines the variables used in the study
* tidy_data - the tidy dataset for just the mean and std variables
* tidy_data2 - the tidy dataset for the averages of each variable based upon subject and activity description

### The assigment was based upon data generated from the Human Activity Recognition Using Smartphones study provided by the University of California - Irvine Machine Learning Repository. 

### The assignment consisted of:
* Downloading and unzipping the file located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* creating a test dataset and train dataset from the unzipped files

* merging the test and train datasets into one complete dataset.

* extracting only the variables containing mean() and std()

* updating the extracted dataset to contain activity descriptions instead of activity numbers

* output to csv file the generated tidy datasets

* Utilize Github to publish the project

### The R code is fully documented, but here are some highlights contained in the code:
* utilized read.table() to import the data files.  Since these were not CSV files, it required the use of sep="" and not sep=" " to properly read in the data.
* once the data was read in it was checked for NA's and validated against UCI website for correct number of observations.
* the imported datasets then required updating their column names from the generic V to appropriate values
* the imported datasets were then combined, merged, and ordered into one complete dataset
* the columns containing the variables mean() and std() were extracted using the grep command
* removed all special characters from the column names
* the appropriate mean and std columns were merged into one dataset
* convert the activity numbers (1-6) into activity descriptions (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying) and update the column name
* generate another tidy dataset that contained the values of averages for each variable by subject and activity description. This was done by using the melt() and dcast() functions in R.
* the write.table() was used to export the tidy datasets in CSV format with the .txt extension in order to properly upload to the coursera.org website.
