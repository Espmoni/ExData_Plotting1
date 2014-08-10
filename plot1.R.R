temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", dec = ".",skip=66637, nrows = 2880)
unlink(temp)

names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, xlab = "Global Active Power ('kilowatts')", main = "Global Active Power", col="red")

dev.copy(png, file="plot1.png")
dev.off()
