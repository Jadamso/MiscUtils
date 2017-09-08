#########################
#' Print any system information needed for replication
#########################
# @param 
# @return a vector
# @examples
# @details
#' @export

all_info <- compiler::cmpfun( function(){

    ## Prints computer information
    Sys.info()

    ## Prints R information
    sessionInfo()

    ## Rprofile loaded every session
    readLines( paste0( R.home(), "/etc/Rprofile.site"))

    ## Renvironment loaded every session
    readLines( paste0( R.home(), "/etc/Renviron"))

})
