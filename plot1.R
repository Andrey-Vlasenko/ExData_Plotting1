library(data.table)
setwd(choose.dir(getwd(), caption = "Choose folder with the Project"))
pathProject <- getwd()
pathData <- pathProject  # <- setwd(choose.dir(getwd(), caption = "Choose folder with the Data"))
setwd(pathProject)
png(file="plot1.png",width=480,height=480) 

windows.options(width=480, height=480)
language <- "English"
Sys.setlocale("LC_TIME", language) 

data <- fread(paste(pathData,"/household_power_consumption.txt",sep=""),sep=";",header=T,na.strings="?")
data$Date <- as.Date(data$Date ,"%d/%m/%Y")
data2 <- subset(data , data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

hist(as.numeric(data2$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",xlim = c(0,6),ylim=c(0, 1200),xaxt='n')
axis(side=1, at=seq(0,6, by=2), labels=seq(0,6, by=2))
dev.off()

