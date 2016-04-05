# CSV


 
**This dataset contains information about crimes commited in Sacramento in 2006. This information are available from Sacramento police department. **

crimes<-read.csv("C:/Users/דודו/Downloads/SacramentocrimeJanuary2006.csv")

This command gets the data from the CSV file and puts it in a data frame.

Main Columns in the datatable:
- District - Number of the district where the crime commited
- Beat - Area inside the district
- grid - sub-area in the district
- Crime description - crime type
- Latitude & Longtitude - Location parameters, which is used to show the location of the crime in the map
- ucr_ncic_code - Code which is given by the police to describe the crime severity.

library("ggmap")
library("ggplot2")
map <- get_map(location = c(lon = mean(crimes$longitude), lat = mean(crimes$latitude)), zoom = 15,  maptype = "satellite", scale = 2)

**plotting the map with some points on it**

ggmap(map) +  geom_point(data = crimes, aes(x = longitude, y = latitude, colour = ifelse(district>3,F,T), alpha = 0.1), size = 10, shape = 10) +  guides(fill=FALSE, alpha=FALSE, size=FALSE)

The photo shows the crimes distribution across Sacremento. 
the districts were divided crimes - north and south. district number bigger then 3 are in the north while the rest in the south.
As we can see, more crimes were commited in the south (red color). It is known that south Sacramento is considred less reacher area then the north, which can describe the fact about the crimes distribution. 

barplot(table(crimes$district),col = "wheat",main = "number of crimes in each district")

library("mlbench")
library("caret")

This plot shows the number of crimes in each district. As we can see, district 3 has the highest crimes number. It is located in south Sacramento, which has more crimes.





