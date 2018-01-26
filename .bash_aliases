#General aliases
alias ll='ls -alF'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias c='clear'
alias s='source ~/.bashrc && source ~/catkin_ws/devel/setup.bash'
alias b='nano ~/.bashrc'
alias bb='nano ~/notes_computer_science/.bash_aliases'
alias h='history'
alias hf='history | grep $1' #Use this by 'hf <searchword>' -> 'hf git'
alias bb='nano ~/notes_computer_science/.bash_aliases'

#Git aliases
alias g='git status'
alias g-s='git status'
alias g-a='git add'
alias g-aa='git add *' # Caution! This adds all files
alias g-s='git status'
alias g-a-a='git add *' #WARNING! This add all files
alias g-c='git commit -m' #Use: 'g-c "This is a commit message"'
alias g-r='git reset' # Not testet yet
alias g-dd='git diff' # Not tested yet, but should be 'g-dd main.py'
alias g-d='git pull origin master' # d for download
alias g-u='git push origin master' # u for upload

alias g-v='git remote -v'
alias g-user='git config --global user.email'

#SSH
alias ø='ssh nvidia@192.168.1.10' #SSH to NVIDIA Jetson TX1

#ROS
alias cm='cd ~/catkin_ws && catkin build && cd -'
alias o='subl ~/catkin_ws/src'
alias vis='cd ~/catkin_ws/src/visualize_arduino_communication/scripts/ && python main.py && cd -'
alias å='export ROS_IP=192.168.1.6 && export ROS_MASTER_URI=http://192.168.1.10:11311/'

alias r-t='rostopic list'
alias r-e='rostopic echo $1' #Use: 'r-e /arduino/throttle_setpoint'
alias r-i='rostopic info $1' #Use: 'r-i /arduino/throttle_setpoint'
alias rr='rosrun'
#alias å='python ~/coding/dv_useful_scripts/listen_to_tx_ros_network.py'

#To run special programs
alias harald='cd ~/coding/pythonFun/pygame && python main.py && cd ~' #Yes, it's a bad alias...
alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' #Personal for setting Bose QC35 as main sound unit
