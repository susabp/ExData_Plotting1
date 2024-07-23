# Load necessary libraries
library(data.table)

# Read and preprocess the data
data <- fread("household_power_consumption.txt", na.strings = "?")
data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[DateTime >= "2007-02-01" & DateTime < "2007-02-03"]

# Plotting
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, as.numeric(data$Sub_metering_2), col = "red")
lines(data$DateTime, as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
