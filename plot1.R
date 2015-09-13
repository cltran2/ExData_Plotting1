plot1 <- function () {
	
	## plot to png
	##

	hist(as.numeric(as.character(data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")			
}

plot2 <- function () {
	with(data, plot(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Global_active_power)), type = 'n', xlab="", ylab="Global Active Power (kilowatts)"))
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Global_active_power)), lwd = 1))
}

plot3 <- function () {
	with(data, plot(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Sub_metering_1)), type = 'n', xlab="", ylab="Energy sub metering"))
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Sub_metering_1)), lwd = 1))
	
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Sub_metering_2)), lwd = 1, col = 'red'))
	
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Sub_metering_3)), lwd = 1, col = 'blue'))	
	
	legend("topright", lwd=1, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))	
}

plot4 <- function () {
	par(mfrow = c(2, 2))
	plot2()
	
	with(data, plot(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Voltage)), type = 'n', xlab="datetime", ylab="Voltage"))
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Voltage)), lwd = 1))	
	
	plot3()
	
	with(data, plot(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Global_reactive_power)), type = 'n', xlab="datetime", ylab="Global_reactive_power"))
	with(data, lines(strptime(paste(Date, Time, sep = ' '), '%d/%m/%Y %H:%M:%S'), as.numeric(as.character(Global_reactive_power)), lwd = 1))	
}

plotall <- function () {
	library(dplyr)
	#data <- read.csv('household_power_consumption.txt', sep=';')
	mindate <- strptime('1/2/2007', '%d/%m/%Y')
	maxdate <- strptime('2/2/2007', '%d/%m/%Y')
	#data <- filter(data, strptime(Date, '%d/%m/%Y') >= mindate & strptime(Date, '%d/%m/%Y') <= maxdate)
	
	png('plot1.png', width = 480, height = 480)
	plot1()
	dev.off()
	
	png('plot2.png', width = 480, height = 480)
	plot2()
	dev.off()	
	
	png('plot3.png', width = 480, height = 480)	
	plot3()
	dev.off()				
	
	png('plot4.png', width = 480, height = 480)	
	plot4()
	dev.off()					
}
