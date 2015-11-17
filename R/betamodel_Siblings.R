basedir <- ".."
b <- 0.7

source(file.path(basedir,"R","prepareSimData.R"))
library(coda)
library(rjags)

modelfile <- paste(basedir,"JAGSmodels/mutbeta.jag",sep="/")
model.jags <- jags.model(modelfile,data=simSiblingData,n.chain=2)
update(model.jags, n.iter=10000)                                    # burn in 
betaresSib <- coda.samples(model.jags, c("sigmam","b"), n.iter=200000,thin=20)
save(betaresSib, file=paste("betaresSib", b, ".rda", sep=""))

