basedir <- paste(normalizePath("~"),"IHG/projects/bottle",sep="/")

bvec <- c(0.4,0.7,0.9)
args = commandArgs(TRUE)
b=bvec[as.integer(args[1])]

source(paste(basedir,"R/prepareSimData.R",sep="/"))
library(coda)
library(rjags)

modelfile <- paste(basedir,"JAGSmodels/mutbeta.jag",sep="/")
model.jags <- jags.model(modelfile,data=simSiblingData,n.chain=2)
update(model.jags,n.iter=10000)                                    # burn in 
betaresSib <- coda.samples(model.jags,c("sigmam","b"),n.iter=200000,thin=20)
save(betaresSib,file=paste("betaresSib",b,".rda",sep=""))
q("no")
