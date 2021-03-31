#!/bin/bash
# Luke Boudewyns 10393135
let countfe=0       #sets count for an empty file
let countfne=0      #sets count for not empty file
let countde=0       #sets count for empty directory
let countdne=0      #sets count for not empty directory

for f in $1/*       #loops through each file in the directory, using default variable
do
    if [ -f $f ] && [ -s $f ]; then     #checks if item is a file and that it is not empty
        ((countfne++))                  #will increment file not empty +1
        if [[ ! -s $f ]]; then          #nested statement to catch any item that exist, nested
            ((countfe++))
        else continue
        fi
    elif [ -f $f ] && [[ ! -s  $f ]]; then  #checks that current item is a file and does not contain data
        ((countfe++))                       #increments file empty count +1
    elif [ -d $f ]; then
        currentdir=$(ls $f -1 | wc -l)  #sets a value for the current directory and checks the content of it, lists one file per line, and counts the lines 

        if [[ $currentdir -gt 0 ]]; then   #if the current directory word count has more than zero lines, it must not be empty
            ((countdne++))  #increment the count for directory not empty
        else
            ((countde++))   #otherwise it must be empty so increment the count for empty directory +1
        
        fi
    else continue
    fi  
done

echo -e "the $1 directory contains:\n
$countfne files that contain data\n
$countfe files that are empty\n
$countdne non-empty directories\n
$countde empty directories"      #recalls all variables and echoes them with escape characters

exit 0              #exit script