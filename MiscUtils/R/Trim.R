#------------------------------------------------------------------
##################
# Helper Functions
################## 

#' returns string without leading whitespace
#' @param x A character string
#' @export
trim.leading <- compiler::cmpfun(function(x)  gsub("^\\s+", "", x))

#' returns string without trailing whitespace
#' @param x A character string
#' @export
trim.trailing <- compiler::cmpfun(function(x) gsub("\\s+$", "", x))

#' returns string without leading or trailing whitespace
#' @param x A character string
#' @export
trim.all <- compiler::cmpfun(function(x) gsub("^\\s+|\\s+$", "", x))


#------------------------------------------------------------------
##################
#' Trim Whitespace from a String
################## 
#' @param x A character string
#' @param strip the whitespace to be removed: trailing, leading, or both
#' @return A character string
#' @examples trim( " AA   ")
#' @export
trim <- compiler::cmpfun( function(x, strip="all"){
	if(strip=="all") {
		trim.all(x)
	} else if(strip=="leading") {
		trim.leading(x)
	} else if(strip=="trailing") {
		trim.trailing(x)
	} else{ message("strip != leading, trailing, all")}
})
