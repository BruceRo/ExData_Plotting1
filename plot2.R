library(tidyverse)
library(lubridate)

df <- read_delim("data/household_power_consumption.txt", delim = ";", na = "?")

df <- df %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

df <- df %>% mutate(DateTime = dmy_hms(str_c(Date, " ", Time)))

png(filename = "plot2.png",
    width = 480, height = 480)
plot(df$DateTime, df$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
