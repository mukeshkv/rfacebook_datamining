# to begin, check first, 03_collection_of_posts.R
######
start.time <- Sys.time()
######
library(Rfacebook)
library(rvest) # functions of this lib are used in metadata extraction
####READING USER INPUT DATA HERE
# ALSO CHECK 08 simple_input_from_the_screen.R
read_integer<-function(){
  n<-readline(prompt = "enter an integer value:")
  n<-as.integer(n)
  if(is.na(n)){
    n<-read_integer()
  }
  return (n)
}

read_token_from_console<-function(){
  n<-readline(prompt = "enter token value:")
  if(n==""){
    n<-read_token_from_console()
  }
  return (n)
}

read_page_name_from_console<-function(){
  n<-readline(prompt = "enter page name:")
  if(n==""){
    n<-read_page_name_from_console()
  }
  return (n)
}
####
t<-read_token_from_console()
###
n<-read_integer()
####
k<-read_page_name_from_console()

page<-getPage(k,t,n)

post_id<-character(n) 
post_likes<-double(n)
post_comment_count<-double(n)
post_share_count<-double(n)
post_engagement<-double(n)
post_link<-character(n)
post_creation_date<-character(n)

for (i in 1:n){
if (is.na(page$id[i])){ ####<<<< here what is done >>> in case the post is no longer present while extracting the  posts from the page, 
  ### the loop will break as the posts on the page are exhausted
  break
} else{
  result<-try({  ##### here try and catch statement is used. anytype of error including facebookapi error
    page_post<-getPost(post=page$id[i],token = t)
    
    a<-page_post$post$id
    if( (length(a)==0) && (typeof(a)=="character") ) {
      post_id[i]<-NA
    }  else {
      post_id[i]<-a
    }
    
    post_comment_count[i]<-page_post$post$comments_count
    post_share_count[i]<-page_post$post$shares_count
    post_likes[i]<-page_post$post$likes_count
    post_engagement[i]<-post_comment_count[i]+post_share_count[i]+post_likes[i]
    
    b<-page_post$post$created_time
    if( (length(b)==0) && (typeof(b)=="character") ) {
      post_creation_date[i]<-NA
    }  else {
      post_creation_date[i]<-b
    }
    
    c<-page_post$post$link
    if( (length(c)==0) && (typeof(c)=="character") ) {
      post_link[i]<-NA
    }  else {
      post_link[i]<-c
    }
   print(i)
  })
  if (class(result)=="try-error") break
} #### ^^^^ why break is used here??? >>> as error might come due to facebookapi being down  or  the token is being expired

}

#####@@@@ HERE IN THE BELOW CODE: FOLDER IS CREATED, DATAFRAME IS SAVED INTO IT AND THEN THE WORKING DIRECTORY IS SHIFTED BACK


df<-data.frame(post_id,post_creation_date,post_likes,post_comment_count,post_share_count,post_engagement,post_link,stringsAsFactors = F)
filepath<-file.path('~/Desktop/rfacebook_datamining/',paste(Sys.time(),k,sep = " "))
dir.create(filepath)
setwd(filepath)
save(df,file = "data_incomplete.Rda")
setwd('~/Desktop/rfacebook_datamining/')
df1=df
#View(df1)
##### ^^^^^ why here "=" is used: "<-" creates global variable but "=" only creates local variable

######@@@@@ NOW BELOW IS THE CODE FOR METADATA RETRIEVAL AND ADDING THE ADDTIONAL DATA INTO THE DATAFRAME @@@@@#######

links_to_extract<-df1$post_link
# str(links_to_extract)
###@@@@ here links_to_extract is a cloumn vector with 'chr' elements
# structure of an R object is determined by the function str()
# str(mydata)
#str(links_to_extract[1])
######@@@@@@@@@@@@@@@@@@@@@@@@ n>>10
keywords<-character(n) #n
authors<-character(n)  #n
title<-character(n)  #n

for (i in 1:n){ #n
  try({ #### here try statement is used to avoid any halting of for loop due to errors including http error
  url<-read_html(links_to_extract[i])

 if (is.na(links_to_extract[i])){
   title[i]<-NA
   authors[i]<-NA
   keywords[i]<-NA
   
 }else{
   m<-html_nodes(url, "title") %>% html_text()
   n0<-m[1]
   if( (length(n0)==0) && (typeof(n0)=="character") ) {
     title[i]<-NA
   }  else {
     title[i]<-n0
   }
  # p<-html_nodes(url,"meta[property=author]") %>% html_attr("content")
   p<-html_nodes(url,"meta[name=author]") %>% html_attr("content") 
   if( (length(p)==0) && (typeof(p)=="character") ) {
     authors[i]<-NA
   }  else {
     authors[i]<-p
   }
   
   q<-html_nodes(url,"meta[name=keywords]") %>% html_attr("content")
   if( (length(q)==0) && (typeof(q)=="character") ) {
     keywords[i]<-NA
   }  else {
     keywords[i]<-q
   }
 }
     
  print(i)
})
}

#####@@@@ NOW ADDING A COLUMN TO DATAFRAME @@@@#####

df1<-cbind(df1,title,authors,keywords)
View(df1)

####@@@@@ WHAT IS DONE BELOW @@@@@####
##How to save a data.frame in R?
##  
# There are several ways. One way is to use save() to save the exact object. e.g. for data frame foo:
#   
#   save(foo,file="data.Rda")
# 
# Then load it with:
#   
#   load("data.Rda")
#    
#
# ^^^^ see the implementation @ 09 meta_data_retrieval.R
setwd(filepath)
save(df1,file="data.Rda")
library(RJSONIO)
x<-toJSON(df1)
write(x, file=paste(k,".JSON"))
library ("xlsx")
write.xlsx(df1,"test.xlsx","testsheet")
setwd('~/Desktop/rfacebook_datamining/')

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
