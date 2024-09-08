#5a. Write a menu based shell script to do the following:
#1) Add two user defined numbers
#2) Subtract two user defined numbers
#3) Multiply two user defined numbers
#4) Divide two user defined numbers
echo press 1 to Addition
echo press 2 to Subtraction
echo press 3 to Multiplication
echo press 4 to Division
echo press 5 to Exit
echo enter 1st number
read a
echo enter 2nd number
read b
while [ 1 ]
do
echo enter your choice
read ch
case $ch in
1) echo Addition of $a and $b is `expr $a + $b` ;;
2) echo Subtraction of $a and $b is `expr $a - $b` ;;
3) echo Multiplication of $a and $b is `expr $a \* $b` ;;
4) echo Division of $a and $b is `expr $a / $b` ;;
5) exit ;;
*) echo Wrong choice
esac
done
