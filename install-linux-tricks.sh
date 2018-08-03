#!/bin/bash
# TODO: First check if aliases is already sourced in bashrc

cd ~
echo "export IWantHaraldsPersonalAliases=false" >> ~/.bashrc
echo "source ~/linux-tricks/.bash_aliases" >> ~/.bashrc
