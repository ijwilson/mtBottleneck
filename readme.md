# Estimating the mtDNA Bottleneck

This contains code that was used to analyse the mitochondrial bottleneck 
in the paper by Wilson ... & Chinnery.  

## Prerequisites

To run the code in this directory you need [JAGS](http://mcmc-jags.sourceforge.net/), [R](https://cran.r-project.org/) and the R packages [coda](https://cran.r-project.org/web/packages/coda/index.html ) and [rjags](https://cran.r-project.org/web/packages/rjags/index.html). 



## Data Structure

### Example Data


## R Code

The file [prepareSimData.R](R/prepareSimData.R) is code to simulate some very simple data for a mitochondrial bottleneck.  

These data can be analysed for a dataset containing the proband by sourcing the file betamodel_Proband.R from within R.  If the prerequisites are installed the output should eventually look like 

```
> source("R/betamodel_Proband.R")
We have simulated 3285 potential samples, taking the first 100
Linked to JAGS 4.0.0
Loaded modules: basemod,bugs
Compiling model graph
   Resolving undeclared variables
   Allocating nodes
Graph information:
   Observed stochastic nodes: 200
   Unobserved stochastic nodes: 204
   Total graph size: 2121

Initializing model

  |++++++++++++++++++++++++++++++++++++++++++++++++++| 100%
  |**************************************************| 100%
  |****                                              |   8%

```

This saves a file with the output 

Note that the initial analysis was done under JAGS 3.3.0.  A new version of JAGS produces identical results.





### Code to drive jags


## JAGS Code

JAGS (Just another Gibbs Sampler) is ...
