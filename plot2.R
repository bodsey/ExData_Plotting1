plot2 <- function()
{
     df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
     subdf <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
     
     subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
     subdf$moment <- strptime(paste(subdf$Date, subdf$Time), "%d/ %m/ %Y %H: %M: %S")
     
     png("plot2.png")
     plot(subdf$moment, subdf$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
     lines(subdf$moment, subdf$Global_active_power)
     dev.off()
}