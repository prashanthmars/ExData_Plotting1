library(data.table)
library(lubridate)

2075259*9*8/2^20
#142 MB is approximately the size of the data

#read the household power consumption data using data.table function
#initialize all columns to character to ensure right retrieval of data
housepowerdata <-fread("household_power_consumption.txt",colClasses = "character")
str(housepowerdata)
housepowerdata$Date<-dmy(housepowerdata$Date)
housepowerdata$Global_active_power<-as.numeric(housepowerdata$Global_active_power)

#subset the datatable for the mentioned dates using subset function
housepowerdata_sample<-subset(housepowerdata,Date %in% as.Date(c("2007-02-01","2007-02-02")))

#plot all of the previous charts and the new ones on a 2 by 2 grid
#using par(mfrow=c(2,2)) for the same
png("plot4.png",width =480,height = 480)
par(mfrow=c(2,2))
plot(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Sub_metering_2,type="l",col="red")
lines(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,cex=0.5,y.intersp = 1,bty = "n",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
plot(ymd_hms(paste(housepowerdata_sample$Date,housepowerdata_sample$Time)),housepowerdata_sample$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
