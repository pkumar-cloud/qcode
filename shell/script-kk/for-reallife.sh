# Iterate through list of files from the output of the ls command:
for file in $(ls)
do
 echo Line count of $file is $(cat $file | wc -l)
done

#----------------
#Iterate through list of packages store them in a file and installs them one by one.
for package in $(cat install-packages.txt)
do
 sudo apt-get –y install $package
done

#--------------
# ssh to the list of servers and check there uptime
for server in $(cat servers.txt)
do
 ssh $server "uptime"
done