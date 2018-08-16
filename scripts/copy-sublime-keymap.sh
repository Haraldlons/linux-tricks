#!/bin/bash
# SOURCE=~/linux-tricks/templates/sublime_settings/Default\ (Linux).sublime-keymap
# DESTINATION="~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap "
# sudo cp "${SOURCE}" "${DESTINATION}"
echo "==============================================================="
echo "Printing current sublime keymap: "
cat ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap 
echo "==============================================================="
echo "==============================================================="
echo "Overwriting current sublime keymap with linux-tricks template keymap..."
cp ~/linux-tricks/templates/sublime_settings/Default\ \(Linux\).sublime-keymap\  ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap 
echo "Printing new keymap: "
cat ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap 