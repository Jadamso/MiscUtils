#------------------------------------------------------------------
##################
#' Returns Floor and Ceilings
################## 
#' @param x a numeric vector
#' @param e decimal place to round to
#' @param keepna logical keep NA values
#' @seealso
#' @export

range0 <- compiler::cmpfun( function(x, e=1, keepna=T) {

	if(!keepna){
        x <- x[!is.na(x)]
	}
	
	e <- 10^e 
	rfc <- c( floor(min(x*e)), ceiling(max(x*e)) )/e
	
	return(rfc)
})

#' @rdname range0
#' @seealso range0 ceiling00
#' @export
floor0 <- compiler::cmpfun( function(x, e=1) {
    return(floor(x*10^e)/10^e ) })

#' @rdname range0
#' @seealso range0 ceiling00
#' @export
ceiling0 <- compiler::cmpfun( function(x, e=1) {
    return(ceiling(x*10^e)/10^e ) })


#' @rdname range0
#' @export
seq0 <- compiler::cmpfun( function(x, e=1, ...){
    xr <- MiscUtils::range0(x, e)
    xs <- seq(xr[1],xr[2],...)
    return(xs)
})



#------------------------------------------------------------------
##################
#' My Color Palette
################## 
#' @param n integer number of colors
#' @export
#' @example spatstat::colourmap(mypal(20), breaks=seq(0,1,by=.05))
mypal <- compiler::cmpfun( function(n){
    colorRampPalette(c('dark red','white','dark blue'))(n)
})


#------------------------------------------------------------------
##################
#' Returns Floor and Ceilings
################## 
#' @param x a numeric vector
#' @param e decimal rounding (.25) means nearest quarters
#' @seealso
#' @export


round00 <- compiler::cmpfun( function(x, e=.25, ...){
        x <- round(x/e, ...)*e
        return(x)
        })

#' @rdname round00
#' @seealso round00 ceiling0
#' @export
ceiling00 <- compiler::cmpfun( function(x, e=.25){
        x <- ceiling(x/e)*e
        return(x)
        })

#' @rdname round00
#' @seealso round00 floor0
#' @export     
floor00 <- compiler::cmpfun( function(x, e=.25){
        x <- floor(x/e)*e
        return(x)
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
