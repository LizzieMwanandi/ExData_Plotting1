
power_con <- read.table("./Data2021/household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_con <- subset(power_con,power_con$Date=="1/2/2007" | power_con$Date =="2/2/2007")
# Transforming Date and Time variables from characters to objects of type Date and POSIXlt alike:
subpower_con$Date <- as.Date(subpower_con$Date, format="%d/%m/%Y")
subpower_con$Time <- strptime(subpower_con$Time, format="%H:%M:%S")
subpower_con[1:1440,"Time"] <- format(subpower_con[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_con[1441:2880,"Time"] <- format(subpower_con[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Similarly, let's read in, name and subsett the power consumption dataset:

with(subpower_con,{
  plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower_con$Time,as.numeric(as.character(subpower_con$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower_con$Time,subpower_con$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpower_con,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph:
title(main="Global Active Power Vs Time")
# Let's call the basic plot function:
plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
