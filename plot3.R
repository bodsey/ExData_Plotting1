plot3 <- function()
{
     df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
     subdf <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
     
     subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
     subdf$moment <- strptime(paste(subdf$Date, subdf$Time), "%d/ %m/ %Y %H: %M: %S")
     
     png("plot3.png")
     plot(subdf$moment, subdf$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
     lines(subdf$moment, subdf$Sub_metering_1)
     lines(subdf$moment, subdf$Sub_metering_2, col = "red")
     lines(subdf$moment, subdf$Sub_metering_3, col = "blue")
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
     dev.off()
}