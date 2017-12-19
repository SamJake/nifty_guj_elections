setwd("C:/Users/SamJacobJulian/Desktop/Rstd/nifty_guj_elections")

classes <- c(rep("character",7))
for(i in 1:4){
  f <- paste("./Data/data",i,".csv",sep = "")
  assign(paste("d",i,sep = ""),read.csv(file = f,colClasses = classes),envir = .GlobalEnv)
}

d <- rbind(d1,d2,d3,d4)
d <- d[,-c(6,7)]
d[,2:5] <- lapply(d[,2:5],function(x){as.numeric(x)})
d$Date <- as.Date(d$Date,"%d-%b-%Y")

ggplot(d,aes(x=Date,y=Close))+geom_line(col="red",size=2)
