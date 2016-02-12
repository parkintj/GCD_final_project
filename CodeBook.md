---
title: "Getting and Cleaning Data Final Assignment"
---

The work described below is based on a raw data set available from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiment from which this data was collected is described in the file "original_experiment.txt", and the descriptions of the various features measured are described in detail in "features_info.txt".  Here we describe the changes to the original variables and any new variables relevant to the data set in the file "gcd_assignment_tidy_data.txt"

After reading in the list of features, the names were modified from the format:

"tBodyAcc-mean()-X"

to a more simplified format:

"tBodyAcc_mean_X"

where the parentheses have been removed and the dashes replaced by underscores.  These feature names were then assigned as headers to the corresponding measurement columns in both the training and testing sets.

Next, the subject identification numbers (1:30) and activities (listed as numbers 1:6) were added to these data sets as new columns.

Then the training and test data sets were merged.

From this original data set we extracted only those variables that calculated a mean or a standard deviation.  These variables are as follows:
                    
* "tBodyAcc_mean_X"               "tBodyAcc_mean_Y"              
* "tBodyAcc_mean_Z"               "tBodyAcc_std_X"               
* "tBodyAcc_std_Y"                "tBodyAcc_std_Z"               
* "tGravityAcc_mean_X"            "tGravityAcc_mean_Y"           
* "tGravityAcc_mean_Z"            "tGravityAcc_std_X"            
* "tGravityAcc_std_Y"             "tGravityAcc_std_Z"            
* "tBodyAccJerk_mean_X"           "tBodyAccJerk_mean_Y"          
* "tBodyAccJerk_mean_Z"           "tBodyAccJerk_std_X"           
* "tBodyAccJerk_std_Y"            "tBodyAccJerk_std_Z"           
* "tBodyGyro_mean_X"              "tBodyGyro_mean_Y"             
* "tBodyGyro_mean_Z"              "tBodyGyro_std_X"              
* "tBodyGyro_std_Y"               "tBodyGyro_std_Z"              
* "tBodyGyroJerk_mean_X"          "tBodyGyroJerk_mean_Y"         
* "tBodyGyroJerk_mean_Z"          "tBodyGyroJerk_std_X"          
* "tBodyGyroJerk_std_Y"           "tBodyGyroJerk_std_Z"          
* "tBodyAccMag_mean"              "tBodyAccMag_std"              
* "tGravityAccMag_mean"           "tGravityAccMag_std"           
* "tBodyAccJerkMag_mean"          "tBodyAccJerkMag_std"          
* "tBodyGyroMag_mean"             "tBodyGyroMag_std"             
* "tBodyGyroJerkMag_mean"         "tBodyGyroJerkMag_std"         
* "fBodyAcc_mean_X"               "fBodyAcc_mean_Y"              
* "fBodyAcc_mean_Z"               "fBodyAcc_std_X"               
* "fBodyAcc_std_Y"                "fBodyAcc_std_Z"               
* "fBodyAcc_meanFreq_X"           "fBodyAcc_meanFreq_Y"          
* "fBodyAcc_meanFreq_Z"           "fBodyAccJerk_mean_X"          
* "fBodyAccJerk_mean_Y"           "fBodyAccJerk_mean_Z"          
* "fBodyAccJerk_std_X"            "fBodyAccJerk_std_Y"           
* "fBodyAccJerk_std_Z"            "fBodyAccJerk_meanFreq_X"      
* "fBodyAccJerk_meanFreq_Y"       "fBodyAccJerk_meanFreq_Z"      
* "fBodyGyro_mean_X"              "fBodyGyro_mean_Y"             
* "fBodyGyro_mean_Z"              "fBodyGyro_std_X"              
* "fBodyGyro_std_Y"               "fBodyGyro_std_Z"              
* "fBodyGyro_meanFreq_X"          "fBodyGyro_meanFreq_Y"         
* "fBodyGyro_meanFreq_Z"          "fBodyAccMag_mean"             
* "fBodyAccMag_std"               "fBodyAccMag_meanFreq"         
* "fBodyBodyAccJerkMag_mean"      "fBodyBodyAccJerkMag_std"      
* "fBodyBodyAccJerkMag_meanFreq"  "fBodyBodyGyroMag_mean"        
* "fBodyBodyGyroMag_std"          "fBodyBodyGyroMag_meanFreq"    
* "fBodyBodyGyroJerkMag_mean"     "fBodyBodyGyroJerkMag_std"     
* "fBodyBodyGyroJerkMag_meanFreq"

The variables with the prefix "t" represent measurements of time, in units of seconds (s).  The variables with the prefix "f" sample frequency, in units of Hz.

In addition, we have the following variables:
* "activity_name": the activities listed by their names (as opposed to the corresponding code number)
* "ID": test subjects as identified by number

From this subset of the original merged data set we summarised the data by calculating the average value of each of the selected variables, for each activity and test subject.  This summarised tidy data set can be found in the file: "gcd_assignment_tidy_data.txt".  The averaged variables have the same names as above but have the prefix "avg_", such as:

"avg_tBodyAcc_mean_X".

The variables "ID" and "activity_name" are the same.

In addition, the units of the averaged values are either seconds (s) or frequency (Hz), as described above.



