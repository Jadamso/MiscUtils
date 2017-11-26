#########################
# R Commands
#########################
library(XML) ##readHTMLTable
library(rvest)
library(scholar)
#------------------------------------------------------------------

#  Publish or Perish
## download and install on windows, http://www.harzing.com/popbook/ch13_2_4.htm
## can only see top 1000 most cited articles which cite the root article. 
## this is because Google limits number of results to 1000.




#------------------------------------------------------------------
# Scrape Google Scholar

#https://raw.githubusercontent.com/gimoya/theBioBucket-Archives/master/R/Functions/GScholarScraper_3.2.R

#http://biostat.jhsph.edu/~jleek/code/googleCite.r

#------------------------------------------------------------------
# Scrape Google Scholar

#http://www.r-bloggers.com/google-scholar-scraping-with-rvest-package/


site <- "https://scholar.google.com/citations"
user <- "JDtL6NIAAAAJ"
page <- read_html( paste0(site, "?user=", user, "&hl=en")) ## tiebout


## Citations Per Paper
citations <- page %>% html_nodes ("#gsc_a_b .gsc_a_c") %>% html_text()%>%as.numeric()
barplot(citations, main="Citations Per Paper", ylab='Number of Citations', xlab="Paper ID")

## Coauthors Per Paper
page <- read_html( paste0(site, "?view_op=list_colleagues&hl=en&user=", user) )
Coauthors = page%>% html_nodes(css=".gsc_1usr_name a") %>% html_text()
Coauthors = as.data.frame(Coauthors)
names(Coauthors)='Coauthors'


#------------------------------------------------------------------
user <- "JDtL6NIAAAAJ"
papers <- get_publications(user)
article <- papers[1,]
cids <- article$cid


## updated scholar::get_article_cite_history
article_hist <- function (id, article) {
    pubid <- article$pubid
    cids <- article$cid
    id    <- tidy_id(id)

    url_base <- "http://scholar.google.com"
    url_cite <- "/citations?view_op=view_citation&hl=en&"
    url_user <- paste0( "user=", id)
    url_article <- paste0("&citation_for_view=", id,":", pubid)
    url <- paste0(url_base, url_cite, url_user, url_article)

   doc <- httr::GET(url, handle = getOption("scholar_handle")) %>% read_html()
    years <- doc %>% html_nodes(xpath = "//*/div[@id='gsc_graph_bars']/a") %>% 
        html_attr("href") %>% str_replace(".*as_yhi=(.*)$", "\\1") %>% 
        as.numeric()
    vals <- doc %>% html_nodes(xpath = "//*/span[@class='gsc_g_al']") %>% 
        html_text() %>% as.numeric()
    df <- data.frame(year = years, cites = vals)
    tmp <- merge(data.frame(year = min(years):max(years)), df, 
        all.x = TRUE)
    tmp[is.na(tmp)] <- 0
    tmp$pubid <- article
    return(tmp)
}

article_hist(user, article)


## updated scholar::get_article_cite_history
article_hist <- function (id, article) {
    pubid <- article$pubid
    cids <- article$cid
    id    <- tidy_id(id)

    url_base <- "http://scholar.google.com"
    url_bib <- "/scholar?oi=bibs&hl=en&"
    url_cid <- paste0( "cites=", cids, "&as_sdt=5")
    url <- paste0(url_base, url_bib, url_cid)

   doc <- httr::GET(url, handle = getOption("scholar_handle")) %>% read_html()
    years <- doc %>% html_nodes(xpath = "//*/div[@id='gsc_graph_bars']/a") %>% 
        html_attr("href") %>% str_replace(".*as_yhi=(.*)$", "\\1") %>% 
        as.numeric()
    vals <- doc %>% html_nodes(xpath = "//*/span[@class='gsc_g_al']") %>% 
        html_text() %>% as.numeric()
    df <- data.frame(year = years, cites = vals)
    tmp <- merge(data.frame(year = min(years):max(years)), df, 
        all.x = TRUE)
    tmp[is.na(tmp)] <- 0
    tmp$pubid <- article
    return(tmp)
}

page <- read_html( url) ## tiebout

doc %>% html_nodes(xpath = "//*/div[@id='gsc_graph_bars']/a") 
    years <- doc %>% html_nodes(xpath = "//*/div[@id='gsc_graph_bars']/a") %>% 


page_text <- html_text(page)
page_attr <- html_attr(page)

#------------------------------------------------------------------
# Scrape JSTOR

## JSTORE database
#http://dfr.jstor.org/
#
#http://dfr.jstor.org/?cs=any%3Aa+pure+theory+of+local+expenditure|reftext%3A%28a+pure+theory+of+local+expenditure%29^1.0&fs=rtm1&view=text&cc=any%3Aa+pure+theory+of+local+expenditure




