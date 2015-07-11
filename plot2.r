#Load data
table_All <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", colClasses = c(rep("character",2), rep("numeric",7)))
table_All$Date <- as.Date(table_All$Date, format="%d/%m/%Y")
#Select only two days
table_Selection<-table_All[table_All$Date=='2007-02-01' | table_All$Date=='2007-02-02',]
table_Selection <- transform(table_Selection, DateTime=as.POSIXct(paste(Date, Time)))

#Create plot 2
par(mfrow=c(1,1))

plot(table_Selection$DateTime,table_Selection$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()