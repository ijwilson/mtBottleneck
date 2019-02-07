

getMotherDaughters <- function(nfamilies, b, d, betapars, noffspring=3) {
  het_mother <- rbeta(nfamilies, betapars[1], betapars[2])  
  alpha <- het_mother*b/(1-b)
  beta <- (1-het_mother)*b/(1-b)
  daughters <- matrix(rbeta(noffspring*nfamilies, alpha, beta), ncol=noffspring)
  pselected <- (daughters[,1]-d[1])/(d[2]-d[1])
  proband <- runif(nfamilies) < pselected
  motherproband <- runif(nfamilies) < (het_mother-d[1])/(d[2]-d[1])
  list(het_mother=het_mother, het_daughters=daughters, proband=proband, motherproband = motherproband)
}


aa <- getMotherDaughters(40000, b=b, d=c(0.3, 0.7), betapars=c(1, 4))

ss <- min(sum(aa$motherproband==TRUE), sum(aa$proband==TRUE&aa$motherproband==FALSE), 100)
if (ss<100) {
  cat("problem with first data set\n")
  cat("we only have sample size of",ss)
}  else {
  cat("We have simulated", min(sum(aa$motherproband==TRUE),sum(aa$proband==TRUE)),"potential samples, taking the first 100\n")
}
## convert into three data sets each with 100 individuals
simMotherData <- list(parent = aa$het_mother[aa$motherproband==TRUE][1:ss]
                      ,off = aa$het_daughters[aa$motherproband==TRUE,][1:ss,]
                      ,N = rep(3,ss)
                      ,NFam=ss
                      ,mutation=rep(1,ss)
                      ,Nmuts=1)

simProbandData <- list(parent = aa$het_mother[aa$proband==TRUE&aa$motherproband==FALSE][1:ss]
                       ,off = aa$het_daughters[aa$proband==TRUE&aa$motherproband==FALSE,1,drop=FALSE][1:ss,,drop=FALSE]
                      ,N = rep(1,ss)
                       ,NFam=ss
                       ,mutation=rep(1,ss)
                       ,Nmuts=1)
  
simSiblingData   <- list(parent = aa$het_mother[aa$proband==TRUE&aa$motherproband==FALSE][1:ss]
                         ,off = aa$het_daughters[aa$proband==TRUE&aa$motherproband==FALSE,2:3][1:ss,]
                         ,N = rep(2,ss)
                         ,NFam=ss
                         ,mutation=rep(1,ss)
                         ,Nmuts=1)

rm(aa)
