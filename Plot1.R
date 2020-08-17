# Reading data set
data<-read.table("household_power_consumption.txt",sep=";",header=T)

data$Date
tomatch <- c(grep("\\b1/2/2007\\b", data$Date),grep("\\b2/2/2007\\b", data$Date))
df <- data[tomatch,]

# Convert to date and time
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S")
df$Time <- sub(".*\\s+", "",  df$Time)

# Plot 1 
# 1. Open png file
png("plot1.png", width = 480, height = 480)
# 2. Create the plot
hist(as.numeric(df$Global_active_power),
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="red",
     breaks=12)
# 3. Close the file
dev.off()


