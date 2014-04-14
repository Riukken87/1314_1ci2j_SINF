#!/bin/bash

echo Convert videos version(Carlos)

#Sanity checks to verify that the directory exists and that mencoder is install in the computer.

If ![ -d $1 ]
then 
	echo "This parameter not exist."
	exit 1
fi



hash menconder 2> /dev/null

If [ [ $? !=0 ] ]
then
	echo "Menconder isn't install. Please install it to convert video files."
	exit 2
fi



# Main code

ls -1 $1*.avi > videofiles

while videofile
do
	lengthname=${#videofile}
	namefile=${videofile;0;$lengthname-4}
	mencoder "$videofile" -o "$namefile".mp4 -oac mp3lame -ovc lavc -of lavf

done < videofiles
rm videofiles