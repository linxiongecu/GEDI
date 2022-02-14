###6 plot waveform
library(rGEDI)
library("data.table")
setwd("C:/Users/xiongl21/WorkingFolder/Postdoc/ProjectFlorida/Data/GEDI")
outdir=getwd()
##lin version 
source("3FunctionWF.R")

# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,"\\Clip_GEDI01_B_2019336024706_O05499_T03754_02_003_01.h5"))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,"\\Clip_GEDI02_A_2019336024706_O05499_T03754_02_001_01.h5"))
##elevation_bin0"
level1bGeo<-getLevel1BGeo(level1b=gedilevel1b,select=c("digital_elevation_model", "stale_return_flag","degrade","elevation_bin0"))
head(level1bGeo)

#####GCB Tree 7

####
shot_number<- c("54990318600217642", "54990318800217643", "54990319000217644")
dev.off()

#split.screen(c(1, 2))
for(var in 1:3)
{ 
  #screen(var)
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}


##########BW Tree###########
dev.off()
shot_number<- c("54990011900225427", "54990012100225428", "54990012300225429", "54990012500225430","54990012700225431")


#split.screen(c(1, 2))
for(var in 1:5)
{ 
  #screen(var)
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}





#########SRS6

####
shot_number<- c("54990009500226855", "54990009700226856", "54990009900226857", "54990010100226858","54990010300226859")
dev.off()

#split.screen(c(1, 2))
for(var in 1:5)
{ 
  #screen(var)
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}









#### CP10 field 
shot_number<- c("54990514400219875", "54990514600219876", "54990514800219877", "54990515000219878","54990515200219879")
dev.off()

#split.screen(c(1, 2))
for(var in 1:5)
{ 
  #screen(var)
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}

#cp20-40



shot_number<- c("54990512000219863", "54990512200219864", "54990512400219865", "54990512600219866","54990512800219867" )


for(var in 1:5)
{ 
  dev.new()
plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}


####FLM site

shot_number<- c("54990301000219840", "54990301200219841", "54990301400219842", "54990301600219843","54990301800219844" )


for(var in 1:5)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}



####WSC13 
#layer: 2019205214751_O03479_T01943

# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,"\\Clip_GEDI01_B_2019205214751_O03479_T01943_02_003_01.h5"))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,"\\Clip_GEDI02_A_2019205214751_O03479_T01943_02_001_01.h5"))


shot_number<- c("34791103100064408", "34791103300064409", "34791103500064410" )


for(var in 1:3)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}


#######wsc12
##2019260084659_O04324_T05330
# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,"\\Clip_GEDI01_B_2019260084659_O04324_T05330_02_003_01.h5"))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,"\\Clip_GEDI02_A_2019260084659_O04324_T05330_02_001_01.h5"))


#####FU Tree
shot_number<- c("43240607700637226", "43240607900637227", "43240608100637228" )


for(var in 1:3)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}



####################




shot_number<- c("43240603700638293", "43240603900638294", "43240604100638295" )


for(var in 1:3)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}



###wsc11
shot_number<- c("43240008500251270", "43240008700251271", "43240008900251272" )


for(var in 1:3)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}
####WSC08

shot_number<- c("43240817300251622", "43240817500251623", "43240817700251624" )

for(var in 1:3)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}


##############test  ###############

# Reading GEDI data
gedilevel1b<-readLevel1B(level1Bpath = paste0(outdir,"\\Clip_GEDI01_B_2019260084659_O04324_T05330_02_003_01.h5"))
gedilevel2a<-readLevel2A(level2Apath = paste0(outdir,"\\Clip_GEDI02_A_2019260084659_O04324_T05330_02_001_01.h5"))


shot_number<- c("85190200000242975")


for(var in 1:1)
{ 
  dev.new()
  plotWFMetrics(gedilevel1b, gedilevel2a, shot_number[var], rh=c(25, 50, 75, 90),main=shot_number[var])
}



