 
library("ggplot2") 
library(maps)

setwd('D:\\shara\\R prog\\Map')


world <- map_data("world") 

Ukrain <- map_data("ukraine")
























library("ggplot2") 
library(maps)



D <- read.table(file = "data.txt",sep = " ")


world <- map_data("world") 


mycountr <- merge(world, D, by.x="region", by.y="V1",order = order)

sort.mycountr <- mycountr[order(mycountr$order),]

gg1 <- ggplot() + geom_polygon(data = world, 
                        aes(x=long, y = lat, group = group), fill="darkslategray2") +
  geom_polygon(data = sort.mycountr,
               aes(long, lat, group = group), fill = 'lightblue3',
               color="#2b2b2b", size=0.15) 
        
gg1

sort.mycountr$brks <- cut(sort.mycountr$V2, 
                      breaks=c(4, 3, 2, 1, 0), 
                      labels=c("1","2","3","4"))

gg2 <- gg1 + geom_polygon(data = sort.mycountr,
                        aes(long, lat, group = group, fill = brks),
                        color="#2b2b2b", size=0.15) 



labs1 <- data.frame(
  long = c(103.8198),
  lat = c(1.3521),
  names = c("Singapore"),
  stringsAsFactors = FALSE
)  

labs2 <- data.frame(
  long = c(33.4299),
  lat = c(35.1264),
  names = c("Cyprus"),
  stringsAsFactors = FALSE
)  

labs3 <- data.frame(
  long = c(5.2913),
  lat = c(52.1326),
  names = c("Cyprus"),
  stringsAsFactors = FALSE
)  

gg1 + 
  geom_point(data = labs1, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs1, aes(x = long, y = lat), color = "lightblue3", size = 1) +
  geom_point(data = labs2, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs2, aes(x = long, y = lat), color = "lightblue3", size = 1)+
  geom_point(data = labs3, aes(x = long, y = lat), color = "black", size = 2) +
  geom_point(data = labs3, aes(x = long, y = lat), color = "lightblue3", size = 1)






