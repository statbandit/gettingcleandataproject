# Explanation of the dataset in this project:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ<br />
tGravityAcc-XYZ<br />
tBodyAccJerk-XYZ<br />
tBodyGyro-XYZ<br />
tBodyGyroJerk-XYZ<br />
tBodyAccMag<br />
tGravityAccMag<br />
tBodyAccJerkMag<br />
tBodyGyroMag<br />
tBodyGyroJerkMag<br />
fBodyAcc-XYZ<br />
fBodyAccJerk-XYZ<br />
fBodyGyro-XYZ<br />
fBodyAccMag<br />
fBodyAccJerkMag<br />
fBodyGyroMag<br />
fBodyGyroJerkMag<br />

The set of variables that were estimated from these signals are: 

mean(): Mean value<br />
std(): Standard deviation

# The following are variables contained in the tidy datasets
Sprecial Characters removed from variable names.  It should be noted that no further cleaning of the variable names was done at this point to minimize the impact of using full length names of the variables.

"Subject" - values 1 through 30<br />
"ActivityDescription" - values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)<br />

the following are the measured numerical data

"tBodyAccmeanX"<br />
"tBodyAccmeanY"<br />
"tBodyAccmeanZ"<br />
"tBodyAccstdX"<br />
"tBodyAccstdY"<br />
"tBodyAccstdZ"<br />
"tGravityAccmeanX"<br />
"tGravityAccmeanY"<br />
"tGravityAccmeanZ"<br />
"tGravityAccstdX"<br />
"tGravityAccstdY"<br />
"tGravityAccstdZ"<br />
"tBodyAccJerkmeanX"<br />
"tBodyAccJerkmeanY"<br />
"tBodyAccJerkmeanZ"<br />
"tBodyAccJerkstdX"<br />
"tBodyAccJerkstdY"<br />
"tBodyAccJerkstdZ"<br />
"tBodyGyromeanX"<br />
"tBodyGyromeanY"<br />
"tBodyGyromeanZ"<br />
"tBodyGyrostdX"<br />
"tBodyGyrostdY"<br />
"tBodyGyrostdZ"<br />
"tBodyGyroJerkmeanX"<br />
"tBodyGyroJerkmeanY"<br />
"tBodyGyroJerkmeanZ"<br />
"tBodyGyroJerkstdX"<br />
"tBodyGyroJerkstdY"<br />
"tBodyGyroJerkstdZ"<br />
"tBodyAccMagmean"<br />
"tBodyAccMagstd"<br />
"tGravityAccMagmean"<br />
"tGravityAccMagstd"<br />
"tBodyAccJerkMagmean"<br />
"tBodyAccJerkMagstd"<br />
"tBodyGyroMagmean"<br />
"tBodyGyroMagstd"<br />
"tBodyGyroJerkMagmean"<br />
"tBodyGyroJerkMagstd"<br />
"fBodyAccmeanX"<br />
"fBodyAccmeanY"<br />
"fBodyAccmeanZ"<br />
"fBodyAccstdX"<br />
"fBodyAccstdY"<br />
"fBodyAccstdZ"<br />
"fBodyAccJerkmeanX"<br />
"fBodyAccJerkmeanY"<br />
"fBodyAccJerkmeanZ"<br />
"fBodyAccJerkstdX"<br />
"fBodyAccJerkstdY"<br />
"fBodyAccJerkstdZ"<br />
"fBodyGyromeanX"<br />
"fBodyGyromeanY"<br />
"fBodyGyromeanZ"<br />
"fBodyGyrostdX"<br />
"fBodyGyrostdY"<br />
"fBodyGyrostdZ"<br />
"fBodyAccMagmean"<br />
"fBodyAccMagstd"<br />
"fBodyBodyAccJerkMagmean"<br />
"fBodyBodyAccJerkMagstd"<br />
"fBodyBodyGyroMagmean"<br />
"fBodyBodyGyroMagstd"<br />
"fBodyBodyGyroJerkMagmean"<br />
"fBodyBodyGyroJerkMagstd"<br />
