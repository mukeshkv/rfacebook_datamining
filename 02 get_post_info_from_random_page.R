library(Rfacebook)

token<-"CAACEdEose0cBADDZB6dJhTeyUMJC3rQ7674Yxbmpg5gg6L2fty2y8zAd6d8tWo9aUvXarLpbxYnpXJmJwzmaQWH5rzsZBgmUf72ZCv3KkeEPyZBi1rHQtnHIK6RM7izZAaMp4m9hChhv8pW02Y7CbJpwabjQjEuVZA2ZAl2EbCjlQQXUr9nRWoLZBCQNMhVyelCe5SeFcx1Dj6kQJZBcoTXd0"

#post<-getPost(post = '10154229713099447',n=2000,token = token)
fb_page<-getPage(page='topyaps',token=token)
#typeof(fb_page)
#is.data.frame(fb_page)
post<-getPost(post=fb_page$id[10],token = token)
#my_info<-getUsers('786274446',token,private_info = F)
#View(my_info)
#typeof(post)
#View(post)
#post
#############################
first<-post$post$message
second<-post$post$link
typeof(second)
print(first)
print(second)

################################

#third<-post$comments
#print(third)


#################here second is a DATAFRAME with userid & usernames of the users who have liked the post


users <- getUsers(post$likes$from_id, token,private_info = FALSE) 
#is.data.frame(users)
#View(users$gender)  # gender
View(users)

