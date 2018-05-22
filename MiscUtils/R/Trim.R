#------------------------------------------------------------------
##################
# Helper Functions
################## 

#' returns string without leading whitespace
#' @param x A character string
#' @param s,r alternative replacement character
#' @export
#trim.leading <- compiler::cmpfun(function(x,s="")  gsub("^\\s+", s, x))
trim.leading <- compiler::cmpfun(function(x,r='\\s',s="") gsub(paste0("^",r,"+"), s, x))

#' returns string without trailing whitespace
#' @param x A character string
#' @param s,r alternative replacement character
#' @export
#trim.trailing <- compiler::cmpfun(function(x,s="") gsub("\\s+$", s, x))
trim.trailing <- compiler::cmpfun(function(x,r='\\s',s="") gsub(paste0("",r,"+$"), s, x))

#' returns string without leading or trailing whitespace
#' @param x A character string
#' @param s,r alternative replacement character
#' @export
#trim.all <- compiler::cmpfun(function(x,s="") gsub("^\\s+|\\s+$", s, x))
trim.all <- compiler::cmpfun(function(x,r='\\s',s="") gsub( paste0("^",r,"+|",r,"+$"), s, x))



#------------------------------------------------------------------
##################
#' Trim Whitespace from a String
################## 
#' @param x A character string
#' @param strip the whitespace to be removed: 'trailing', 'leading', or 'all'
#' @param s,r alternative replacement character
#' @examples trim( " AA   ")
#' @export
trim <- compiler::cmpfun( function(x, r='\\s', s="",strip="all"){
	if(strip=="all") {
        trim.all(x, s)
	} else if(strip=="leading") {
		trim.leading(x,s)
	} else if(strip=="trailing") {
		trim.trailing(x,s)
	} else{ message("strip != leading, trailing, all")}
})

