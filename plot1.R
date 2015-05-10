
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

## Output to a png file
png(filename = "plot1.png")
hist(consumption[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()