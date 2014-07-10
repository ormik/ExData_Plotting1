dane=read.csv("household_power_consumption.txt", nrows=69517,sep=";", na.strings="?")
dane=dane[66637:69517,]
DataCzas=paste(dane$Date,dane$Time)
DataCzas2=strptime(DataCzas, format="%d/%m/%Y %H:%M:%S",tz="GMT")
dane$Time=DataCzas2
dane$Date=as.Date(dane$Date,format="%d/%m/%Y")

png("plot4.png")

par(mar=c(5,4,2,2))

par(mfrow=c(2,2))
#par(cex=.5)
with(dane,plot(Time,Global_active_power,type="l",xlab="",ylab="Global active power"))

with(dane,plot(Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(dane,plot(Time,Sub_metering_1,type="l",ylab="Global active power (kilowatts)"))
lines(dane[,2],dane[,8],col="red")
lines(dane[,2],dane[,9],col="blue")
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(dane,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()