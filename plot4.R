library(data.table)
path <- setwd(choose.dir(default = "", caption = "Select folder"))
png(file="plot4.png",width=480,height=480)

windows.options(width=480, height=480)
language <- "English"
Sys.setlocale("LC_TIME", language) 

data <- fread(paste(path,"\\household_power_consumption.txt",sep=""),sep=";",header=T,na.strings="?")
data$Date <- as.Date(data$Date ,"%d/%m/%Y")
data2 <- subset(data , data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
data2$date2 <- paste(data2$Date, data2$Time, sep = " ")
data2$date2 <- as.POSIXct(data2$date2,format ="%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))
plot(data2$date2,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(data2$date2,data2$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data2$date2,data2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="Black")
lines(data2$date2,data2$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="Red")
lines(data2$date2,data2$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="Blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",lwd=c(2.5,2.5),col=c("black","red","blue"))
plot(data2$date2,data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()