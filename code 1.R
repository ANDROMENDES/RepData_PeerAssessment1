---
title: "Untitled"
author: "LOFOR ANDREW"
date: "May 2, 2019"
output: ioslides_presentation
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## R Markdown

This is an R Markdown presentation. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document.

## Slide with Bullets
activity <- read.csv("activity.csv")
activity <- read.csv("activity.csv")

- Bullet 1
- Bullet 2
- Bullet 3

## Slide with R Output

```{r cars, echo = TRUE}
summary(cars)
```

## Slide with Plot

```{r pressure}
plot(pressure)
```
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")
  
## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)
  
## Name the vector
dateTime <- setNames(dateTime, "DateTime")
  
## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]
  
## Add DateTime column
t <- cbind(dateTime, t)
  
## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)
## Create plot1
 ## Create the histogram
  hist(t$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
   ## Save file and close device
  #dev.copy(png,"plot1.png", width=480, height=480)
  #dev.off()
  # reading data
  los <- subset(NEI, fips == "06037")
  
  # subsetting SCC with vehicle values
  vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  subsetSCC <- SCC[vehicleMatches, ]
  
  # merging dataframes, adding city variable
  dataBalt <- merge(balt, subsetSCC, by="SCC")
  dataBalt$city <- "Baltimore City"
  dataLos <- merge(los, subsetSCC, by="SCC")
  dataLos$city <- "Los Angeles County"
  data <- rbind(dataBalt, dataLos)
  
  # summing emission data per year per type
  data <- aggregate(Emissions ~ year + city, data, sum)
  
  # plotting
  g <- ggplot(data, aes(year, Emissions, color = city))
  g + geom_line() +
    xlab("Year") +
    ylab(expression("Total PM"[2.5]*" Emissions")) +
  ##Code for reading in the dataset and/or processing the data
    activity <- read.csv("activity.csv")
  activity$day <- weekdays(as.Date(activity$date))
  activity$DateTime<- as.POSIXct(activity$date, format="%Y-%m-%d")
  
  ##pulling data without nas
  clean <- activity[!is.na(activity$steps),]
  library(ggplot2)
  Warning message:
    package 'ggplot2' was built under R version 3.5.3 
  > library(plyr)
  Warning message:
    package 'plyr' was built under R version 3.5.3 
  > activity <- read.csv("activity.csv")
  > activity$day <- weekdays(as.Date(activity$date))
  > activity$DateTime<- as.POSIXct(activity$date, format="%Y-%m-%d")
  > 
    > clean <- activity[!is.na(activity$steps),]
  > View(clean)
  > View(activity)
  > View(clean)
  > sumTable <- aggregate(activity$steps ~ activity$date, FUN=sum, )
  > colnames(sumTable)<- c("Date", "Steps")
  > hist(sumTable$Steps, breaks=5, xlab="Steps", main = "Total Steps per Day")
  > as.integer(mean(sumTable$Steps))
  [1] 10766
  > as.integer(median(sumTable$Steps))
  [1] 10765
  > library(plyr)
  > library(ggplot2)
  > clean <- activity[!is.na(activity$steps),]
  > 
    > intervalTable <- ddply(clean, .(interval), summarize, Avg = mean(steps))
  > p <- ggplot(intervalTable, aes(x=interval, y=Avg), xlab = "Interval", ylab="Average Number of Steps")
  > p + geom_line()+xlab("Interval")+ylab("Average Number of Steps")+ggtitle("Average Number of Steps per Interval")
  > maxSteps <- max(intervalTable$Avg)
  > intervalTable[intervalTable$Avg==maxSteps,1]
  [1] 835
  > nrow(activity[is.na(activity$steps),])
  [1] 2304
  > avgTable <- ddply(clean, .(interval, day), summarize, Avg = mean(steps))
  > 
    > nadata<- activity[is.na(activity$steps),]
  > newdata<-merge(nadata, avgTable, by=c("interval", "day"))
  > newdata2<- newdata[,c(6,4,1,2,5)]
  > colnames(newdata2)<- c("steps", "date", "interval", "day", "DateTime")
  > 
    > mergeData <- rbind(clean, newdata2)
  > sumTable2 <- aggregate(mergeData$steps ~ mergeData$date, FUN=sum, )
  > colnames(sumTable2)<- c("Date", "Steps")
  > 
    > as.integer(mean(sumTable2$Steps))
  [1] 10821
  > as.integer(median(sumTable2$Steps))
  [1] 11015
  > hist(sumTable2$Steps, breaks=5, xlab="Steps", main = "Total Steps per Day with NAs Fixed", col="Black")
  > hist(sumTable$Steps, breaks=5, xlab="Steps", main = "Total Steps per Day with NAs Fixed", col="Grey", add=T)
  > legend("topright", c("Imputed Data", "Non-NA Data"), fill=c("black", "grey") )
  > mergeData$DayCategory <- ifelse(mergeData$day %in% c("Saturday", "Sunday"), "Weekend", "Weekday")
  > library(lattice)
  > intervalTable2 <- ddply(mergeData, .(interval, DayCategory), summarize, Avg = mean(steps))
  > 
    > xyplot(Avg~interval|DayCategory, data=intervalTable2, type="l",  layout = c(1,2),
             +        main="Average Steps per Interval Based on Type of Day", 
             +        ylab="Average Number of Steps", xlab="Interval")
  