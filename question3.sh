#Zina Al-Sabbagh 10161380
#Rita Sattah 10154610

#!/bin/bash

move1=0
move2=0
move3=0

echo ''
echo 'Welcome to CISC220 Racing Arena!'
echo ''
echo 'User 1 press 1 to move forward, User 2 press 2 and User 3 press 3'
echo ''

add1=""
race1="                                        "
add2=""
race2="                                        "
add3=""
race3="                                        "

while (($move1<40 && $move2<40 && $move3<40)); do
	read -n1 input
	if (($input==1)) ; then
		add1+="~"
		move1=$move1+1
		race1="${race1%?}"
			
	elif (($input==2)) ; then
		add2+="~"
		move2=$move2+1
        race2="${race2%?}"
			
	elif (($input==3)) ; then
		add3+="~"
		move3=$move3+1
        race3="${race3%?}"	
	fi

	clear

	echo "${add1}|->""$race1""# Lane 1 #"
	echo "${add2}|->""$race2""# Lane 2 #"
	echo "${add3}|->""$race3""# Lane 3 #"

done

if (("$move1"==40)) ; then
	echo 'Player 1 WINS!'
elif (("$move2"==40)) ; then
	echo 'Player 2 WINS!'
elif (("$move3"==40)) ; then
	echo 'Player 3 WINS!'
fi