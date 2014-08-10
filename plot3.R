temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", dec = ".",skip=66637, nrows = 2880)
unlink(temp)

names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


par(mfrow=c(1,1))

data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

data$day<-weekdays(data$Date)

data$full<-paste(data$Date, data$day)

# sorry, the names of week are in Polish

plot(y=data$Sub_metering_1, as.POSIXlt(x=data$full), type="l", ylab="Energy sub metering", xlab="")
lines(y=data$Sub_metering_2, x=as.POSIXlt(x=data$full), col="red")
lines(y=data$Sub_metering_3, x=as.POSIXlt(x=data$full), col="blue")


legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1), cex=0.8)
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

