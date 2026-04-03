Group-Project
Data Cleaning and Tidy Data Preparation
This project aimed to clean and organize data from Human Activity Recognition utilizing Samsung Galaxy smartphone. Ultimate goal was to create a Tidy_dataset which then can be used for further analysis

Files 
. Script.r
. tidy_dataset.txt
. CodeBook.md
. data

Script breakdown
1. Loads Data
2. Merges Data
3. Extract Measurements
4. Replace activity codes
5. Cleanse Variable names
6. Create a Tidy Dataset
7. Save dataset

1. Why did we merge the training and test datasets? What was their original
A.  Beause the data came as training and test, merging them gives us a complete dataset, which we needed to get averages.

2. How many observations did each subject contribute to the study?
A.     table(merged_data$subject)

  1   2   3   4   5   6   7   8   9  10  11  12  13  14 
347 302 341 317 302 325 308 281 288 294 316 320 327 323 
 15  16  17  18  19  20  21  22  23  24  25  26  27  28 
328 366 368 364 360 354 408 321 372 381 409 392 376 382 
 29  30 
344 383, each of the 30 subjects contributed different number of observations.

 3. Why did we select only mean() and std() features? What do these 
   statistics tell us about the data?
A.  Because these two satistics help us summerize the data most efficently, without have to take into account unnecessry features.

4. What does it mean for data to be "tidy"? How does our final tidy_data
    dataset follow tidy data principles?
A. To be Tidy, Data should have column for each variable, row for observaation. 

5.  What is the interpretation of one row in the tidy_data dataset?
    What does a single value in one of the measurement columns represent?
A. One row is the average of each measurement variable for the subject performing the activity.    
