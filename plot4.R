library(tidyverse)
library(lubridate)

df <- read_delim("data/household_power_consumption.txt", delim = ";", na = "?")

df <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

df <- df %>% mutate(DateTime = dmy_hms(str_c(Date, " ", Time)))

png(filename = "plot4.png",
    width = 480, height = 480)
par(mfrow = c(2,2))

# plot 1
plot(df$DateTime, df$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# plot 2
plot(df$DateTime, df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# plot 3
plot(df$DateTime, df$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2,
      type = "l",
      col = "red")
lines(df$DateTime, df$Sub_metering_3,
      type = "l",
      col = "blue")
legend("topright", lty = 1, 
       col = c("black", "blue", "red"),
       bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# plot 4
with(df,
     plot(DateTime, Global_reactive_power,
          type = "l",
          xlab = "datetime")
     )


dev.off()