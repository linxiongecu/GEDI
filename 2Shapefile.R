##script2 for shapefiles.
library(rGEDI)
setwd("C:/Users/xiongl21/WorkingFolder/Postdoc/ProjectFlorida/Data/GEDI")
outdir=getwd()



# output name list
filelist <- list.files(pattern="^Clip_GEDI01_B*")

for(var in 1:75)
{ 
  
  print(var)


# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,'/', filelist[var]))


######################################level 1b#####################
#Get GEDI Pulse Geolocation (GEDI Level1B)
###digital_elevation_model
##elevation_bin0"
level1bGeo<-getLevel1BGeo(level1b=gedilevel1b,select=c("digital_elevation_model", "stale_return_flag","degrade" ))


#filter poor quality points add by lin
level1bGeo <- level1bGeo[level1bGeo$stale_return_flag == 0,]

level1bGeo <- level1bGeo[level1bGeo$degrade == 0,]




head(level1bGeo)

nrow(level1bGeo)

if (nrow(level1bGeo) > 0 ) {


# Converting shot_number as "integer64" to "character"
level1bGeo$shot_number<-paste0(level1bGeo$shot_number)

# Converting level1bGeo as data.table to SpatialPointsDataFrame
library(sp)
level1bGeo_spdf<-SpatialPointsDataFrame(cbind(level1bGeo$longitude_bin0, level1bGeo$latitude_bin0),
                                        data=level1bGeo)
# create a substring. 


substr(filelist[var], 0, 5)



# Exporting level1bGeo as ESRI Shapefile
raster::shapefile(level1bGeo_spdf,paste0(outdir,"/DataShapeFiles/", filelist[var]), overwrite=TRUE)
}



}