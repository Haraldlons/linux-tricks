#!/bin/bash

read -p "New note name: " note_name
DATE=`date --date="0 day" +%Y-%m-%d`
hour_and_minute=$(date|awk '{print $4}')
underscore="_"

file_name=$DATE$underscore$note_name
mkdir -p ~/notes
cd ~/notes
touch $file_name
echo "Subject: "$note_name >> $file_name 
echo "Date: "$DATE" - "$hour_and_minute >> $file_name

subl ~/notes/$file_name
echo "Successfully generated new note in path:"
pwd
