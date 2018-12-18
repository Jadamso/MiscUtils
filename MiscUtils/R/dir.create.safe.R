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

#------------------------------------------------------------------
##################
#' Old Devtools setup
##################
#' @export

setup0 <- compiler::cmpfun( function(
    path = ".", description = getOption("devtools.desc"), 
    check = FALSE, rstudio = TRUE, quiet = FALSE) 
{

    devtools:::check_package_name(path)
    parent_dir <- normalizePath(dirname(path), winslash = "/", 
        mustWork = TRUE)
    if (!quiet) {
        message("Creating package '",basename(normalizePath(path)),
            "' in '", parent_dir, "'")
    }
    dir.create(file.path(path, "R"), showWarnings = FALSE)
    ##usethis:::use_description
    devtools::create_description(path,
        extra = description, quiet = quiet)
    devtools:::create_namespace(path)
    if (rstudio) 
        devtools::use_rstudio(path)
    if (check) 
        check(path)
    invisible(TRUE)
})



#------------------------------------------------------------------
##################
#' Old Devtools create_package
################## 
#' @export

create_package0 <- compiler::cmpfun( function(
    path, description = getOption("devtools.desc"),
    check = FALSE, rstudio = TRUE, quiet = FALSE)
{

    devtools:::check_package_name(path)
    parent_dir <- normalizePath(dirname(path), winslash = "/", 
        mustWork = FALSE)
    if (!file.exists(parent_dir)) {
        stop("Parent directory '", parent_dir, "' does not exist", 
            call. = FALSE)
    }
    if (!file.exists(path)) {
        if (!dir.create(path)) {
            stop("Failed to create package directory '", basename(path), 
                "'", call. = FALSE)
        }
    }
    files <- list.files(path)
    if (length(files)) {
        valid <- length(files) == 1 && tools::file_ext(files) == 
            "Rproj"
        if (!valid) {
            stop("Directory exists and is not empty", call. = FALSE)
        }
    }
    path <- normalizePath(path, winslash = "/", mustWork = TRUE)
    setup0(path = path, description = description, rstudio = rstudio, 
        check = check, quiet = quiet)
    invisible(TRUE)
})


#------------------------------------------------------------------
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
        #usethis::create_package
        create_package0( DIR,
            my_description,
            rstudio=rstudio,
            check=check)
    } else {
        setup0( DIR,
            my_description,
            rstudio=rstudio,
            check=check)
    }
})

