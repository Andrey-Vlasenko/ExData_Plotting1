library(data.table)
setwd(choose.dir(getwd(), caption = "Choose folder with the Project"))
pathProject <- getwd()
pathData <- pathProject  # <- setwd(choose.dir(getwd(), caption = "Choose folder with the Data"))
setwd(pathProject)
png(file="plot2.png",width=480,height=480) 

windows.options(width=480, height=480)
language <- "English"
Sys.setlocale("LC_TIME", language) 

data <- fread(paste(pathData,"/household_power_consumption.txt",sep=""),sep=";",header=T,na.strings="?")
data$Date <- as.Date(data$Date ,"%d/%m/%Y")
data2 <- subset(data , data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
data2$date2 <- paste(data2$Date, data2$Time, sep = " ")
data2$date2 <- as.POSIXct(data2$date2,format ="%Y-%m-%d %H:%M:%S")

plot(data2$date2,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
 
