#-------------------------------------------------------------------
##################
#' Trim Whitespace from a String
################## 
#' @param x a vector
#' @param blank the blank value to be replaced by the row above
#' @return a vector
#' @examples fill_above( c("A", "C", "", "B") , blank="")
#' @export
#  http://stackoverflow.com/questions/10554741/r-fill-in-data-frame-with-values-from-rows-above
fill_above <- compiler::cmpfun( function(x, blank = is.na) {

  # Find the values
  if (is.function(blank)) {
    isnotblank <- !blank(x)
  } else {
    isnotblank <- x != blank
  }

  # Fill down
  xfill <- cumsum(isnotblank) 
  xfill[ xfill == 0 ] <- NA

  # Replace Blanks
  xnew <- x[ which(isnotblank) ][ xfill ]
  xnew[is.na(xnew)] <- blank

  return(xnew)
})


#zoo::na.locf(GovExpBin$X)
