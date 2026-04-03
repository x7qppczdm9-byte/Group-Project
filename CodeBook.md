---
title: "CodeBook"
author: "Bikramjit Singh"
date: "2026-04-03"
---




# CodeBook

This Codebook describes the variables, the data and any tranformations or cleaning steps performed.

## Dataset 

The dataset comes from wearable computing from the Human Activity Recognition Using Smartphones dataset. It primaarily uses measurements from the accelerometer on the Samsung Galaxy S smartphones. 

The goal is to taken in the available data, then clean and compile it to create a Tidy Dataset, which can be used for further analysis. 

## Variables

Subject: includes integers which identified the person performing the acitvity

Acitivity: includes name of activity performed. 

All other variables are numeric and are either the Mean or the Standard deviation of the signal.

## Cleaning Steps

1. Load Data
2. Merged Data
3. Extracted Measurements for mean and standard of deviation
4. Replace activity codes
5. Cleanse Variable names made them easier ti read
6. Created a Tidy Dataset with average if each variable for each subject and activity
7. Saved dataset as tidy_dataset.txt

