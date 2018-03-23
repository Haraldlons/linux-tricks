#!/bin/bash

read -p "New C++ project name: " project_name
DATE=`date --date="0 day" +%Y-%m-%d`
underscore="_"
foldername=$DATE$underscore$project_name
cd ~
mkdir -p coding/c++
cd coding/c++/
mkdir $foldername
cp ~/linux-tricks/templates/cpp_template/* $foldername
cd $foldername
chmod 755 make_and_run.sh
subl .
echo
echo "Successfully generated new project files in path:"
pwd
