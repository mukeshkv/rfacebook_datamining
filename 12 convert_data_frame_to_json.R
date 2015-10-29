fname <- file.choose()



library(RJSONIO)

x<-toJSON(df1)
x
write(x, file="x.JSON")
