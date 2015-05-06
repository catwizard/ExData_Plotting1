library(data.table)
HPC <- fread("household_power_consumption.txt", 
	sep=";", na.strings="?")
H1 <- subset(HPC, Date=="1/2/2007" | Date=="2/2/2007")
par(mfcol = c(2, 2), mar = c(5, 4, 2, 2), oma = c(0, 0, 0, 0)) #布局
plot(H1$Time_o, as.numeric(H1$Global_active_power),type="l", 
	xlab="", ylab="Global Active Power") #左上图，y轴文字略不同
plot(H1$Time_o, as.numeric(H1$Sub_metering_1),
	type="l", xlab="", ylab=" Energy sub metering")
lines(H1$Time_o, as.numeric(H1$Sub_metering_2) , col = "red")
lines(H1$Time_o, as.numeric(H1$Sub_metering_3) , col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	text.font=1, xjust=0, bty="n") #左下图，图例无框线
plot(H1$Time_o, as.numeric(H1$Voltage),type="l", 
	xlab="datatime", ylab="Voltage") #右上图
plot(H1$Time_o, as.numeric(H1$ Global_reactive_power),type="l", 
	xlab="datatime", ylab=" Global_reactive_power") #右下图
dev.copy(png, file = "plot4.png", 
	width = 480, height = 480, units = "px")
dev.off()
