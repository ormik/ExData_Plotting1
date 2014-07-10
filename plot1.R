dane=read.csv("household_power_consumption.txt", nrows=69517,sep=";", na.strings="?")
dane=dane[66637:69517,]
DataCzas=paste(dane$Date,dane$Time)
DataCzas2=strptime(DataCzas, format="%d/%m/%Y %H:%M:%S",tz="GMT")
dane$Time=DataCzas2
dane$Date=as.Date(dane$Date,format="%d/%m/%Y")

png("plot1.png")
hist(dane$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatts)")
dev.off()