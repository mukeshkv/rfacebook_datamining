library(Rfacebook)

################## Apps require Facebook's approval before you can get the data (ugh), so I changed the default in this function to extended_permissions=FALSE which was earlier TRUE
fb_oauth <- fbOAuth(app_id="1014297568601895", app_secret="55609c1b644c098747157fad110747f5",extended_permissions = FALSE)



save(fb_oauth, file="fb_oauth")

load("fb_oauth")






#######################################
my_friends <- getFriends(token=fb_oauth, simplify=F)
View(my_friends)

