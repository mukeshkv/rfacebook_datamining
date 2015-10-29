# understand RCurl package and how to extract html_info of a page @
# 05 getting_html_data_from_any_page_using_RCurl_package.R

#####
#LINKS TO CHECK
#1. https://developers.google.com/custom-search/json-api/v1/overview
#2. https://developers.google.com/custom-search/json-api/v1/introduction
#3. https://developers.google.com/apis-explorer/#p/customsearch/v1/search.cse.list?q=cran&cx=004212590687908230653%253Af4lhq_eulzu&_h=1&
#4. https://developers.google.com/custom-search/json-api/v1/using_rest
#5. https://developers.google.com/custom-search/json-api/v1/reference/cse/list#response
#6. https://ryouready.wordpress.com/2009/01/01/r-retrieving-information-from-google-with-rcurl-package/
#####
#CUSTOM SEARCH ENGINE 
# https://cse.google.com/cse/all 
#API KEY 
# https://console.developers.google.com/project/numeric-virtue-109709/apiui/credential
###^^^^^ FOR ABOVE ACCOUNT LOGIN IS NEEDED
###^^^^^ I CREATED USING MY TECHMONKEY ACCOUNT 


library(RCurl)
library(httr)
get_google_response<-function (query,api_key,engine_id){
  
 base_url<-"https://www.googleapis.com/customsearch/v1?"
  
 akey<-api_key
  
 eid<-engine_id
  
 url0<-paste0(base_url,"key=",akey,"&cx=",eid,"&q=",query)
  
 HEAD(url0)
 
 #^^^^^If the request succeeds, 
 #the server responds with a 200 OK HTTP status code and the response data in JSON or Atom format.
 #############
 #Response [https://www.googleapis.com/customsearch/v1?key=AIzaSyBrtsQxivYcMcxcDF-CvZSsakdOfGpMlNs&cx=004212590687908230653:f4lhq_eulzu&q=cran]
 #Date: 2015-10-14 10:43
 #Status: 200
 #Content-Type: application/json; charset=UTF-8
 #############
 
 
 
}



get_google_response("cran","AIzaSyBrtsQxivYcMcxcDF-CvZSsakdOfGpMlNs","004212590687908230653:f4lhq_eulzu")

