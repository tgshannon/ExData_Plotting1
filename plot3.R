##	plot3.R create line plot of Energy sub metering

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#	destfile="dl.zip", method="curl");
#unzip("dl.zip", files="household_power_consumption.txt");
#unlink("dl.zip");

hhpc <- read.table("household_power_consumption.txt",
	na.strings="?", sep=";", stringsAsFactors=FALSE, skip=66638, nrows=2880);
colnames(hhpc) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
	"Voltage", "Global.intensity", "Sub.metering.1", "Sub.metering.2", "Sub.metering.3");

png(file="plot3.png");
with(hhpc, plot(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.1,type='n',
  xlab="", ylab="Energy sub metering"));
with(hhpc, points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.1,type='l'));
with(hhpc, points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.2,col="red",type='l'));
with(hhpc, points(strptime(paste(Date,Time),format="%e/%m/%Y %H:%M:%S"),Sub.metering.3,col="blue",type='l'));
legend("topright", fill=c("black", "red", "blue"),
  legend=c("Sub.metering.1", "Sub.metering.2","Sub.metering.3"));
dev.off();
