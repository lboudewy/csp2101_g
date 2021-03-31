#!/bin/bash
#Luke Boudewyns 10393135
val=0 #set a value for entry

while [[ $val -ne 20 ]] || [[ $val -ne 40 ]]; do  #create a loop that runs while val is not equal to our numbers

    read -p 'please enter either 20 or 40: ' val #prompt for either 20 or 40 and read number
    
        if [[ $val -eq 20 ]] || [[ $val -eq 40 ]] #if statement that checks for 20 or 40 against value
            then echo 'correct!' && exit 0          #if 20 or 40 entered will break from loop
        else
            echo 'incorrect, please try again' #reads incorrect and will re prompt
        fi    
done 
exit 0      #exit script