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
  