#### Jordan  Adamson ####
#########################
#      R Libraries      #
#########################

# JIT compilation
library(compiler)  
invisible( compilePKGS("TRUE") )
#invisible( enableJIT(2) ) 
message( "if Error: R --vanilla --no-save" )

## for Source R
#options(repos = c(CRAN = "http://cran.revolutionanalytics.com") )

## Make sure: chmod -R a+w ~/lib64/R/library

message("https://www.r-bloggers.com/updating-r/")

#------------------------------------------------------------------
##################
# Install Packages
################## 


message(" I've assumed .libPaths()[1] is the path I want everything installed into")

# List all previous packages
pack_old <- function(){
    path         <- tail(.libPaths(),1) #"~/R/x86_64-pc-linux-gnu-library/3.2" ~/lib64/R/library
    package_df   <- as.data.frame(installed.packages( path ))
    package_list <- as.character(package_df$Package)
}

## List all new Packages
pack_new <- function(){
    #package_df_new   <- as.data.frame(installed.packages("~/R/x86_64-pc-linux-gnu-library/3.3"))
    path         <- head(.libPaths(),1) #"~/R/x86_64-pc-linux-gnu-library/3.2" ~/lib64/R/library
    package_df   <- as.data.frame(installed.packages( path ))
    package_list <- as.character(package_df$Package)
}


pack_old2 <- function(vers="3.3.3"){
    path       <- head(.libPaths(),1)
    package_df <- as.data.frame(installed.packages( path ))
    rid        <- which( package_df$Built != vers )
    pack_list  <- package_df[rid, "Package"]
}


packs_list_diff <- function(old, new) {
    setdiff( old, new)
}


### Install not-new Packages
pack_install <- function(packs_list){
    sapply(packs_list, 
        install.packages,  dependencies= TRUE)
}
## Install All Packages
# invisible(sapply(package_list, install.packages, dependencies= TRUE))

## Load Installed Packages, in chunks
# invisible(lapply(package_list, library, character.only = TRUE, logical.return=TRUE) )
# lpacks <- (.packages())
# DLL <- getLoadedDLLs()
# utils::sessionInfo()

#------------------------------------------------------------------
##################
# create an exportable list of packages
################## 

ff <- function(filename=NA){
    FILES <- as.data.frame(installed.packages(  ))
    FF <- FILES$Package
    if(is.na(filename)){
        cat( paste0("\'",FF, "\', \n") )
        return(FF)
    } else {
        writeLines(FF, filename)
    }
}

 

FF <- FILES[FILES$Built != '3.4.0',]$Package
    pack_install( FF )


# OpenBUGS 3.2.2 or later not found.
# jags
pack_old3 <- function(n=100){
    system( paste0("ls -lhtcr | head -",n," | awk '{print $NF}' > /tmp/tempLibs.R") )
}

#------------------------------------------------------------------
##################
# To Install new packages
################## 

# listed in "~/Desktop/Common/R_Code/Libs.R

update_packs <- function( updatefile="~/Desktop/Common/R_Code/Libs.R"){
    hh <- readLines( updatefile )
    gg <- pack_old()
    gh <- packs_list_diff(hh , gg)
    pack_install( gh )
}


## Attempt to load a set of 50 packages
f <- function(i=0){
    #source("~/Desktop/Common/R_Code/Libs.R")
    hh <- readLines("~/Desktop/Common/R_Code/Libs.R")
    ii <- 1:50 + i
    hi <- hh[ii]
    HH <- lapply(hi, library, character.only = TRUE, logical.return=TRUE)
    hi[ HH==FALSE]
}
# lapply(f(400), install.packages, dependencies=TRUE)




## To install all packages in current head(.libPaths(),1)
pack_install( ff() )

message("update ~.Rprofile")


install.packages( 
    lib  = lib <- .libPaths()[1],
    pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package,
    type = 'source'
)


#------------------------------------------------------------------
##################
# Notes
################## 


# needs BIGMEM
# install.packages( c("proj4", rgdal") )


## Color R output installed manually
#download.file("http://www.lepem.ufc.br/jaa/vimr/colorout_1.1-1.tar.gz", destfile = "colorout_1.1-1.tar.gz")
#install.packages("colorout_1.1-1.tar.gz", type = "source", repos = NULL)## setOutputColors256()
devtools::install_github("jalvesaq/colorout")


## nloptr does not work
#http://ab-initio.mit.edu/nlopt/nlopt-2.4.2.tar.gz


## When not available for latest version of R.
## install.packages("https://cran.r-project.org/src/contrib/glamlasso_1.0.tar.gz", repos = NULL, type="source")
## install.packages("https://cran.r-project.org/src/contrib/tensr_1.0.0.tar.gz", repos = NULL, type="source")

#------------------------------------------------------------------
##################
# for Microsoft Revolution R
################## 

#repos.date   <- "2016-05-04" # Sys.Date()
#options(repos = c(CRAN = paste0("http://mran.revolutionanalytics.com/snapshot/",repos.date)))

#system("R CMD javareconf")
#R -q -e 'install.packages("PerformanceAnalytics")'
