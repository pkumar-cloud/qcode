# create a directory structure using a function
function prepare-directory-structure(){
  mkdir apps
  cd apps
  mkdir app1 app2 app3
  touch app1/logs app2/logs app3/logs
}
prepare-directory-structure

# add two numbers
function add(){
  sum=$(( $1 + $2 )) # $1:param1, $2:param2
  echo $sum #returns the value from function 
}
result=$(add 3 5)
echo "The result is $result"
