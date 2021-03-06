Author: Collin Mitchell
Date: January 30th, 2016
Dataset: Human Activity Recognition Using Smart Phone Dataset
Summary: Converted dataset from it's original condition to a Tidy Dataset.
Description:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

Please not that features are normalized and bounded within [-1,1]."

After running the Run_Analysis.R script, the structure of the data will change into a list with easy access to all data.
The format for access would be similar to R list subsections, as below:  
```
Results  
  $Date  
  $Data  
  $DataMean  
  $DataSD  
  $Test  
    $BodyAccX  
    $BodyAccY  
    $BodyAccZ  
    $BodyGyroX  
    $BodyGyroY  
    $BodyGyroZ  
    $TotalAccX  
    $TotalAccY  
    $TotalAccZ  
  $Train  
    $BodyAccX  
    $BodyAccY  
    $BodyAccZ  
    $BodyGyroX  
    $BodyGyroY  
    $BodyGyroZ  
    $TotalAccX  
    $TotalAccY  
    $TotalAccZ  
  $Tidy  
    $Walking  
    $walkingUpstairs  
    $walkingDownstairs  
    $sitting  
    $standing  
    $laying  
    $subject1  
    ...  
    $subject30  


Where $Date is the time the script is run,
      $Data is the combined test and train data with column names:
        subject, activity, sample1, ...., sample128.
        You may take slices of the data at any location you like.
        The format is that of a data frame.
      $Test/$Train collects and reads the data from the subfolders that were not necessary for
        the assignment, but were collected in case someone wanted to use them for something themselves.
      $Tidy is the summary information based upon project requirements.
      Please note that subject is not sorted and will not be; this should hav no impact on accessing the information.

If you wish to run functions per row, then run function compileStat passing it the data then your function.
The function is just a wrapper for sapply. Please note that the last line of the script must be commented out if you wish to use
the compileStat function as it dumps everything aside from the Results list from the environment.

File Structure:  
[D] Project  
  cookbook.MD    | This file.  
  Run_Analysis.R | Program to Run.  
  README.MD      | Explanation of Extraction Process.  
  [D] data  
    data.zip     | Downloaded Data Archive.  
    [D] UCI HAR Dataset  
      activity_labels.txt   | Original Docs.  
      features.txt          | Original Docs.  
      features_info.txt     | Original Docs.  
      README.txt            | Original Docs.  
        [D] test  
          subject_test.txt"   | Subject Number.  
          X_test.txt          | Subject Data.  
          y_test.txt          | Activity Number.  
          [D] Inertial Signals  
            body_acc_x_test.txt    | Accelerometer X Data.  
            body_acc_y_test.txt    | Accelerometer Y Data.  
            body_acc_z_test.txt    | Accelerometer Z Data.  
            body_gyro_x_test.txt   | Gyroscope     X Data.  
            body_gyro_y_test.txt   | Gyroscope     Y Data.  
            body_gyro_z_test.txt   | Gyroscope     Z Data.  
            total_acc_x_test.txt   | Total         X Data.  
            total_acc_y_test.txt   | Total         Y Data.  
            total_acc_z_test.txt   | Total         Z Data.  
        [D] train  
          subject_train.txt   | Subject Number  
          X_train.txt         | Subject Data.  
          y_train.txt         | Activity Number.  
          [D] Inertial Signals  
            body_acc_x_train.txt   | Accelerometer X Data.  
            body_acc_y_train.txt   | Accelerometer Y Data.  
            body_acc_z_train.txt   | Accelerometer Z Data.  
            body_gyro_x_train.txt  | Gyroscope     X Data.  
            body_gyro_y_train.txt  | Gyroscope     Y Data.  
            body_gyro_z_train.txt  | Gyroscope     Z Data.  
            total_acc_x_train.txt  | Total         X Data.  
            total_acc_y_train.txt  | Total         Y Data.  
            total_acc_z_train.txt  | Total         Z Data.  
```




License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1]
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
