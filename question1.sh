#Rita Alsattah 10154610
#Zina Alsabbagh 10161380

#!/bin/bash

read -p "Please enter a number: " num1
[ $num1 == ':q' ] && echo "Thank you for using our calculator." && exit 0

while [[ "$num1" == *[!0-9]* ]] ; do
	
  read -p "Error! Please enter a number: " num1
	[ $num1 == ':q' ]  && exit 0

done

while true; do

	read -p "Please enter an operation: " oper
	[ $oper == ':q' ] && echo "Thank you for using our calculator." && exit 0
	
  while [ "$oper" != "+" -a "$oper" != "-" -a "$oper" != "*" -a "$oper" != "/" ] ; do
		read -p "Error! Please enter an operation: " oper
		[ $oper == ':q' ] && exit 0
	
  done

	read -p "Please enter a number: " num2
	[ $num2 == ':q' ] && echo "Thank you for using our calculator." && exit 0
	
  while [[ "$num2" == *[!0-9]* ]] ; do
		read -p "Error! Please enter a number: " num2
		[ $num2 == ':q' ] && exit 0
	
  done

	case $oper in
		"+") 
			echo "Result is $(($num1+$num2)) so far." 
			num1=$(($num1+$num2));;
		"-") 
			echo "Result is $(($num1-$num2)) so far." 
			num1=$(($num1-$num2));;
		"*") 
			echo "Result is $(($num1*$num2)) so far." 
			num1=$(($num1*$num2));;
		"/") 
			echo "Result is $(($num1/$num2)) so far." 
			num1=$(($num1/$num2));;
	esac 

done

