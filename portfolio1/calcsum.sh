#!/bin/bash
#Luke Boudewyns 10393135
let sum=$1+$2+$3 #create variable using default vars

if [ $sum -le 30 ]; then
    echo 'the sum of '$1' and '$2' and '$3' is '$sum
else echo 'sum exceeds maximum allowance'
fi
exit 0