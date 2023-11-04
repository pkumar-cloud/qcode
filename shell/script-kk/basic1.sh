<< comment
Create a shell script in the home directory called create-directory-structure.sh. 
The script should do the following tasks:

Create the following directories under /home/bob/countries - USA, UK, India
Create a file under each directory by the name capital.txt
Add the capital cities name in the file - Washington, D.C, London, New Delhi
Print uptime of the system
comment

#!/bin/bash

mkdir countries
cd countries
mkdir USA India UK
echo "Washington, D.C" > USA/capital.txt
echo "London" > UK/capital.txt
echo "New Delhi" > India/capital.txt
uptime