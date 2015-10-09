##	plot4.R create line plot of Energy sub metering
## Uncomment the following lines to download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	destfile="dl.zip", method="curl");
unzip("dl.zip", files="household_power_consumption.txt");
unlink("dl.zip");

hhpc <- read.table("household_power_consumption.txt",
	na.strings="?", sep=";", stringsAsFactors=FALSE, skip=66638, nrows=2880);
colnames(hhpc) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
	"Voltage", "Global.intensity", "Sub.metering.1", "Sub.metering.2", "Sub.metering.3");

png(file="plot4.png");
par(mfrow=c(2,2));
with(hhpc, {
	plot(strptime(paste(Date, Time),format='%e/%m/%Y %H:%M:%S'),
  	  Global.active.power, type='l', xlab="", ylab="Global Active Power (kilowatts)");
  	  
  	plot(strptime(paste(Date, Time),format='%e/%m/%Y %H:%M:%S'),
	  Voltage, type='l', xlab="datetime", ylab="Voltage");

	plot(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.1,type='n',
	  xlab="", ylab="Energy sub metering");
	points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.1,type='l');
	points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.2,col="red",type='l');
	points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.3,col="blue",type='l');
	legend("topright", fill=c("black", "red", "blue"),
 	  legend=c("Sub.metering.1", "Sub.metering.2","Sub.metering.3"));
 	
  	plot(strptime(paste(Date, Time),format='%e/%m/%Y %H:%M:%S'),
	  Global.reactive.power, type='l', xlab="datetime"); 	
});
dev.off();
