#!/bin/bash

declare -A rowNum
rowNum[A]=1
rowNum[B]=2
rowNum[C]=3
rowNum[D]=4
rowNum[E]=5
rowNum[F]=6
rowNum[G]=7
rowNum[H]=8

firstRow=3
firstCol=2
height=9

rawIn=$1
coord=$2

row=${coord:0:1}
col=${coord:1}

if [ $row == 'A' ] ; then
	actualCol=$((firstCol + col))
else
	actualCol=$col
fi
myRow=${rowNum[$row]}
actualRow=$myRow
#echo "Coordinate is $coord"
#echo "Row is $row, rownum is ${rowNum[$row]}, actual row is $actualRow, Col is $col, actual col is $actualCol"
sed '$d' $rawIn | awk 'NR>3' | awk -v a=$height -v b=$actualCol -v c=$actualRow 'NR%a==c {print $b}'
