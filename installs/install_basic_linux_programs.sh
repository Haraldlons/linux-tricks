#!/bin/bash
# Goal: Setup Linux with basic programs
# All following programs are light-weight, 
# so don't worry about disk space

sudo apt-get update
sudo apt-get --assume-yes install git # Version control
sudo apt-get --assume-yes install sshfs # 'link' folder from ssh
sudo apt-get --assume-yes install tmux # Terminal multiplexer
sudo apt-get --assume-yes install tilda # Terminal overlay
sudo apt-get --assume-yes install vim # Editor
sudo apt-get --assume-yes install compiz-plugins # Ubuntu settings extention
sudo apt-get --assume-yes install tig # Pretty view of git log + branches
sudo apt-get --assume-yes install ranger # View filesystem in terminal
