install.packages("googleVis")
library(googleVis)
input<- read.csv("UNdata_Export_20150617_101412626.csv")
select<- input[which(input$Subgroup=="Total 5-14"),]

select<- input[which(input$Subgroup=="Total 5-14 yr"),]

Map<- data.frame(select$Country.or.Area, select$Value)

names(Map)<- c("Country", "Percentage")

Geo=gvisGeoMap(Map, locationvar="Country", numvar="Percentage",
               options=list(height=350, dataMode='regions'))

plot(Geo)
