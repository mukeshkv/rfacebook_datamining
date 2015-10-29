#UNDERSTAND RCurl PACKAGE HERE
#  http://www.omegahat.org/RCurl/philosophy.html

#explains the extraction of HTML code from any internet site using the RCurl package
#The package provides features to send requests to a site either via the browsers HTTP line or directly to a site’s forms.

library(RCurl)
# now lets extract the HTML code from my blog using getURL()
# from the RCurl package

html_val<-getURL("http://topyaps.com/")

# this looks pretty unstructured. But we may have an organized
# view using htmlTreeParse() from the XML package
# This is just to see what we are dealing with

library(XML)
htmlTreeParse(html_val)
