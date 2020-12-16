#!/bin/bash

rows="ABCDEFGH"
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

actualRow=`echo $rows | awk -v x=$row '{print index($0,x)}'`
#echo "Coordinate is $coord"
#echo "Row is $row, actual row is $actualRow, Col is $col, actual col is $actualCol"
sed '$d' $rawIn | awk 'NR>3' | awk -v a=$height -v b=$actualCol -v c=$actualRow 'NR%a==c {print $b}'
