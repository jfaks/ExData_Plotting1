#First we load the Powerconsumptiondata

powerconsumption <- read.csv(file.choose(),sep = ";" ,na.strings = "?")

# transform dates and time
powerconsumption$Time <- paste(powerconsumption$Date ,powerconsumption$Time ,sep = " " )
powerconsumption$Time <- strptime(powerconsumption$Time,"%d/%m/%Y %H:%M:%S")

powerconsumption$Date <- as.Date(powerconsumption$Date,"%d/%m/%Y")

#subset data
powerconsumption <- subset(powerconsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Create line plot
with(powerconsumption,plot(Time,Global_active_power, type = "n" , ylab = "Global Active Power(kilowatts)", xlab = ""))
with(powerconsumption,lines(Time,Global_active_power))

dev.copy(png , file = "plot2.png")

dev.off()