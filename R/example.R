## A small example dataset

example <- list(
    NFam = 5,
    N = c(3,2,1,2,2),
    Nmuts = 2,
    mutation = c(1,1,1,2,2),
    parent = c(0.02,0.08,0.85,0.55,0.32),
    off = matrix(c(0.01, 0.13, 0.19,
                 0.01, 0.27,   NA,
                 0.58,   NA,   NA,
                 0.48, 0.52,   NA,
                 0.26, 0.31,   NA)
               , ncol=3, byrow=TRUE)
)

require(rjags)

model.jags <- jags.model("jags/mutbeta.jag", data=example, n.chain=2)
update(model.jags,n.iter=1000)                               ## burn in 
example.results <- coda.samples(model.jags, c("sigmam", "b"), n.iter=20000, thin=20)

## use the coda package to get a plot
plot(example.results)
