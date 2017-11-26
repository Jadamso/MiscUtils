#-------------------------------------------------------------------
##################
#' Create A New Directory
################## 
#' @param DIR a directory
#' @return nothing
# TRUE/FALSE if created
#' @examples dir.create.safe( "/tmp/Trial" )
#' @export

dir.create.safe <- compiler::cmpfun( function( DIR ){
    if(dir.exists(DIR)==FALSE)  {
        dir.create( DIR, showWarnings=F)
    }
    
})


#-------------------------------------------------------------------
##################
#' Create A New R Package
################## 
#' @param DIR a directory
#' @return nothing
#
#' @examples dir.create.safe( "/tmp/Trial" )
#' @export

package.setup.safe <- compiler::cmpfun( function(
    DIR,
    my_description=getOption("devtools.desc"),
    rstudio=FALSE,
    check=FALSE,
    rm=FALSE)
{
    #if rm==TRUE #system( paste0("rm -rf ", pdir))  
    if(dir.exists(DIR)==FALSE)  {
        devtools::create( DIR,
            my_description,
            rstudio=rstudio,
            check=check)
    } else {
        devtools::setup( DIR,
            my_description,
            rstudio=rstudio,
            check=check)
    }
})
