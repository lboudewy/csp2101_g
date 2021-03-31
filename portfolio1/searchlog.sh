#!/bin/bash
#Luke Boudewyns 10393135
while true; do      #create infinite loop to re ask for information
    read -p 'what pattern do you want to search for?    ' pattern   #store three variables for each search option
    echo -e "do you want a whole word match? (1) \nor any match? (2) "
    read match_type
    read -p 'do you want an inverted match (yes) 1 or (no) 2 ?' invert
    lines=$(grep -c $pattern access_log.txt)    #check the number of lines of the search and store in variable
    if [[ $lines -ge 0 ]]; then     #counts number of lines, if lines is 0, then there must be no matches

        if [[ $match_type -eq 1 ]] && [[ $invert -eq 2 ]]; then     #checks for variables read above and grep for non invert, whole word match
            echo "matches found : $lines"
            grep -win "$pattern" access_log.txt
        elif [[ $match_type -eq 1 ]] && [[ $invert -eq 1 ]]; then   #checks for variables read above and grep for invert, whole word match
            echo "matches found : $lines"
            grep -winv "$pattern" access_log.txt
        elif [[ $match_type -eq 2 ]] && [[ $invert -eq 2 ]]; then   #checks for variables read above and grep for non invert, non whole word match
            echo "matches found : $lines"
            grep -in "$pattern" access_log.txt
        elif [[ $match_type -eq 2 ]] && [[ $invert -eq 1 ]]; then   #checks for variables read above and grep for invert, non whole word match
            echo "matches found : $lines"
            grep -inv "$pattern" access_log.txt
        else continue               #if incorrect values, then will continue
        fi
    else echo "no matches found"    #will read if the pattern is not grepped
    fi
echo "press CTRL+C to quit"     #prompt user to exit loop
sleep 1
done
exit 0