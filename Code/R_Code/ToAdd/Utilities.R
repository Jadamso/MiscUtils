#### Jordan  Adamson ####
#########################
#       R Commands      #
#########################
library(reshape2)   # Melting and Casting Data
library(plyr)       # Frequency Plot
library(pryr)       # object_size
#library(devtools)   # All Battles Plot
library(operators)  # %!in% command
library(data.table) # Indexing and Expanding Data Frames

#-------------------------------------------------------------------
#exit <- function() { quit("yes") }
#pwd  <- getwd()
#off  <- function() {
#	rgl.close()
#	dev.off()}

#-------------------------------------------------------------------
# operators::`%!in%`
#`%!in%` <- function (x, table) { !x %in% table }

#-------------------------------------------------------------------
# Alarm
ALARM <- compiler::cmpfun( function(j.0=1, j.1=1){
	i.0 <- 0
	while(i.0 <=j.0){
		system("echo \"Regression Finished\"|espeak")
		i.0=i.0 +1
	}
	i.1 <- 0
	while(i.1 <=j.1){
		cat("\a")
		i.1=i.1 +1
	}
})


