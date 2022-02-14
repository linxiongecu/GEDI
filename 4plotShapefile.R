#####
setwd("C:/Users/xiongl21/WorkingFolder/Postdoc/ProjectFlorida/Data/GEDI/DataShapeFiles")
outdir=getwd()
# load packages
library("ggplot2")
library(sf)

# output name list
filelist <- list.files(pattern="*.shp")


shapefile_list <- lapply(filelist, read_sf)

all_data <- do.call(rbind, shapefile_list)




ggplot() + 
  geom_sf(data = all_data, color = "red") + 
  ggtitle("GEDI data coverage") + 
  coord_sf()

