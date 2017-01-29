# Getting-and-cleaning-data-coursera-project

Firstly I would like to apologize in case this files are not perfectly clear becouse of my lack of command of the language. 
Unfortunately english is not my mother tongue. 

As mentioned in the project instructions:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You can find in this repo the run_analysis.R file which contains the complete R script. The following sections describes briefly the content of the script:

1- Firstly the script downloads and unzips the raw databases (txt files) and save them in the working directory

2- Secondly it creates the data tables of all the data sets included in the "UCI HAR Dataset" directory

3- Then it creates the combined data set by adding the training set to the test set. It gives the same column names as the initial data sec. It also gives names to the "activity labels" columns. 

4- Next it merges all the data sets by column binding the already created three data sets. 

5- Using the grepl function (which gives a logical vector) it selects all the column's names containing the word "mean" or "sd".
    With this logical vector it creates the data set with only the measurements on the mean and standard deviation for each measurement.
    It also names the first two columns ("Activity_Label" and "NumSubjetct") previously binded. 
    Inmediatly after this it merges by the "Activity_Label" both the activity_labels data set (that inks the class labels with their activity name) and the complete (only mean and standard deviation columns) data set.
    
6- Finally it creates a new data set by collapsing the previous set by the "NumSubject" and "Activity_Label" returning means for each of the numerical variables.

