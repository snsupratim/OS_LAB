#!/bin/bash

function sum () {
r=0
s=0
while [ $n -ne 0 ]
do
r=`expr $n % 10`
s=`expr $s + $r`
n=`expr $n / 10`
done
echo "the sum of digit : $s"
}

echo enter the number
read n
sum $n
