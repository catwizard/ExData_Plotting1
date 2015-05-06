library(data.table)
HPC <- fread("household_power_consumption.txt", 
	sep=";", na.strings="?")
H1 <- subset(HPC, Date=="1/2/2007" | Date=="2/2/2007")
H1[,Time_o:=as.POSIXct(paste(as.Date(H1$Date,format="%d/%m/%Y"),H1$Time))]
plot(H1$Time_o, as.numeric(H1$Sub_metering_1),type="l", 
	xlab="", ylab=" Energy sub metering")
lines(H1$Time_o, as.numeric(H1$Sub_metering_2) , col = "red")
lines(H1$Time_o, as.numeric(H1$Sub_metering_3) , col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	text.font=1, xjust=0)
dev.copy(png, file = "plot3.png", 
	width = 480, height = 480, units = "px")
dev.off()
