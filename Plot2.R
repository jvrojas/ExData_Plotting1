# Reading data set
data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date
tomatch <- c(grep("\\b1/2/2007\\b", data$Date),grep("\\b2/2/2007\\b", data$Date))
df <- data[tomatch,]

# Convert to date and time
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S")
df$Time <- sub(".*\\s+", "",  df$Time)

# Plot 2 
# 1. Open png file
png("plot2.png", width = 480, height = 480)
# 2. Create the plot
plot(as.numeric(df$Global_active_power),
	type = "l",
	xlab = "",
	ylab = "Global Active Power (kilowatts)",
	xaxt = "n")
axis(side = 1, at=c(1, 1441, 2880),  labels=c("Thu","Fri","Sat"))
# 3. Close the file
dev.off()
