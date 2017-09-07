#-------------------------------------------------------------------
##################
# Setup 
##################
library(devtools)
library(roxygen2)
#library(MiscUtils)

hmdir <- path.expand("~/Desktop/Common/R_Code/")
pmdir <- path.expand("~/Desktop/Packages/")

source( paste0(hmdir, "MiscUtils/dir.create.safe.R"))
source( paste0(hmdir, "MiscUtils/PackageMake.R"))
#-------------------------------------------------------------------
##################
# Make 
##################

pack  <- "MiscUtils"
pdir  <- paste0(pmdir, pack,"/")
packg <- paste0(pdir, pack)

Version <- numeric_version("0.1.1")

# Setup R Package
source(paste0(pdir,"Code/PackageSetup.R") )

# Create R Package Contents
source(paste0(pdir,"Code/CodeSetup.R") )

pack_up(pdir)

#-------------------------------------------------------------------
##################
# Install 
##################

devtools::install(packg) ## Locally Works

devtools::install_github( paste0("Jadamso/",pack), subdir=pack)
## Public Package From Github Fails Often

citation(pack)

print("Done")

## source("~/Desktop/Packages/MiscUtils/Code/MiscUtils.R")

## R CMD BATCH MiscUtils.R
