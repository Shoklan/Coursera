# Data Science - Getting and Cleaning Data Final Project
**Author: Collin Mitchell**
   *Date: January 31st 2016*

This is the result of the final project.
All collected data is saved into a list called Results that allows one easy access to all data from the original dataset.
There are two lines at the end of the code that can be used to assist one on a lower resource machine:  
  1. Will dump everything from memory aside from the Results| rm(list = (ls()[ -(grep("Results", ls())) ]))  
  2. save(Results, file = "Results.RData") | Save the results to an external data file for later usage.  

I admit that I did a mix of functional and Imperative Coding practices here, but what works will work for now.
There is also a mixture of global scoping and local scoping and appropriately passing variables, as should be done correctly.

The code only requires the Dplyr library to run a filter command later to select out information based on subject and activity information.
This could have also been done with data.table, but I'm more familiar with Dplyr for the moment.

The general overview of the code is quite simple.  
If there is not a local folder 'data', then create one.  
Install the data from the external URL.  
Grab the complete list of all files underneath of the currect working directory; we're going to be using all of them for my code.  
f(mergeData) takes the datafile, the activity file, and the subject file. It then parse all thoe files and returns a data frame for the test or train data set.  
I then go column by column for and append the sets together. This process destroys the column labels so I have to recreat them.  
Store the final data combined together.  
I then compile the Mean and Standard deviation and store them in the Resulsts list so I can access them. This is done using the compileStat function which is just a wrapper around an saaply that can run any function you want.  

Then, since I like to go above and beyond, I collect the index of the files inside of the Inertia Signals folders and create a dataframe with two columns: one for test data and another for train data.  
Since the names are sorted alphabetially and the same files will be picked from each set and placed in separate columns, I can run both teset and train in parallel - which is what compileExtraData does - returning a temporary list with each one separate.  
Each dataset is then collected in Results again.  

Lastly, the tony data set asked for is compiled outside of its own functions and run at the end of the file; this isn't great practice, but I was awake long enough and it was extra so I broke standards to get the task done.

The Data mean:               0.5141718  
The Data Standard deviation: 0.2200285  
