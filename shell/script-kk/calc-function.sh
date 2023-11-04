<< com
Shows a menu driven program with the following options:
1. Add
2. Subtract
3. Multiply
4. Divide
5. Quit
com

Update the script as follows:

#!/bin/bash
function read_numbers(){
  read -p "Enter Number1: " number1
  read -p "Enter Number2: " number2
}

while true
do
  echo "1. Add"
  echo "2. Subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  read -p "Enter your choice: " choice

  case $choice in
    1)  read_numbers
        echo $(( $number1 + $number2 )) ;;
    2)
        read_numbers
        echo $(( $number1 - $number2 )) ;;

    3)
        read_numbers
        echo $(( $number1 * $number2 )) ;;

    4)
        read_numbers
        echo $(( $number1 / $number2 )) ;;

    5)  break
  esac

done