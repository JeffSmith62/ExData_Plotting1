## Exploratory Data Analysis
## Course Assignment 1
## file plot2.R
## read in data
hpc <- read.table("./data/household_power_consumption.txt",header =TRUE, sep=";",stringsAsFactors = FALSE, na.strings= c("?"),
                  colClasses =c("character", "character", rep("numeric", 7)))

## Convert Date and Time columns
hpc$Date<-(as.Date(hpc$Date,"%d/%m/%Y"));hpc$Time<-strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%S")

# Create Subset of data for selected dates
hp<-hpc[which(hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),]

## Removes the hpc dataframe
rm(hpc)

## Adds weekday to dataset
hp$Day<-format(hp$Date,"%a")

##  opens the file
png(file = "plot2.png", width = 480, height=480, type="quartz")
## creates the plot
plot(hp$Time, hp$Global_active_power,  
     type = "l",                                ##  Sets the Type to Line
     ylab = "Global Active Power (kilowatts)",  ##  Adds the label to the Y axis
     xlab = "")  ##Turns off Label for x Axis

 dev.off() ## Closes file