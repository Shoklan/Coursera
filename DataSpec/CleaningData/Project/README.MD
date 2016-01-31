# Data Science - Getting and Cleaning Data Final Project
**Author: Collin Mitchell**
   *Date: January 31st 2016*

This is the result of the final project.
All collected data is saved into a list called Results that allows one easy access to all data from the original dataset.
There are two lines at the end of the code that can be used to assist one on a lower resource machine:
1. Will dump everything from memory aside from the Results| rm(list = (ls()[ -(grep("Results", ls())) ]))
2. save(Results, file = "Results.RData") | Save the results to an external data file for later usage.

