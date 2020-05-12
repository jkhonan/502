#t test and plot for tucson and flagstaff in 2019-07/08
setwd("/Users/Qianying/Desktop/BE502")
Rain<-setClass("Rain", slots=c(filename="character", gauge_col="character", date_col="character", rain_col="character", quality_col="character", data="data.frame"))
init<-function(obj) 
  setGeneric("init")
setMethod("init","Rain", function(obj){ 
  data=read.delim(obj@filename, header=T, sep="\t", stringsAsFactors=F)
  return(data) })
get_rain<-function(obj, time, quality) 
  setGeneric("get_rain")
setMethod("get_rain", "Rain", function(obj, time, quality){
  data=obj@data
  data=data[grep(quality, data[,obj@quality_col], ignore.case=T),]
  data=data[grep(time, data[,obj@date_col], ignore.case=T),]
  return(data[,obj@rain_col])})
rain=Rain(filename="tucson_rain.txt", gauge_col="gaugeId", date_col="readingDate", rain_col="rainAmount", quality_col="quality", data=data.frame())
attributes(rain)
attr(rain,"data")
rain@data=init(rain)
x=get_rain(rain, "2019-01-01",quality="good")
x
y=mean(x)
y
rain_mean <- function(obj, time, quality){
  y=mean(get_rain(obj, time, quality))
  return(y)
}
rain_mean(rain, "2019-01",quality="good")-rain_mean(rain, "2019-02",quality="good")
rain_mean(rain, "2018-01",quality="good")-rain_mean(rain, "2019-01",quality="good")

rain_mean(rain, "2018-07",quality="good")-rain_mean(rain, "2019-07",quality="good")
rain_mean(rain, "2019-07",quality="good")-rain_mean(rain, "2019-08",quality="good")

g <- function(Time1,
              Time2){
  # Create 2 vectors
  time1 <- get_rain(rain, Time1,quality="good")
  time2 <- get_rain(rain, Time2,quality="good")
  
  # Make a list of these 2 vectors
  data1 <- list(time1,time2)
  
  # Change the names of the elements of the list :
  names(data1) <- c(paste(Time1 ,sep=""), paste(Time2, sep=""))
  
  # Change the mgp argument: avoid text overlaps axis
  par(mgp=c(3,2,0))
  t <- t.test(time1,time2)
  p_value <- t.test(time1,time2)$p.value
  mean_diff <- rain_mean(rain, Time1,quality="good")-rain_mean(rain, Time2,quality="good")
  # Final Boxplot
  plot <- boxplot(data1,col="#69b3a2" , ylab="rain_amount" )
  text(1.5,2.6,paste0("mean_difference= ",signif(mean_diff,3)),col = "blue")
  return(list(plot,t,p_value))
}

Time1="2018-07"
Time2="2019-07"

g(Time1,Time2)


Time1="2019-07"
Time2="2019-08"
g(Time1,Time2)






#t-test and plot for 2018 vs 2019 mean differnces between tucson and flagstaff 
year2018 = c(112.12650000000005,777.0261999999964,17.515000000000086,0.12999999999999998,-0.5949999999999995,406.8399999999996,739.8514999999957,734.8402999999952,565.7474999999998,1347.0879999999884,90.8455,456.7414999999988)
year2019 = c(489.84359999999583,1223.4229999999977,319.74339999999916,23.60570000000001,63.390000000000185,7.93499999999999,394.1449999999998,680.4514999999977,818.2334999999963,-0.10000000000000002,1070.2614999999944,726.2684999999975)
t.test(year2018,year2019)
data1 <- list(year2018,year2019)
plot <- boxplot(data1,col="#69b3a2" , xlab = "year", ylab="rain_amount" )