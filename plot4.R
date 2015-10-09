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
png(file = "plot4.png", width = 480, height=480, type="quartz")

par(mfrow = c(2,2))

with(hp, {
      ## creates the plot in ul with Global_active_power 
      plot(Time, Global_active_power,      
           type = "l",                              ##  Sets the Type to Line
           ylab = "Global Active Power",            ##  Adds the label to the Y axis
           xlab = "") 
      
      ## creates the plot in ur with voltage
     plot(Time, Voltage,     
            type = "l",                                ##  Sets the Type to Line
            xlab = "datetime")  ##Turns off Label for x Axis
     
     ## creates the plot in ll with sub metering     
     plot(Time, Sub_metering_1,  type = "l", col="black",        ## adds ine for metering 1
            ylab = "Energy sub metering",                                ##  Adds the label to the Y axis
            xlab = ""                                                    ## Turns off Label for x Axis
            )
            lines(Time, Sub_metering_2,   type = "l",col = "red")       ## adds ine for metering 2
            lines(Time, Sub_metering_3,     type = "l", col="blue")     ## adds ine for metering 3
            legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
         
     ## creates the plot in lr with Global_reactive_power
     plot(Time, Global_reactive_power,  
          type = "l",                                ##  Sets the Type to Line
          xlab = "datetime")  ##Turns off Label for x Axis
         
})


dev.off() ## Closes file


