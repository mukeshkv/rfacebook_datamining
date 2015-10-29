#read about web scraping
# http://zevross.com/blog/2015/05/19/scrape-website-data-with-the-new-r-package-rvest/
# https://cran.r-project.org/web/packages/rvest/rvest.pdf
# http://stat4701.github.io/edav/2015/04/02/rvest_tutorial/
# http://blog.rstudio.org/2014/11/24/rvest-easy-web-scraping-with-r/
# read about html meta-data here:>>>
# http://www.w3schools.com/tags/tag_meta.asp


library(rvest)
url<-read_html("http://www.scoopwhoop.com/inothernews/these-videos-show-how-fake-we-all-are/")
#below we are accessing node after node until we get the desired node and then we extract the info
###
# READ ABOUT META DESCRIPTIONS HERE
# https://moz.com/learn/seo/meta-description#title<-url %>% html_node("head") %>% html_node("title") %>% html_text()
#keywords<-html_nodes(url,"meta[name=keywords]") %>% html_attr("content") 
title<-html_nodes(url, "title") %>% html_text()
author<-html_nodes(url,"meta[name=author]") %>% html_attr("content")


#title<-html_nodes(url,"a[title]") 
#keywords
author
title



