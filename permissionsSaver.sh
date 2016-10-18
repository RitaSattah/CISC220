#Rita Sattah 10154610
#Zina Al-Sabbagh 10161380
#!/bin/bash

list=$(ls -Rl $PWD)
list=(${list[*]})
c=1


if [ -f savedPermissions ] ; then
	while [ -f savedPermissions$c ] ; do
		c=$(($c+1))
	done
	fil=savedPermissions$c
else
	fil=savedPermissions
fi

for i in $(seq 0 $((${#list[*]}-8))) ; do
	name="${list[$(($i+8))]}"
	substring="${list[$i]}"
	first=${string:0:1}
	if ((${#string}==10)) && ["$first" = "-"] ; then
	for j in $(seq 1 $((${#string}-1)) ) ; do
		substring=${string:$(($j)):1}
		if (($(($j%3))==2)) && [ "$substring" != "w" ] && [ "$substring" != "-" ] ; then
			break
		elif (($(($j%3))==0)) && [ "$substring" != "x" ] && [ "$substring" != "-" ] ; then
			break
		elif (($(($j%3))==1)) && [ "$substring" != "r" ] && [ "$substring" != "-" ] ; then
			break
		fi
		if (($j==$((${#string}-1)))); then
			echo $string $name >> $fil
		fi
	done
	fi
done

echo "${fil} created!"