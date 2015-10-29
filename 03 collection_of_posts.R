library(Rfacebook)
library(rvest)
temp_token<-"CAACEdEose0cBAFSCguDOBnIuwsjcvTAuYPHZAJw6hkKIUU5YVjcPKdVJj54O8r7yGVX7J3kwe6jbZBKiZCPqKUWeFtSJNPw07sZC9WMuhYt86uJBP772baUW2QhbaaIFZBu8buEHhzSNQOocZArzG1uAGZC4FUPgjLjCPJ0ILCZAaka6qqgrBdC1iZAW4KZARs9LZB4nyyZAQdrrDeLltRAg82GL"
#get this token from https://developers.facebook.com/tools/explorer/

n<-11

fb_page<-getPage(page='topyaps',token=temp_token,n)
#getPost returns a list with three components: post, likes, and comments.
#First, post contains information about the post: author, creation date, id, counts of likes, comments, and shares, etc. 
#Second, likes is a data frame that contains names and Facebook IDs of all the users that liked the post. 
#Finally, comments is a data frame with information about the comments to the post (author, message, creation time, id).


#what is done below??? read here: http://stackoverflow.com/questions/20689650/how-to-append-rows-to-an-r-data-frame
#data frame is created and then values are filled up
#understand data frames:http://www.r-statistics.com/2011/12/data-frame-objects-in-r-via-r-in-action/
post_id<-character(n) #check below using typeof() function
post_likes<-double(n)
post_link<-character(n)
title<-character(n)

for (i in 1:n){

  page_post<-getPost(post=fb_page$id[i],token = temp_token)
  post_id[i]<-page_post$post$id
  post_likes[i]<-page_post$post$likes_count
  link<-page_post$post$link
  ##########
  ##here web scraping is done. check details in file simple_web_scrapping.R
  url<-read_html(link)
  title[i]<-url %>% html_node("head") %>% html_node("title") %>% html_text()
  ##########
  post_link[i]<-link
  
}
df<-data.frame(post_id,post_likes,post_link,title,stringsAsFactors = F)
View(df)


#now converting data frame into excel sheet

library ("xlsx")
write.xlsx(df,"test.excelfile.xlsx","testsheet")





#typeof(post_likes)
#print(post_id)
#print(post_likes)



###############################
#post_likes<-page_post$likes
###############################
#post_likes may be NULL as there might be no 'likes' for the post
#difference in between NULL and EMPTY dataframes:
#####EMPTY data frame exists but NULL data frame doesn't exists
#####is.data.frame(example_data_frame) will return TRUE even if it is empty and FALSE if it is NULL
#It is common for programming languages to have a NULL value. 
#NULL can have two distinct meanings.  In the first, NULL is used to represent missing or undefined values.
#In the second case, NULL is the logical representation a statement that is neither TRUE nor FALSE.  
#This indeterminacy is the basis for ternary logic.
#When missing values (the first meaning) are evaluated, the desired result is often an ambiguous result (the second). 
#That is, the former implies the latter.  
#In programming, the distinction is often unnecessary and glossed over and the concepts become confounded.
#############################
