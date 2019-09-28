#!/bin/bash
# Goal: Install whatpulse dependencies


sudo apt-get update
sudo apt-get --assume-yes install libQtCore # Version control
sudo apt-get --assume-yes install libqt4-sql
sudo apt-get --assume-yes install libqt4-sql-sqlite
sudo apt-get --assume-yes install openssl-devel
sudo apt-get --assume-yes install libQtScript
# sudo apt-get --assume-yes install 
# sudo apt-get --assume-yes install 