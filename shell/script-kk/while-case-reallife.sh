while true
do 
echo "1. Shutdown"
echo "2. Restart" 
echo "3. Exit Menu"
read -p "Enter your choice: " choice
if [ $choice -eq 1 ]
then 
   shutdown now
elif [ $choice -eq 2 ]
then 
   shutdown -r now  #Restart
elif [ $choice -eq 3 ]
then 
   break  # Breaks and exit the loop
else 
   continue #Takes the execution back to the beginning of the loop.
fi
done

#------OR---------------
while true
do
  echo "1. Shutdown"
  echo "2. Restart"
  echo "3. Exit Menu"
  read –p "Enter your choice: " choice
  case $choice in
      1) shutdown now 
         ;;
      2) shutdown –r now ;;
      3) break ;;
      *) continue ;;
  esac
done

