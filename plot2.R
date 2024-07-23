# Load necessary libraries
library(data.table)

# Read and preprocess the data
data <- fread("household_power_consumption.txt", na.strings = "?")
data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[DateTime >= "2007-02-01" & DateTime < "2007-02-03"]

# Plotting
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
