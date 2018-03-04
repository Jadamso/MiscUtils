# MiscUtils


## To install latest release from Github: 

    #install.packages("devtools")
    devtools::install_github("Jadamso/MiscUtils",subdir="MiscUtils")
    citation("MiscUtils")

    R -e 'devtools::install_github("Jadamso/MiscUtils",subdir="MiscUtils")'


## Usage Notes

Make an R-package MYPACK with the structure 


MYPACK\
  ├── Code\
  │   ├── PackageSetup.R
  │   ├── Make.R
  │   ├── CodeSetup.R
  │   └── R_Code\ (Raw Codes)
  │       ├── Rfunction1.R
  │       └── Rfunction2.R
  └── MYPACK (R-package)

        
append `~/.bashrc` with

    alias mrp='R CMD BATCH --no-save Code/Make.R && rm Make.Rout'


Everytime I want to make a new version of the package
  * first enter the MYPACK directory `cd MYPACK`
  * delete the R-package `rm MYPACK`
  * create the package `mrp`
  
