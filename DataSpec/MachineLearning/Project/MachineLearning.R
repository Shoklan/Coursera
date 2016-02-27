##############################
# Author: Collin Mitchell
#   Date: February 25th, 2016
#   File: MachineLearning.R
##############################
# NOTES:
#
# Submit Criteria:
# Less than 2000 words / less than 5 figures
#
# Get data
# Examine Column types
# - classe is the results
# - username is the person performing
# 
# simple OneR to find strongest predictor [OnePredict]
#X:
#  < 5594.0	-> A
# < 9372.0	-> B
# < 12825.0	-> C
# < 16035.5	-> D
# >= 16035.5	-> E
# (406/406 instances correct)
# The strongest predictor is how the exercise was performed
#
# The Caret package does not seem to have a way to predict using OneR so I'll run a quick predict on the
# Testing set.
#
# Great resource:
# http://topepo.github.io/caret/training.html 
#
# rpart fails: maybe lots of NA's are causing this?
# running a random forest instead.
#
#


library(data.table)
library(caret)
library(RWeka)
library(rpart)
library(randomForest)

results = list(Date = Sys.time())

trainDataUrL = "https://eventing.coursera.org/api/redirectStrict/CwuaazM9omqkquUb0kdE2WvGIqJWicejJ8kjpkB78yXFFlkDBFgr3Zgk1SFCMk4jGOPWMIvJ4uOqfAnf8exPpA.dVzkb1v7Is_JCDbfEkqecA.lD2kq0SU6lv2BDl7rsQIzR57PZ87TCjxLvpNgPQQf8L-fxIjZ_TjZDeWqJ3A8eKHvrpshTdzRoeZKt1IWPMwQA6FOTnQJpsiFqkKVFBphqqBXynjwE6pPiLOWu4FP3Q9tiWN80k4bAehhH3xKTaOT0qfKZjqplvV2xQ1ChHe9Se4Uxw3xESl-N2MdJ_zV2RkgUC8zfjLrhms-o0gQUzSvp6BIQDEVg9mAQX3KGKQBRu5UpAyaM9VhgLD5tmbO-LcucvtaqrOYWPIp3lY-80n3mBY4yH9sZ3ldf7BnnpTv13zWvvBgdzXLM9R1pJRo7hHxeAu1OX3dou3OqD1NbkKGWtLFlUvcZZ_qCwUb4SzzAhuVMWXCZh9o3fYAxZbINKTw3UVoDIKzhW-iI4mBIlsow"
testDataUrl = "https://eventing.coursera.org/api/redirectStrict/Qc6T7BB7RVg2nSemuqUbhQ0sdtJZTTJQl-wCp1qpsVY08d5T2E6vy5jrOc6nNYzZvxndjFQ9QbkIiUNZOsgZcg.Y7LLZ5woJtigj1k2FTLmwA.64l5XrOiPtGcCW8eKBcbM6MzAkKnAaz_5lpKgA6TdotjzOFT3PmiIh3fQ6_HaFEUOkVatENllGtub9WyVi0OccD4yznCfr4pFBSUHPvQidPZzc3k5AWjhenWtWXkVt2VuQfkOI7mkSCuHzLyAb1Rq6KyFNMIe_6Nu4kgT5bgGIhZrPqyPsIOXfUgIzeJbrUUH-5s2aMehCHxuRRYwqVsBQP5crSotABhvyGz2sBqiBK7KYK8uKbJ4XuUNn2zGQa6NK1KJSkTT_Gw6RCqBCHFy2SG3yGc6KSFNgKpOx8NhSDQ_t8J-gGgofOQQ92AhWjdIBapNgZk7sQi57CNYzDV2yiPKJNCQGRujh9TQACQZSjvOsUbrt0NiszslLqiq8PxfxAvmXdzn-hqyxnRW1Je8Q"

###
# Functions
###

###
# Downloads data and returns both sets
collectData = function(){
  
  if(!dir.exists("data")){ dir.create("data")}
  
  #download.file(url1, destfile = "data/pml-training.csv")
  #download.file(url2, destfile = "data/pml-testing.csv")
  
  
  train <- read.csv("data/pml-training.csv")
  test  <- read.csv("data/pml-testing.csv")
  
  # push collected Data into global space; no multi-returns in R
  train ->> trainData
  test  ->> testData
}


###
# Output class if not integer, and seek NA's in data
diagnostic <- function(data, target = "integer"){
  for(i in 1:ncol(data)){
    if( class(data[,i]) == target  ) print(paste( colnames( data )[i], sum( data[,i] )))
    else{ print( paste(colnames(data)[i], class( data[,i]))) }
  }
}

#######
# Main
#######

###
# read data
collectData()
# train = train data
# test  = test data

str(trainData)

# This is expected:
OnePredict          <- OneR(classe ~., data = trainData)


rpartFit            <- train(classe ~ ., data = trainData, method = "rpart")
rpartFitProcess     <- train(classe ~ ., data = trainData, method = "rpart", preProc = c("center", "scale"))
rpartPredict        <- predict(rpartFit, newdata = testData)
rpartPredictProcess <- predict(rpartFitProcess, newdata = testData)

rfFit <- train(classe ~ ., trainData, method = "rf")
