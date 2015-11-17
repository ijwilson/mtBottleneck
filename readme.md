# Estimating the mtDNA Bottleneck

This contains code that was used to analyse the mitochondrial bottleneck 
in the manuscript 

**Mitochondrial DNA Sequence Characteristics Modulate the Size of the Genetic Bottleneck**

by __Wilson, Carling, Alston, Floros, Pyle, Hudson, Sallevelt, Lamperti, Carelli, Bindoff, Samuels1,  Wonnapinij,
  Zeviani, Taylor, Smeets, Horvath & Chinnery__.  

The contents of this can be downloaded by using 

```
git clone https://github.com/ijwilson/mtBottleneck.git
```

## Prerequisites

To run the code in this directory you need [JAGS](http://mcmc-jags.sourceforge.net/), [R](https://cran.r-project.org/) and the R packages [coda](https://cran.r-project.org/web/packages/coda/index.html ) and [rjags](https://cran.r-project.org/web/packages/rjags/index.html). 



## Data Structure

### Example Data


## R Code

### A simple simulation

The file [prepareSimData.R](R/prepareSimData.R) is code to simulate some 
very simple data for a mitochondrial bottleneck.  

These data can be analysed for a dataset containing the proband by sourcing 
the file betamodel_Proband.R from within R.  If the prerequisites are installed 
the start of the output should eventually look like 

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
  |**************************************************| 100%
  
  ...
  
```
![coda plot of MCMC output](probandplot.png)


Note that the initial analysis was done under JAGS 3.3.0.  The new version 4.0.0 of 
JAGS produces identical results.  Eventually this file should produce three simulated sets
of results for mother-child pairs that are ascertained through the mother, through the proband (child),
or through a sibling of the child.  


We can see that ascertainment through the proband produces a biased estimated of inbreeding.

![violin plot comparing three sorts of ascertainment](violin.png)


### Analysing Real data

Real data is far more difficult to work with that the idealised data produced through simulations.  


### Code to drive jags



## JAGS Code

JAGS (Just another Gibbs Sampler) is ...
