#------------------------------------------------------------------
##################
#' Returns Floor and Ceilings
################## 
#' @param x a numeric vector
#' @param e decimal rounding
#' @export

range0 <- compiler::cmpfun( function(x, e=1) {
	e <- 10^e 
	rfc <- c( floor(min(x*e)) ,  ceiling(max(x*e)) )/e
	return(rfc)
})


#------------------------------------------------------------------
##################
#' Censoring
################## 
#' @param x a numeric vector or matrix
#' @param a censor value
#' @export


censor <- compiler::cmpfun( function(x,a=0){
    x[x<a] <- a
    return(x)
})
