#!/bin/bash

rows="ABCDEFGH"
firstCol=2
height=9

rawIn=$1
coords=$2
fileLength=`cat $rawIn | wc -l`
matrixLength=$((fileLength - 4))
echo $coords
i=0
while :
do
	lineOut=""
	for eachCoord in ${coords//,/ }
	do
		thisRow=${eachCoord:0:1}
		thisCol=${eachCoord:1}
		if [ $thisRow == 'A' ] ; then
			actualCol=$((firstCol + thisCol))
		else
			actualCol=$thisCol
		fi
		actualRow=`echo $rows | awk -v x=$thisRow '{print index($0,x)}'`
		rowInFile=$((actualRow + i))
		thisValue=`sed '$d' $rawIn | awk 'NR>3' | awk -v b=$actualCol -v c=$rowInFile 'NR==c {print $b}'`
		lineOut="$lineOut,$thisValue"
	done
	echo ${lineOut:1}

	i=$(($i + 9))
	if [ $i -ge $matrixLength ]; then
		break
	fi

done
