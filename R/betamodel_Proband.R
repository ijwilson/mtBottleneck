basedir <- "."
b <- 0.7

source(file.path(basedir,"R","prepareSimData.R"))
require(coda)
require(rjags)


modelfile <- paste(basedir,"jags/mutbeta.jag",sep="/")

model.jags <- jags.model(modelfile, data=simProbandData, n.chain=2)
update(model.jags,n.iter=10000)                               ## burn in 
betaresProband <- coda.samples(model.jags, c("sigmam", "b"), n.iter=20000, thin=20)
plot(betaresProband)


model.jags <- jags.model(modelfile, data=simSiblingData, n.chain=2)
update(model.jags,n.iter=10000)                               ## burn in 
betaresSibling <- coda.samples(model.jags, c("sigmam", "b"), n.iter=20000, thin=20)

model.jags <- jags.model(modelfile, data=simMotherData, n.chain=2)
update(model.jags,n.iter=10000)                               ## burn in 
betaresMother <- coda.samples(model.jags, c("sigmam", "b"), n.iter=20000, thin=20)


save(betaresProband, betaresMother, betaresSibling, file=paste("betares", b, ".rda", sep=""))


plot(betaresProband)
