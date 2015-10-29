df<-NULL
df1<-data.frame(x=1,y=2,z=3,stringsAsFactors=F)
df<-rbind(df,df1)
df2<-data.frame(x=2,y=3,z=4,stringsAsFactors=F)
df1<-rbind(df1,df2)
df<-rbind(df,df1)
df