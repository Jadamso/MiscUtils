#------------------------------------------------------------------
##################
#' Parallel Setup
################## 
#' 
#' @param cores number of cores to use
#'
#' @return cores
#' 
# @details
# @examples
#'  
#' @export

#library(pnmath)   # MultiCore Functions
#library(RevoUtilsMath)


mc_setup <- compiler::cmpfun( function( cores=NA ){

    requireNamespace("parallel")  # Parallel Processing
    requireNamespace("doMC")      # Do MultiCore Processing
    requireNamespace("foreach")   # Parallel Processing Loop

    if( is.na(cores) ) {
        cores <- as.numeric(system("nproc", intern=TRUE))
    }
    
    ### Explicit Multi-Core Parameters
    try(setMKLthreads(1), silent=TRUE)
    doMC::registerDoMC(cores)
    options("mc.cores"=cores)
    options("Ncpus"=cores)
    
    print("\n MultiCore Setup")
    message("doMC=", foreach::getDoParRegistered())
    message("mc.cores=", foreach::getDoParWorkers() )
    #getDoParName()
    #getDoParVersion()

    getOption("cl.cores")
    
    return(cores)
})
