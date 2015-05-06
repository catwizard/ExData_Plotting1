library(data.table)
HPC <- fread("household_power_consumption.txt", 
	sep=";", na.strings="?")
H1 <- subset(HPC, Date=="1/2/2007" | Date=="2/2/2007")
H1[,Time_o:=as.POSIXct(paste(as.Date(H1$Date,format="%d/%m/%Y"),H1$Time))]
plot(H1$Time_o, as.numeric(H1$Global_active_power),type="l", 
	xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", 
	width = 480, height = 480, units = "px")
dev.off()