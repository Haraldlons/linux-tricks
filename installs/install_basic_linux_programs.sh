#!/bin/bash

# Goal: Setup Linux with basic programs

sudo apt-get update
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install sshfs # 'link' folder from ssh
./install_sublime.sh

sudo apt-get install sshfs  # Being able to 'link' folder from ssh to your local machine. 
							# You can then e.g. open sublime on local machine and when you
							# save it will be updated on server
sudo apt-get update && sudo apt-get install compiz-plugins
