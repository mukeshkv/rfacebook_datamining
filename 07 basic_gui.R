#read about simple gui creation @ http://stdioe.blogspot.in/2013/08/a-gwidget-example-using-windows-groups.html
#this gui creation has been done using gWidgets package

#also check
# http://www.r-bloggers.com/creating-guis-in-r-with-gwidgets/


library(gWidgets)
library(gWidgets)
main<-gwindow(title = "test", width = 400, height = 500)

row1<-ggroup(container = main)
glabel(text = "username",container = row1)
gedit(container = row1)

row2<-ggroup(container = main)
glabel(text = "password",container = row2)
gedit(container = row2)

row3<-ggroup(container = main)
gbutton(text="submit", container= row3)