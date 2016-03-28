##Code for reading in the data set
library(RCurl)
DataLink <- tempfile()
download.file("https://github.com/dccd202/RepData_PeerAssessment1/raw/master/activity.zip",DataLink)
SpyData <- na.omit(read.csv((unz(DataLink, "activity.csv")), header = T))

##code for histogram of total steps taken per day and mean
StepsDay <- aggregate(steps ~ date, SpyData, sum)
hist(StepsDay$steps)
mean(StepsDay$steps)
median(StepsDay$steps)

##Calc time series
SDTime <- ts(aggregate(steps ~ IntFactor, SpyData, mean))
plot.ts(SDTime)

##Imputting Missing Values
NASpyData <- (read.csv((unz(DataLink, "activity.csv")), header = T))


