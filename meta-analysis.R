library(readxl)
library(meta)     ## example data-set

# Load data set from meta
DATA <- #read_xlsx("data/RHI influences Pain.xlsx", sheet = "RHI influence on Pain")
  read.csv2("data/RHI influences Pain.csv")

DATA <- DATA[order(DATA$ID),]

meta_mdl01 <- rma(yi = abs(DATA$Hedges), vi = DATA$VAR_hedges, 
                method="FE", measure = "SMD" )
summary(meta_mdl01)

meta_mdl02 <- rma(yi = abs(DATA$Hedges), vi = DATA$VAR_hedges, 
                method="REML", measure = "SMD" )
summary(meta_mdl02)

meta_mdl03 <- rma(yi = abs(DATA$Hedges), vi = DATA$VAR_hedges,
                method="REML", measure = "SMD", mods = ~ DATA$ID )
summary(meta_mdl03)

meta_mdl04 <- rma(yi = abs(DATA$Hedges), vi = DATA$VAR_hedges,
                method="HE", measure = "SMD", mods = ~ DATA$ID )
summary(meta_mdl04)

meta_mdl05 <- rma(yi = abs(DATA$Hedges), vi = DATA$VAR_hedges,
                method="REML", measure = "SMD", mods = ~ 0 + DATA$ID )
summary(meta_mdl05)

confint(meta_mdl03)

funnel(meta_mdl03)

forest(meta_mdl03, addpred = TRUE, showweights = TRUE)

forest(meta_mdl03, addpred=TRUE, xlim=c(-8,7), at=seq(-3,2,by=1), shade=TRUE,
       cex=0.75, header="Study ID",
       ilab=cbind(round(DATA$Hedges,2), round(DATA$VAR_hedges,2)), ilab.xpos=c(-6, -4.5),
       ilab.lab=c("Hedges' g", "St. Err."),
       slab = DATA$ID)


