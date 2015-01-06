plot4 <- function()
{
     df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
     subdf <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
     
     subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
     subdf$moment <- strptime(paste(subdf$Date, subdf$Time), "%d/ %m/ %Y %H: %M: %S")
     
     png("plot4.png")
     
     par(mfrow = c(2,2))
     
     plot(subdf$moment, subdf$Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
     lines(subdf$moment, subdf$Global_active_power)
     
     with(subdf, plot(moment, Voltage, xlab = "datetime", type = "n"))
     with(subdf, lines(moment, Voltage))
     
     plot(subdf$moment, subdf$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
     lines(subdf$moment, subdf$Sub_metering_1)
     lines(subdf$moment, subdf$Sub_metering_2, col = "red")
     lines(subdf$moment, subdf$Sub_metering_3, col = "blue")
     legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
     
     with(subdf, plot(moment, Global_reactive_power, xlab = "datetime", type = "n"))
     with(subdf, lines(moment, Global_reactive_power))
     
     dev.off()
}