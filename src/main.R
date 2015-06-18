library(googleVis)
library(dplyr)

source("./src/read.R")

province.codes <- getProvinceCodes()
province.codes <- select(province.codes, code, province)
province.codes$province <- refineText(province.codes$province)

data <- read.csv("./data/V02.01.csv", header = TRUE)
names(data) <- c("province", "area.km2", "population", "density")
data$province <- refineText(data$province)

vietnam_population_distribution <- merge(data, 
              province.codes, 
              by = c("province"))

write.csv(vietnam_population_distribution, "./data/merge_data.csv")
geo.density <- gvisGeoChart(vietnam_population_distribution, locationvar = "code", 
                  colorvar = "density", hovervar = "province",
                  options = list(dataMode = "regions", resolution="provinces",
                                 region = "VN", width = 800, height = 600, backgroundColor="lightblue",
                                 colorAxis = "{colors: ['red']}"),
                  chartid = "VN_density"
                  )
plot(geo.density)

geo.population <- gvisGeoChart(vietnam_population_distribution, locationvar = "code", 
                            colorvar = "population", hovervar = "province",
                            options = list(dataMode = "regions", resolution="provinces",
                                           region = "VN", width=940, height=700, backgroundColor="lightblue",
                                           colorAxis = "{colors: ['red']}"),
                            chartid = "VN_population"
                            )
plot(geo.population)

