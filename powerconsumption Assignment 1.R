#First we load the Powerconsumptiondata

powerconsumption <- read.csv(file.choose(),sep = ";" ,na.strings = "?")

# transform dates and time
powerconsumption$Time <- paste(powerconsumption$Date ,powerconsumption$Time ,sep = " " )
powerconsumption$Time <- strptime(powerconsumption$Time,"%d/%m/%Y %H:%M:%S")

powerconsumption$Date <- as.Date(powerconsumption$Date,"%d/%m/%Y")

#subset data
powerconsumption <- subset(powerconsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Histogram
with(powerconsumption,hist(Global_active_power,main = "Global Active Power" , xlab = "Global active Power(kilowatts)", col = "red"))

dev.copy(png , file = "plot1.png")

dev.off()