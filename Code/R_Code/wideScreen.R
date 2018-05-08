#------------------------------------------------------------------
#########################
#' Format Terminal Viewing Screen 
#########################
#' @param howWide,howTall number of terminal columns and rows
# @return a vector
# @examples
# @details
#' @export

wideScreen <- compiler::cmpfun( function( 
        howWide=Sys.getenv("COLUMNS"),
        howTall=Sys.getenv("LINES"),
        tt=FALSE
) {
        if(tt){
            Wide <- as.integer(howTall)*2
            Tall <- as.integer(howWide)
        } else {
            Wide <- as.integer(howWide)
            Tall <- as.integer(howTall)*2
        }
        options(width=Wide, height=Tall)
        message(paste0(
            "width=",Wide,", ",
            "height=",Tall) )
})
