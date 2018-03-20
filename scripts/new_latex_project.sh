#!/bin/bash

read -p "New LaTeX project name: " project_name
DATE=`date --date="0 day" +%Y-%m-%d`
underscore="_"
_latex="_latex"
foldername=$DATE$underscore$project_name$_latex
mkdir $foldername
cd $foldername
cp -R ~/useful_computer_notes/templates/latex_templates/simple_article_latex_template/simple_article_latex_template.tex .
mv simple_article_latex_template.tex $project_name.tex
subl .
echo
echo "Successfully generated new LaTeX project files in path:"
pwd
