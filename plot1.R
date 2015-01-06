plot1 <- function()
{
     df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
     subdf <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
     
     subdf$Global_active_power <- as.numeric(subdf$Global_active_power)
     
     png("plot1.png")
     hist(subdf$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
     dev.off()
}