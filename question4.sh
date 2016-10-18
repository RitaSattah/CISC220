#Rita Alsattah 10154610
#Zina Alsabbagh 10161380

#!/bin/bash
 
if ! [ -f $2 ]; then
    echo Error! $2 does not exist.
else
    first = true
    list2=$(ls -Rl $PWD)
    list2=( ${list2[*]} )
    list1=$(cat $2)
    list1=( ${list1[*]} )
    
	for i in $(seq 0 2 $((${#list1[*]}-1)) ) ; do
       
   		perm1=${list1[$i]}
        name1=${list1[$(($i+1))]}
        reset=1
        val=0
        binStr=0
        
		for k in $(seq 1 $((${#perm1}-1)) ) ; do
            
			letter=${perm1:$k:1}
            if [ "$letter" = "r" ] ; then
                val=$(($val+4))
            elif [ "$letter" = "w" ] ; then
                val=$(($val+2))
            elif [ "$letter" = "x" ] ; then
                val=$(($val+1))
            fi
            if (( $reset == 3 )) ; then
                binStr+=$val
                reset=1
                val=0
            else
                reset=$(($reset+1))
            fi
        
		done
        
		path="."
        
		for j in $(seq 1 $((${#list2[*]}-8)) ) ; do
           
     		if [ "${list2[$j]:$((${#list2[$j]}-1))}" = ":" ] ; then
                pathStr=${list2[$j]}
                pathStr=${pathStr:0:$((${#pathStr[*]}-2))}
                path=$pathStr/
            
			fi
            
			perm2=${list2[$j]}
            
			name2=${list2[$(($j+8))]}
            
			if [ "$name2" = "$name1" ] && [ "$perm2" != "$perm1" ] ; then
                
				if [ "$1" = "-s" ] ; then
                    if [ "$first" = "true" ] ; then
                        echo "Old        Current       File"
                        first = false
                    fi
                    echo "$perm1    $perm2    $name1"
                
				elif [ "$1" = "-r" ] ; then
                    if [ "$path" = "." ] ; then
                        chmod ${binStr:1} $name2
                    else
                        chmod ${binStr:1} $path$name2
                    fi
                    echo $name1 permissions reset from $perm2 to $perm1
               
			   else
                    if [ "$first" = "true" ] ; then
                        echo "Error! Provided argument, '$1', is not '-r' or '-s'"
                        first = false
            
                    fi
                
				fi
            
			fi
        
		done
    done
fi
