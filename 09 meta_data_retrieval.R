library(rvest)


load("/home/chillbill/Desktop/rfacebook_datamining/data.Rda")
#### @@@@@ ^^^^ GO TO SCRIPT::: 06 extract_n_posts_from_a_page.R @line where resultant data frame 'df' is saved as 'data.Rda'
#### @@@@@ ^^^^ here as the 'load' function is called on Rda object, it recreates the original dataframe which could be used further

links_to_extract<-df$post_link
# str(links_to_extract)
###@@@@ here links_to_extract is a cloumn vector with 'chr' elements
# structure of an R object is determined by the function str()
# str(mydata)
#str(links_to_extract[1])
no_of_links <-length(links_to_extract)
# no_of_links is an int
#keywords<-character(no_of_links)
#authors<-character(no_of_links)
title<-character(no_of_links)



for (i in 1:no_of_links){
  
   url<-read_html(links_to_extract[i])
   m<-html_nodes(url, "title") %>% html_text()
   n<-m[1]
   if( (length(n)==0) && (typeof(n)=="character") ) {
     title[i]<-NA
   }  else {
     title[i]<-n
   }
   print(i)
  #Sys.sleep(10)

  
  
  ##############  BELOW IS THE CODE FOR RETREIVING METADATA FROM THE WEBSITE #####
  
 
  
  # HERE p MAY BE a character vector of "zero" length IN CASE NO DECRIPTION IS MENTIONED IN THE POST
  # We can create an empty string with empty_str = "" or an empty character vector with empty_chr = character(0). 
  # Both have class “character” but the empty string has length equal to 1 while the empty character vector has length equal to zero.
  # HERE THIS KIND OF RETURN WILL GIVE AN ERROR 
  # TO CHECK FOR SUCH SITUATIONS: USE INCREASING VALUE OF n  
  # >
  # >  print(p)
  # how to deal with character(0)  
  
#    p<-html_nodes(url,"meta[name=author]") %>% html_attr("content")
#    if( (length(p)==0) && (typeof(p)=="character") ) {
#      authors[i]<-NA
#    }  else {
#      authors[i]<-p
#    }
#   
#    q<-html_nodes(url,"meta[name=keywords]") %>% html_attr("content")
#    if( (length(q)==0) && (typeof(q)=="character") ) {
#      keywords[i]<-NA
#    }  else {
#      keywords[i]<-q
#    }
#    
#   
  
  
}

df1<-data.frame(title,stringsAsFactors = F)
View(df1)

#library ("xlsx")
#write.xlsx(df,"test.excelfile.xlsx","testsheet")