#-------------------------------------------------------------------
##################
#' Which list elements are NA
################## 
#'
#' @param LIST list
#' @return vector indicating which elements are not na
#'
# @examples 
#' @export

list_nas <- compiler::cmpfun( function(LIST){
    incl <- sapply(LIST, function(eq){!is.na(eq[[1]][[1]]) })
    return(incl)
})



#-------------------------------------------------------------------
##################
#' Indicating Even or Odd
################## 
#'
#' @param x 
#' @return which elements are even
#'
# @examples 
#' @export

is.even <- compiler::cmpfun( function(x){ x %% 2 == 0 } )

#' @rdname is.even
#' @export
is.odd  <- compiler::cmpfun( function(x){ x %% 2 != 0 } )

