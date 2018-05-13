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

#create a simple histogram of global active power variable
png("plot1.png",width =480,height = 480)
hist(housepowerdata_sample$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
