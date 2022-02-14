###5plot transect
###view in QGIS, create ROI polygon
### "ROIclip.shp"
# loading rGEDI package
library(rGEDI)
outdir=getwd()


close(gedilevel1b)
close(gedilevel2a)
close(gedilevel2b)

gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,"\\Clip_GEDI01_B_2019336024706_O05499_T03754_02_003_01.h5"))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,"\\Clip_GEDI02_A_2019336024706_O05499_T03754_02_001_01.h5"))
gedilevel2b<-readLevel2B(level2Bpath = paste0(outdir,"\\Clip_GEDI02_B_2019336024706_O05499_T03754_02_001_01.h5"))




library(rgdal)
polygon_spdf<-readOGR("ROIclip.shp")
head(polygon_spdf@data) # column id name "id"
split_by="id"

####clip  data 
level2AM<-getLevel2AM(gedilevel2a)
level2AM_clip_gb <- clipLevel2AMGeometry(level2AM,polygon_spdf, split_by=split_by)

## View GEDI clipped data by bbox
# plot in map
library(leaflet)
library(leafsync)
m1<-leaflet() %>%
  addCircleMarkers(level2AM$lon_lowestmode,
                   level2AM$lat_lowestmode,
                   radius = 1,
                   opacity = 1,
                   color = "red",
                   popup=level2AM$shot_number,)  %>%
  addCircleMarkers(level2AM_clip_gb$lon_lowestmode,
                   level2AM_clip_gb$lat_lowestmode,
                   radius = 1,
                   opacity = 1,
                   color = "green")  %>%
  addScaleBar(options = list(imperial = FALSE)) %>%
  addProviderTiles(providers$Esri.WorldImagery)  %>%
  addLegend(colors = c("red","green"), labels= c("All samples","Clip bbox"),title ="GEDI Level2A") 


m1








###plot transects
#0110


#level2AM <- level2AM[level2AM$beam == "BEAM1000",]

test<- level2AM_clip_gb[level2AM_clip_gb$quality_flag == 1,]

test<- level2AM_clip_gb
dev.new()
#,  ylim=c(-30,-5)
plot(test$lon_lowestmode , test$elev_highestreturn, pch = 19, col = "black",  ylim=c(-30,-5))
points(test$lon_lowestmode , test$elev_lowestmode, pch = 19, col = 'red',  ylim=c(-30,-5))


