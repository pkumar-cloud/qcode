#shell script to print the Sum, Difference, Product and Quotient of these values.

A=20
B=10

echo "Sum is $(( A + B))"
echo "Difference is $(( A - B))"
echo "Product is $((A * B))"
echo "Quotient is $(( A / B))"

#---------------------
baskets=4
apples_per_basket=5
total_apples=`expr $baskets \* $apples_per_basket`
echo "Total Apples = $total_apples"

#---------------------
num1=$1
num2=$2
num3=$3
sum=$(( num1 + num2 + num3 ))
average=$(echo "$sum / 3" | bc -l)
echo $average