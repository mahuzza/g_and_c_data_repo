---
title: "Readme.MD"
author: "mahuzza"
date: "26 January 2016"
output: html_document
---

The following files are contained in the **assignment_4_repo**:

  - **run_analysis.R** contains the code used to manipulate the data, this code generates both the **master.csv** and **means.csv** files as output.
  
  the steps of the code are outlined as follows:
  
   - #load in test data
   - #column bind the y & x files
   - #rowbind these two sets into a single frame
   - #get variable names
   - #create variable names
   - #replace activity names
   - #isolate mean & std deviation columns, bind then add activty column back in
   - #transform master1 into a data table, output to csv
   - #create data frame of mean values by activity, output to csv

 - **master.csv** contains the summarised dataset of the UCI HAR data, and contains only variables from the orginal dataset which represent the means or standard deviations of the measured observations
 
 - **means.csv** contains the average of each of the variables in **master.csv** grouped by activity 
 
 - codebook.MD contains a description of each of the variables in both **master.csv** and **means.csv**
 