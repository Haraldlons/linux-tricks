#!/bin/bash
# TODO: First check if aliases is already sourced in bashrc

cd ~
# echo "export IWantHaraldsPersonalAliases=false" >> ~/.bashrc

isInFile=$(cat ~/.bashrc | grep -c "linux-tricks")
if [ $isInFile -eq 0 ]; then
	echo "source ~/linux-tricks/.bash_aliases" >> ~/.bashrc
	echo "Successfully installed linux-tricks bash_aliases!"
	echo "Please restart terminal to activate new aliases"
	echo "Congratulation!"
	. ~/linux-tricks/.bash_aliases
	notification "Successfully installed linux-tricks!" "You have now installed linux-tricks, which makes you able to use a whole lot of new aliases. Take a look at them at ~/linux-tricks/.bash_aliases" 30 "accept.png"
else
	echo "It seems like you have already added linux-tricks/.bash_aliases to your .bashrc" 
	echo "Aborting!"
fi
