# General aliases
alias ll='ls -alF'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias c='clear'
alias s='source ~/.bashrc && source ~/catkin_ws/devel/setup.bash'
alias b='nano ~/.bashrc'
alias bb='nano ~/useful_notes/.bash_aliases'
alias h='history'
alias hf='history | grep $1' # Ex: 'hf <searchword>' -> 'hf git'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cs-notes='atom ~/useful_notes'

# Git aliases
alias g='git status' # Really useful!
alias g-s='git status'
alias g-a='git add' # Ex: 'git add main.cpp'
alias g-aa='git add *' # Caution! This adds all files
alias g-s='git status'
alias g-a-a='git add *' #WARNING! This add all files
alias g-c='git commit -m' #Ex: 'g-c "This is a commit message"'
alias g-r='git reset' # Not testet yet
alias g-dd='git diff' # Not tested yet, but should be 'g-dd main.py'
alias g-d='git pull origin master' # d for download
alias g-u='git push origin master' # u for upload
alias g-v='git remote -v'
alias g-user='git config --global user.email' # Ex: 'g-user haraldlons@gmail.com'

# SSH
alias ø='ssh nvidia@192.168.1.10' #SSH to NVIDIA Jetson TX1

# ROS
alias å='export ROS_IP=192.168.1.6 && export ROS_MASTER_URI=http://192.168.1.10:11311/'
alias r-t='rostopic list'
alias r-e='rostopic echo $1' #Use: 'r-e /arduino/throttle_setpoint'
alias r-i='rostopic info $1' #Use: 'r-i /arduino/throttle_setpoint'
alias rr='rosrun'
#alias å='python ~/coding/dv_useful_scripts/listen_to_tx_ros_network.py'

# Catkin
alias cm='cd ~/catkin_ws && catkin build && cd -' # You can call 'cm' from wherever you want!
alias o='atom ~/catkin_ws/src'
alias co='cd ~/catkin_ws/src/r18dv_rc_nodes/'

# Special programs
alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' # Personal for setting Bose QC35 as main sound unit
