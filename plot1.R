library(data.table)
HPC <- fread("household_power_consumption.txt", 
	sep=";", na.strings="?")
H1 <- subset(HPC, Date=="1/2/2007" | Date=="2/2/2007")
hist(as.numeric(H1$Global_active_power), col="red", 
	main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", 
	width = 480, height = 480, units = "px")
dev.off()