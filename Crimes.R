crimes<-read.csv("C:/Users/Tomer/Documents/SacramentocrimeJanuary2006.csv")

library("ggmap")
library("ggplot2")
map <- get_map(location = c(lon = mean(crimes$longitude), lat = mean(crimes$latitude)), zoom = 15,  maptype = "satellite", scale = 2)
# plotting the map with some points on it
ggmap(map) +  geom_point(data = crimes, aes(x = longitude, y = latitude, colour = ifelse(district>3,F,T), alpha = 0.1), size = 10, shape = 10) +  guides(fill=FALSE, alpha=FALSE, size=FALSE)

barplot(table(crimes$district),col = "wheat",main = "number of crimes in each district")

library("mlbench")
library("caret")

set.seed(7584)
crimes$district<-as.factor(crimes$district)
crimes<-crimes[c(5,7,6,4,1,2,8,9,3)]
crimes$beat<-as.numeric(crimes$beat)
crimes$crimedescr<-as.numeric(crimes$crimedescr)

TrainData <- crimes[,1:4]

TrainClasses <- crimes[,9]
TrainClasses<-as.factor(TrainClasses)


control<-trainControl(method="repeatedcv",number=10,repeats=3)
model<-train(as.data.frame(TrainData),TrainClasses,method = "lvq",preProcess = "scale",trControl =control)
importance<-varImp(model,scale=FALSE)
print(importance)
plot(importance)


