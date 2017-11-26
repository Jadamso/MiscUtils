#-------------------------------------------------------------------
##################
#' Upload Package
################## 
#' @param pdir a directory
#' @return Nothing
#
# @examples
#' @export

pack_up <- compiler::cmpfun( function(pdir){

    message( pdir, " is required to already be on github")

    #"git add . && git ci && git push"
    repo <- git2r::repository(pdir)
    git2r::add(repo, ".")
    git2r::commit(repo, "new R commit")
    #cred <- cred_token(token = "GITHUB_PAT")
    #push(repo, credentials=cred)
    system( paste0("cd ", pdir, "&& git push"))
    
    return(pdir)

})


