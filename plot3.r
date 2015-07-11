#Load data
table_All <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", colClasses = c(rep("character",2), rep("numeric",7)))
table_All$Date <- as.Date(table_All$Date, format="%d/%m/%Y")
#Select only two days
table_Selection<-table_All[table_All$Date=='2007-02-01' | table_All$Date=='2007-02-02',]
table_Selection <- transform(table_Selection, DateTime=as.POSIXct(paste(Date, Time)))

#Create plot 3
par(mfrow=c(1,1))

plot(table_Selection$DateTime,table_Selection$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(table_Selection$DateTime,table_Selection$Sub_metering_2,col="red")
lines(table_Selection$DateTime,table_Selection$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()