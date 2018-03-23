#!/bin/bash

read -p "New LaTeX project name: " project_name
DATE=`date --date="0 day" +%Y-%m-%d`
underscore="_"
_latex="_latex"
foldername=$DATE$underscore$project_name$_latex
cp -R ~/linux-tricks/templates/latex_templates/simple_article_latex_template/ .
mv simple_article_latex_template $foldername
cd $foldername
mv simple_article_latex_template.tex $project_name.tex
mv simple_article_latex_template.pdf $project_name.pdf
subl .

echo
echo "Successfully generated new LaTeX project files in path:"
pwd
