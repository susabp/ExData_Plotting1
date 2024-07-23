# Load necessary libraries
library(data.table)

# Read and preprocess the data
data <- fread("household_power_consumption.txt", na.strings = "?")
data[, Date := as.Date(Date, format = "%d/%m/%Y")]
data <- data[Date == "2007-02-01" | Date == "2007-02-02"]

# Plotting
png("plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
