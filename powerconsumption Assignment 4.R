#First we load the Powerconsumptiondata

powerconsumption <- read.csv(file.choose(),sep = ";" ,na.strings = "?")

# transform dates and time
powerconsumption$Time <- paste(powerconsumption$Date ,powerconsumption$Time ,sep = " " )
powerconsumption$Time <- strptime(powerconsumption$Time,"%d/%m/%Y %H:%M:%S")

powerconsumption$Date <- as.Date(powerconsumption$Date,"%d/%m/%Y")

#subset data
powerconsumption <- subset(powerconsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#plot frame
par(mfrow = c(2,2))

#plot 1
with(powerconsumption,plot(Time,Global_active_power, type = "n" , ylab = "Global Active Power(kilowatts)", xlab = ""))
with(powerconsumption,lines(Time,Global_active_power))

#plot2
with(powerconsumption,plot(Time,Voltage, type = "n" , xlab = "datetime"))
with(powerconsumption,lines(Time,Voltage))

#plot3
with(powerconsumption,plot(Time,Sub_metering_1, type = "n" , ylab = "Energy Sub metering", xlab = ""))
with(powerconsumption,points(Time,Sub_metering_2 , type = "n"))
with(powerconsumption,points(Time,Sub_metering_3, type = "n"))
with(powerconsumption,lines(Time,Sub_metering_1))
with(powerconsumption,lines(Time,Sub_metering_2, col = "red"))
with(powerconsumption,lines(Time,Sub_metering_3 , col = "blue"))

legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),pch = c(NA,NA,NA))


#plot 4
with(powerconsumption,plot(Time,Global_reactive_power, type = "n" , xlab = "datetime"))
with(powerconsumption,lines(Time,Global_reactive_power))


dev.copy(png , file = "plot4.png")

dev.off()
