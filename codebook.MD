---
title: "Codebook.MD"
author: "mahuzza"
date: "26 January 2016"
output: html_document
---

The R-file *run_analysis.R* takes the test and training data sets from the UCI HAR data, subsets the data to include only variables which represent the means or standard deviations of the observations and merges them into a single dataframe. This dataframe is then outputted to the csv file named *master.csv*. A sample of the csv output is below:

```{r}
 activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
1: Standing         0.2885845       -0.02029417        -0.1329051            0.9633961
2: Standing         0.2784188       -0.01641057        -0.1235202            0.9665611
3: Standing         0.2796531       -0.01946716        -0.1134617            0.9668781
   tGravityAcc-mean()-Y tGravityAcc-mean()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
1:           -0.1408397            0.1153749            0.07799634           0.005000803
2:           -0.1415513            0.1093788            0.07400671           0.005771104
3:           -0.1420098            0.1018839            0.07363596           0.003104037
   tBodyAccJerk-mean()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
1:          -0.067830808       -0.006100849        -0.03136479         0.10772540
2:           0.029376633       -0.016111620        -0.08389378         0.10058429
3:          -0.009045631       -0.031698294        -0.10233542         0.09612688
   tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyAccMag-mean()
1:             -0.0991674            -0.05551737            -0.06198580         -0.9594339
2:             -0.1105028            -0.04481873            -0.05924282         -0.9792892
3:             -0.1084857            -0.04241031            -0.05582883         -0.9837031

```

The variables present in master are listed below:

```{r}
 [1] "activity"                    "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [4] "tBodyAcc-mean()-Z"           "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [7] "tGravityAcc-mean()-Z"        "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[10] "tBodyAccJerk-mean()-Z"       "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[13] "tBodyGyro-mean()-Z"          "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[16] "tBodyGyroJerk-mean()-Z"      "tBodyAccMag-mean()"          "tGravityAccMag-mean()"      
[19] "tBodyAccJerkMag-mean()"      "tBodyGyroMag-mean()"         "tBodyGyroJerkMag-mean()"    
[22] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[25] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[28] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[31] "fBodyAccMag-mean()"          "fBodyBodyAccJerkMag-mean()"  "fBodyBodyGyroMag-mean()"    
[34] "fBodyBodyGyroJerkMag-mean()" "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"           
[37] "tBodyAcc-std()-Z"            "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"        
[40] "tGravityAcc-std()-Z"         "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"       
[43] "tBodyAccJerk-std()-Z"        "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"          
[46] "tBodyGyro-std()-Z"           "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"      
[49] "tBodyGyroJerk-std()-Z"       "tBodyAccMag-std()"           "tGravityAccMag-std()"       
[52] "tBodyAccJerkMag-std()"       "tBodyGyroMag-std()"          "tBodyGyroJerkMag-std()"     
[55] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[58] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[61] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[64] "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-std()" 
```

This data is further summarised by grouping by activity and calculating the means, each entry in this dataframe represents the average taken over each of the individual groups for each variable:

```{r}
  activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
1:           Standing         0.2791535       -0.01615189        -0.1065869            0.9414796
2:            Sitting         0.2730596       -0.01268957        -0.1055170            0.8797312
3:             Laying         0.2686486       -0.01831773        -0.1074356           -0.3750213
4:            Walking         0.2763369       -0.01790683        -0.1088817            0.9349916
5: Walking_downstairs         0.2881372       -0.01631193        -0.1057616            0.9264574
6:   Walking_upstairs         0.2622946       -0.02592329        -0.1205379            0.8750034
   tGravityAcc-mean()-Y tGravityAcc-mean()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
1:           -0.1842465          -0.01405196            0.07502792          0.0088052586
2:            0.1087135           0.15377409            0.07587885          0.0050469053
3:            0.6222704           0.55561247            0.08184739          0.0111723565
4:           -0.1967135          -0.05382512            0.07671874          0.0115061925
5:           -0.1685072          -0.04797090            0.08922669          0.0007467491
6:           -0.2813772          -0.14079567            0.07672932          0.0087588896
```

The variables in the *means.csv* file are given as follows:

```{r}
[1] "Average of activity"                    "Average of tBodyAcc-mean()-X"          
 [3] "Average of tBodyAcc-mean()-Y"           "Average of tBodyAcc-mean()-Z"          
 [5] "Average of tGravityAcc-mean()-X"        "Average of tGravityAcc-mean()-Y"       
 [7] "Average of tGravityAcc-mean()-Z"        "Average of tBodyAccJerk-mean()-X"      
 [9] "Average of tBodyAccJerk-mean()-Y"       "Average of tBodyAccJerk-mean()-Z"      
[11] "Average of tBodyGyro-mean()-X"          "Average of tBodyGyro-mean()-Y"         
[13] "Average of tBodyGyro-mean()-Z"          "Average of tBodyGyroJerk-mean()-X"     
[15] "Average of tBodyGyroJerk-mean()-Y"      "Average of tBodyGyroJerk-mean()-Z"     
[17] "Average of tBodyAccMag-mean()"          "Average of tGravityAccMag-mean()"      
[19] "Average of tBodyAccJerkMag-mean()"      "Average of tBodyGyroMag-mean()"        
[21] "Average of tBodyGyroJerkMag-mean()"     "Average of fBodyAcc-mean()-X"          
[23] "Average of fBodyAcc-mean()-Y"           "Average of fBodyAcc-mean()-Z"          
[25] "Average of fBodyAccJerk-mean()-X"       "Average of fBodyAccJerk-mean()-Y"      
[27] "Average of fBodyAccJerk-mean()-Z"       "Average of fBodyGyro-mean()-X"         
[29] "Average of fBodyGyro-mean()-Y"          "Average of fBodyGyro-mean()-Z"         
[31] "Average of fBodyAccMag-mean()"          "Average of fBodyBodyAccJerkMag-mean()" 
[33] "Average of fBodyBodyGyroMag-mean()"     "Average of fBodyBodyGyroJerkMag-mean()"
[35] "Average of tBodyAcc-std()-X"            "Average of tBodyAcc-std()-Y"           
[37] "Average of tBodyAcc-std()-Z"            "Average of tGravityAcc-std()-X"        
[39] "Average of tGravityAcc-std()-Y"         "Average of tGravityAcc-std()-Z"        
[41] "Average of tBodyAccJerk-std()-X"        "Average of tBodyAccJerk-std()-Y"       
[43] "Average of tBodyAccJerk-std()-Z"        "Average of tBodyGyro-std()-X"          
[45] "Average of tBodyGyro-std()-Y"           "Average of tBodyGyro-std()-Z"          
[47] "Average of tBodyGyroJerk-std()-X"       "Average of tBodyGyroJerk-std()-Y"      
[49] "Average of tBodyGyroJerk-std()-Z"       "Average of tBodyAccMag-std()"          
[51] "Average of tGravityAccMag-std()"        "Average of tBodyAccJerkMag-std()"      
[53] "Average of tBodyGyroMag-std()"          "Average of tBodyGyroJerkMag-std()"     
[55] "Average of fBodyAcc-std()-X"            "Average of fBodyAcc-std()-Y"           
[57] "Average of fBodyAcc-std()-Z"            "Average of fBodyAccJerk-std()-X"       
[59] "Average of fBodyAccJerk-std()-Y"        "Average of fBodyAccJerk-std()-Z"       
[61] "Average of fBodyGyro-std()-X"           "Average of fBodyGyro-std()-Y"          
[63] "Average of fBodyGyro-std()-Z"           "Average of fBodyAccMag-std()"          
[65] "Average of fBodyBodyAccJerkMag-std()"   "Average of fBodyBodyGyroMag-std()"     
[67] "Average of fBodyBodyGyroJerkMag-std()" 
```