#!/bin/bash

host -t ns $1
host -t mx $1

for ns in $(host -t ns $1 | cut -d " " -f 4);
do
host -l $1 $ns;
done

for palavra in $(cat lista.txt);
do
host $palavra.$1 | grep "has address";
done

