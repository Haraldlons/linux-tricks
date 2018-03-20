#!/bin/bash

read -p "New LaTeX project name: " project_name
DATE=`date --date="0 day" +%Y-%m-%d`
underscore="_"
foldername=$DATE$underscore$project_name
mkdir $foldername
cp -R ~/useful_computer_notes/templates/latex_templates/simple_article_latex_template/ .
cd $foldername
mv simple_article_latex_template.tex $project_name.tex
subl .
echo
echo "Successfully generated new LaTeX project files in path:"
pwd
