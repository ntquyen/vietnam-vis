library(googleVis)
library(dplyr)

data <- read.csv("./data/V02.01.csv", header = TRUE)
names(data) <- c("province", "area.km2", "population", "density")

province.codes <- read.csv("./data/vn_provinces_code.csv", header = FALSE)
names(province.codes) <- c("iso3166.2", "province")
data <- merge(data, province.codes, by = c("province"))

geo <- gvisGeoChart(data, 
                  locationvar = "iso3166.2", 
                  colorvar = "density", hovervar = "province",
                  options = list(dataMode = "regions", resolution="provinces",
                                 region = "VN", width=940, height=700)
                  )
plot(geo)
