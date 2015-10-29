### http://www.rexamples.com/4/Reading%20user%20input

### ^^^ ABOUT THE USER INPUT OF DATA IN THE CONSOLE

#read_integer<-function(){
# n<-readline(prompt = "enter an integer value:")
#  n<-as.integer(n)
#  if(is.na(n)){
#    n<-read_integer()
#  }
#  return (n)
#}

#print(read_integer())



#read_double<-function(){
#  n<-readline(prompt = "enter the double value:")
#  n<-as.double(n)
#  if(is.na(n)){
#    n<-read_double()
#  }
#  return (n)
  
#}

#print(read_double())

read_string_from_console<-function(){
  n<-readline(prompt = "enter token value:")
  if(n==""){
    n<-read_string_from_console()
  }
  return (n)
}

print (read_string_from_console())