
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

# Plot 2


png(file="plot2.png", height = 480, width = 480)

datetime <- paste(as.Date(mydata$Date,"%d/%m/%Y"),mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)
head(mydata)

plot(mydata$Global_active_power~mydata$Datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

## dev.copy(png,file="plot2.png", height = 480, width = 480)

dev.off()


