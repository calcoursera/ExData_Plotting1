
## Set the working directory to path where the data file household_power_consumption.txt has been saved

wd<-"C:/Users/GANCAL/Documents/Calai/CourseraDataScience/ExplDataAnalysis"
setwd(wd)


## read the data file into febdata

febdata<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", quote = "",
         dec = ".", fill = TRUE, na.strings="?",stringsAsFactors=FALSE)
summary(febdata)
head(febdata)

library(datasets)


## Extract the data for 1st and 2nd Feb 2007 and store in mydata
sDt1=as.Date("01/02/2007","%d/%m/%Y")
sDt1

sDt2=as.Date("02/02/2007","%d/%m/%Y")
sDt2

feb1data <- subset(febdata, (as.Date(Date,"%d/%m/%Y")==sDt1)  )
feb2data <- subset(febdata, (as.Date(Date,"%d/%m/%Y")==sDt2)  )
 
mydata=merge(feb1data,feb2data,all=TRUE)
head(mydata)
tail(mydata)


#  extract the day of the week
# mydata$day <- weekdays(as.Date(mydata$Date,"%d/%m/%Y"))
#head(mydata)
#tail(mydata)


#Plot 4

png(file="plot4.png", height = 480, width = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(mydata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})

## Saving to plot4.png file
##dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()







