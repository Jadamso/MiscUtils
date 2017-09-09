#------------------------------------------------------------------
##################
#' Returns Floor and Celeings
################## 
#' @param x a numeric vector
#' @param e decimal rounding
#' @export

range0 <- compiler::cmpfun( function(x, e=1) {
	e <- 10^e 
	rfc <- c( floor(min(x*e)) ,  ceiling(max(x*e)) )/e
	return(rfc)
})

