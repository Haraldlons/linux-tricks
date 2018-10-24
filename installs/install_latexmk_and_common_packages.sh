#!/bin/bash
# Goal: Being able to compile .tex files in sublime with ctrl-b for super easy development

# 1: Install Package Control for Sublime Text 
	# https://packagecontrol.io/installation
# 2: Install LaTeXTools with Package Control in Sublime Text
	# ctrl-shift-p -> write 'install' -> press enter -> write 'LaTeXTools' -> press enter
# 3: Run this install script
	# ./install_latexmk_and_common_packages.sh 

sudo apt-get --assume-yes install latexmk
sudo apt-get --assume-yes install texlive-latex-base
sudo apt-get --assume-yes install texlive-latex-recommended
sudo apt-get --assume-yes install texlive-latex-extra
sudo apt-get --assume-yes install texlive-lang-european

# If you have installed Haralds Linux-tricks, you should now be able to
# write 'new_latex' in the terminal, make a new latex-project, open the .tex file
# and press 'ctrl-b' for automatic compilation of the .tex files.
# It's super cool!