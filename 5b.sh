echo press 1 to see the content of the current folder
echo press 2 to see the present working directory
echo press 3 to show the calender
echo press 4 exit of file
while [ 1 ]
do
echo enter your choice
read ch
case $ch in
1) ls ;;
2) pwd ;;
3) cal 2024 ;;
4) exit ;;
*) wrong choice ;;
esac
done
