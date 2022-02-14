###download and clip data in Florida.
###03/29/2021
# loading rGEDI package
library(rGEDI)
setwd("C:/Users/xiongl21/WorkingFolder/Postdoc/ProjectFlorida/Data/GEDI")
outdir=getwd()

#25.17489957545465, -80.94681496219904 ul
#25.138738306439482, -80.88557476747856  lr
#larger region
#25.484225778490714, -81.19133843049518 ul
#25.138045349479498, -80.70807041885938 lr

###gliht florida area
##26.14640869859845, -81.87977048751891 ul
## 24.90636398947743, -80.09728449505882 lr
ul_lat<- 26.14640869859845
lr_lat<- 24.90636398947743
ul_lon<- -81.87977048751891
lr_lon<- -80.09728449505882 



#####Big pine key
#24.848665619658735, -81.99391438557777
#24.582685355278738, -81.09741024616238
ul_lat<- 24.72694661989792
lr_lat<- 24.607493848787968
ul_lon<- -81.72971306167625
lr_lon<- -81.53321893481983

#-81.74752,24.69846
#-81.54331,24.60095

#24.72694661989792, -81.72971306167625
#24.607493848787968, -81.53321893481983


# find gedi data
# Specifying the date range
#launch date 2018 12 01
daterange=c("2018-12-01","2021-03-29")

# Get path to GEDI data
gLevel1B<-gedifinder(product="GEDI01_B",ul_lat, ul_lon, lr_lat, lr_lon,version="001",daterange=daterange)
gLevel2A<-gedifinder(product="GEDI02_A",ul_lat, ul_lon, lr_lat, lr_lon,version="001",daterange=daterange)
gLevel2B<-gedifinder(product="GEDI02_B",ul_lat, ul_lon, lr_lat, lr_lon,version="001",daterange=daterange)

#loop should start here:
###  i= 1 to 77

for(var in 32:33)
{ 

  print(var)
  Sys.time()


# Downloading GEDI data
gediDownload(filepath=gLevel1B[var],outdir=outdir)
gediDownload(filepath=gLevel2A[var],outdir=outdir)
gediDownload(filepath=gLevel2B[var],outdir=outdir)

# create a substring. 

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}
substrRight(gLevel1B[var], 50)

# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,substrRight(gLevel1B[var], 50)))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,substrRight(gLevel2A[var], 50)))
gedilevel2b<-readLevel2B(level2Bpath = paste0(outdir,substrRight(gLevel2B[var], 50)))
##### read 
# "GEDI02_B_2019157014400_O02721_T02484_02_001_01.h5"  ###too less
# "GEDI02_B_2019180075351_O03082_T00826_02_001_01.h5"  ###too less



# "GEDI02_B_2019220155440_O03708_T05095_02_001_01.h5"  ## good region, but data Elevation not right
# "GEDI02_B_2019336024706_O05499_T03754_02_001_01.h5"  ## good coverage!!!
# "GEDI02_B_2020171105517_O08605_T02249_02_001_01.h5"  ## too less
# "GEDI02_B_2020181152926_O08763_T00908_02_001_01.h5"  ## only half 
#gedilevel2b<-readLevel2B(level2Bpath = paste0(outdir,"\\GEDI02_B_2020171105517_O08605_T02249_02_001_01.h5"))


paste("/Clip", substrRight(gLevel1B[33], 49), sep="_")

#clip 
clipLevel1B(gedilevel1b,ul_lon,lr_lon,lr_lat,ul_lat, output=paste0(outdir,paste("/Clip", substrRight(gLevel1B[var], 49), sep="_")))
clipLevel2A(gedilevel2a,ul_lon,lr_lon,lr_lat,ul_lat, output=paste0(outdir,paste("/Clip", substrRight(gLevel2A[var], 49), sep="_")))
clipLevel2B(gedilevel2b,ul_lon,lr_lon,lr_lat,ul_lat, output=paste0(outdir,paste("/Clip", substrRight(gLevel2B[var], 49), sep="_")))



close(gedilevel1b)
close(gedilevel2a)
close(gedilevel2b)

## remove large raw data
file.remove(substrRight(gLevel1B[var], 49))
file.remove(substrRight(gLevel2A[var], 49))
file.remove(substrRight(gLevel2B[var], 49))

}



