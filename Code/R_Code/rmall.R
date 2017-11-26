#-------------------------------------------------------------------
##################
#' remove all objects
################## 
#'
#' @param ENVIR environmnet to remove from
#' @param LIST strings to remove
#' @param EXCEPT vector of strings for any exceptions to keep
#'
#' @return nothing
#'
# @examples 
#' @export

rmall <- compiler::cmpfun( function(
    ENVIR=globalenv(),
    LIST=ls(envir=ENVIR),
    EXCEPT=NULL
){
    if( !is.null(EXCEPT) ){
        LIST <- setdiff(LIST, EXCEPT)
    }
   
    rm(list=LIST, envir=ENVIR)
})

