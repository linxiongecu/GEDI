library(rGEDI)
library("data.table")
setwd("C:/Users/xiongl21/WorkingFolder/Postdoc/ProjectFlorida/Data/GEDI")
outdir=getwd()
##lin version 
source("3FunctionWF.R")


library(RColorBrewer)


#read shot number list
# Import the data and look at the first six rows
#read large number use 'character'

test <- read.csv(file = 'FilterByClass/flamingo.csv', colClasses = "character")
test <- read.csv(file = 'FilterByClass/IntermediateClass.csv', colClasses = "character")
test <- read.csv(file = 'FilterByClass/SRS5_High.csv', colClasses = "character")
head(test$sht_nmb)


shot_number<- paste0(test$sht_nmb)
####
shot_number<- c("54990318800217643")

shot_len=length(shot_number)

# set the colour palette
#cols <- brewer.pal(shot_len,'Set2')

dev.new()
for(sn in seq(1, shot_len, 1)){
#for (sn in 1:shot_len) {

orbitnumber=substr(toString(shot_number[sn]), 1, 4)
print(paste("Number of Shots: ",sn))
print(paste("Shot Number: ",shot_number[sn]))
## output name list
filelist_1B <- list.files(pattern="^Clip_GEDI01_B*")
filelist_2A <- list.files(pattern="^Clip_GEDI02_A*")
for(var in 1:length(filelist_1B))
{
  ###find if the filename contain the orbitnumber
  if (grepl(orbitnumber, filelist_1B[var]) ) 
    
  {    
    currentfile_1B=filelist_1B[var]
    currentfile_2A=filelist_2A[var]
  }
}
print(paste("Read file: ",currentfile_1B))

gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir, "/", currentfile_1B))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir, "/", currentfile_2A))
##elevation_bin0"
level1bGeo<-getLevel1BGeo(level1b=gedilevel1b,select=c("digital_elevation_model", "stale_return_flag","degrade","elevation_bin0"))
head(level1bGeo)

#########SRS6
# Extracting GEDI full-waveform for a giving shotnumber
wf <- getLevel1BWF(gedilevel1b, shot_number=shot_number[sn])
#jpeg("figFullWaveform.jpg", width = 8, height = 6, units = 'in', res = 300)
#par(mfrow = c(2,1), mar=c(4,4,1,1), cex.axis = 1.5)


#plot(wf, relative=FALSE, polygon=TRUE, type="l", lwd=2, col="forestgreen",
#     xlab="Waveform Amplitude", ylab="Elevation (m)")
#grid()
#par(mfrow=c(1,1))
par(new = TRUE)
plot(wf, relative=FALSE, polygon=FALSE, type="l", lwd=1, col="black",
     xlab="Waveform Amplitude (%)", ylab="Elevation (m)", ylim=c(-30,0), xlim=c(200,350))
#grid()
# second plot  EDIT: needs to have same ylim


}
