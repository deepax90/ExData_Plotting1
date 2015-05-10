
## Downloading the zip file and storing it in a folder.
if (!file.exists("household_power_consumption.txt"))  {
    dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(dataset_url, "household_power_consumption.zip")
    unzip("household_power_consumption.zip")
    file.remove("household_power_consumption.zip")
}

## Read data from txt file and select subset for only two specific dates
consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", )
consumption <- consumption[which(consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"),]
consumption[,1] <- as.Date(consumption[,1], format("%d/%m/%Y"))
consumption$datetime <- as.POSIXct(paste(consumption$Date, consumption$Time))

## Output to a png file
png(filename = "plot3.png")
plot(consumption[,7]~consumption$datetime, type= "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(consumption[,8]~consumption$datetime, col = "red")
lines(consumption[,9]~consumption$datetime, col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
