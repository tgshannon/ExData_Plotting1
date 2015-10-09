##	plot2.R create histogram of Global Active Power consumption

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
#	destfile="dl.zip", method="curl");
#unzip("dl.zip", files="household_power_consumption.txt");
#unlink("dl.zip");

hhpc <- read.table("household_power_consumption.txt",
	na.strings="?", sep=";", stringsAsFactors=FALSE, skip=66638, nrows=2880);
colnames(hhpc) <- c("Date", "Time", "Global.active.power", "Global.reactive.power",
	"Voltage", "Global.intensity", "Sub.metering.1", "Sub.metering.2", "Sub.metering.3");

png(file="plot2.png");
plot(strptime(paste(hhpc$Date, hhpc$Time),format='%e/%m/%Y %H:%M:%S'),
  hhpc$Global.active.power, type='l', xlab="", ylab="Global Active Power (kilowatts)");
dev.off();
