<< com
We have a few different applications running on this system. The list of applications are stored at /tmp/assets/apps.txt file. 
Each application has it's logs stored in /var/log/apps directory under a file with its name. 

Inspect the log file of an application and prints the number of GET, POST, and DELETE requests. 
Read the list of applications from the apps.txt file and count number of requests for each application and display it in a tabular format like this.

Logname GET POST DELETE
- - - - - - - - - - - - - - - - - - - - - - - - - - -
finance 10 20 50
marketing 20 10 30
com

echo -e " Logname   \t      GET      \t      POST    \t   DELETE "
echo -e "------------------------------------------------------------"

for app in $(cat /tmp/assets/apps.txt)
do
  get_requests=$(cat /var/log/apps/${app}_app.log | grep "GET" | wc -l)
  post_requests=$(cat /var/log/apps/${app}_app.log | grep "POST" | wc -l)
  delete_requests=$(cat /var/log/apps/${app}_app.log | grep "DELETE" | wc -l)
  echo -e " ${app}    \t ${get_requests}    \t    ${post_requests}   \t   ${delete_requests}"

done