# Reading data set
data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date
tomatch <- c(grep("\\b1/2/2007\\b", data$Date),grep("\\b2/2/2007\\b", data$Date))
df <- data[tomatch,]

# Convert to date and time
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S")
df$Time <- sub(".*\\s+", "",  df$Time)

# Plot 3
# 1. Open png file
png("plot3.png", width = 480, height = 480)
# 2. Create the plot
plot(as.numeric(df$Sub_metering_1),	
	type = "l",
	xlab = "",
	ylab = "Energy sub metering",
	xaxt = "n")
axis(side = 1, at=c(1, 1441, 2880),  labels=c("Thu","Fri","Sat"))
lines(as.numeric(df$Sub_metering_2), col = "red")
lines(as.numeric(df$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1)
# 3. Close the file
dev.off()
