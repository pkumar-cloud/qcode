<< com
Shows a menu driven program with the following options:
1. Add
2. Subtract
3. Multiply
4. Divide
5. Quit
com

#!/bin/bash

# Function to read two numbers from the user
function read_numbers() {
  read -p "Enter Number1: " number1
  read -p "Enter Number2: " number2
}

# Main menu loop
while true; do
  echo "Menu:"
  echo "1. Add"
  echo "2. Subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  # Prompt user for choice
  read -p "Enter your choice: " choice

  # Process user choice
  case $choice in
    1)
      read_numbers
      echo "Result: $((number1 + number2))"
      ;;
    2)
      read_numbers
      echo "Result: $((number1 - number2))"
      ;;
    3)
      read_numbers
      echo "Result: $((number1 * number2))"
      ;;
    4)
      read_numbers
      # Check if divisor is zero
      if [ "$number2" -eq 0 ]; then
        echo "Error: Division by zero!"
      else
        echo "Result: $((number1 / number2))"
      fi
      ;;
    5)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice. Please enter a number from 1 to 5."
      ;;
  esac
done
