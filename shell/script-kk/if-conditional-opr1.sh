#1.---------------
<< comment
Create a shell script in the home directory called check_dir.sh. 
The script should print the line Directory exists if the directory /home/bob/caleston exists. 
If not, it should print Directory not found
comment

if [ -d "/home/bob/caleston" ]
then
  echo "Directory exists"
else
  echo "Directory not found"
fi

#2.------------------
if [ $1 -gt $2 ]
then
    echo $1
else
    echo $2
fi