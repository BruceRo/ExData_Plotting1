library(tidyverse)
library(lubridate)

df <- read_delim("data/household_power_consumption.txt", delim = ";", na = "?")

df <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

df <- df %>% mutate(DateTime = dmy_hms(str_c(Date, " ", Time)))

png(filename = "plot3.png",
    width = 480, height = 480)
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
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
