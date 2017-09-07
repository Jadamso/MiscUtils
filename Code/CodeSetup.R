#http://r-pkgs.had.co.nz
#https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html

#-------------------------------------------------------------------
##################
# Libraries
##################

## Imported Packages: (.packages())
rfiles <- c("devtools", "roxygen2")
for( i in rfiles) {
    devtools::use_package( i, pkg=packg)
}

#devtools::use_package( "skeleton", "Suggests", pkg=pdir)}

#install.packages("sf")
#devtools::install_github("thk686/rgdal2")

#-------------------------------------------------------------------
##################
# Add Codes
################## 

rfile0 <- c(
    "dir.create.safe.R",
    "fill_above.R",
    #"GitHub.R",
    #"LIBS.R",
    "PackageMake.R",
    "Trim.R"
    #"Utilities.R"
)

rfiles <- paste0(hmdir, "MiscUtils/", rfile0)

# Move Code
file.copy(rfiles, rdir, overwrite=T )
devtools::load_all( rdir )

# Create Code Documentation
devtools::document( pkg=packg)


