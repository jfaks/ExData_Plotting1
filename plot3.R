#First we load the Powerconsumptiondata

powerconsumption <- read.csv(file.choose(),sep = ";" ,na.strings = "?")

# transform dates and time
powerconsumption$Time <- paste(powerconsumption$Date ,powerconsumption$Time ,sep = " " )
powerconsumption$Time <- strptime(powerconsumption$Time,"%d/%m/%Y %H:%M:%S")

powerconsumption$Date <- as.Date(powerconsumption$Date,"%d/%m/%Y")

#subset data
powerconsumption <- subset(powerconsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Histogram

with(powerconsumption,plot(Time,Sub_metering_1, type = "n" , ylab = "Energy Sub metering", xlab = ""))
with(powerconsumption,points(Time,Sub_metering_2 , type = "n"))
with(powerconsumption,points(Time,Sub_metering_3, type = "n"))
with(powerconsumption,lines(Time,Sub_metering_1))
with(powerconsumption,lines(Time,Sub_metering_2, col = "red"))
with(powerconsumption,lines(Time,Sub_metering_3 , col = "blue"))


legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),pch = c(NA,NA,NA))

dev.copy(png , file = "plot2.png")

dev.off()