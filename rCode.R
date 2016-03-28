fileUrl<-"https://github.com/tomerwi/CSV/blob/master/SacramentocrimeJanuary2006.csv"
crimes<-read.csv("C:/Users/Tomer/Desktop/SacramentocrimeJanuary2006.csv")
MakeMap(labike$latitude, labike$longitude)

map <- get_map(location = c(lon = mean(crimes$longitude), lat = mean(crimes$latitude)), zoom = 15,  maptype = "satellite", scale = 2)
# plotting the map with some points on it
ggmap(map) +  geom_point(data = crimes, aes(x = longitude, y = latitude, colour = ifelse(district>4,F,T), alpha = 0.1), size = 2, shape = 21) +  guides(fill=FALSE, alpha=FALSE, size=FALSE)



newmap<-getMap(resolution = "low")
plot(newmap,xlim=c(34,38),ylim=c(29,121),asp=1)
points(newmap$lon, newmap$lat, col = "red", cex = .6)

barplot(table(crimes$district),col = "wheat",main = "number of crimes in each district")
     
     
     