# General aliases
alias ll='ls -alF'
alias la='ls -alhG'
alias l='ls -lhG'
alias ..='cd ..'
alias c='clear'
alias s='source ~/.bashrc && source ~/catkin_ws/devel/setup.bash'
alias b='nano ~/.bashrc'
alias bb='nano ~/useful_computer_notes/.bash_aliases'
alias h='history'
alias hf='history | grep $1' # Ex: 'hf <searchword>' -> 'hf git'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # Ex: 'alert "Hello World!"'

# Git aliases
alias g='git status' # Really useful!
alias g-s='git status'
alias g-a='git add' # Ex: 'git add main.cpp'
alias g-aa='git add *' # Caution! This adds all files
alias g-a-a='git add *' #WARNING! This add all files
alias g-c='git commit -m' #Ex: 'g-c "This is a commit message"'
alias g-r='git reset' # Not testet yet
alias g-dd='git diff' # Not tested yet, but should be 'g-dd main.py'
alias g-d='git pull' # d for download
alias g-u='git push' # u for upload
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
alias o='atom ~/catkin_ws/src'

# Warning! Use these lines when you want to connect to another computers ROS-network
#export ROS_MASTER_URI=http://192.168.1.19:11311 # IP to computer connecting to
#export ROS_IP=192.168.1.100 # Your own ip

# Catkin
alias cm='cd ~/catkin_ws && catkin_make && cd -' # You can call 'cm' from wherever you want!
alias co='cd ~/catkin_ws/src/r18dv_rc_nodes/'


# Gazebo
alias g-fix='killall gzserver && killall gzclient'
alias g-reset='rosservice call /gazebo/reset_world && rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0"'
alias g-simnodes='roslaunch r18dv_rc_launch sim_nodes.launch'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/r18dv_rc_car_gazebo/models
export EDITOR='nano -w'


## Harald's personal aliases

# To run special programs
alias note='python ~/coding/dv_useful_scripts/make_new_note.py'
alias harald='cd ~/coding/pythonFun/pygame && python main.py && cd ~' #Yes, it's a bad alias...
alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' #Personal for setting Bose QC35 as main sound unit

# Open notes
alias cs-notes='subl ~/useful_computer_notes/'
alias øystein='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/øystein_member_profile.txt'
alias marcus='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/marcus_member_profile.txt'
alias edvard='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/edvard_member_profile.txt'
alias morten='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/morten_member_profile.txt'
alias paul='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/paul_member_profile.txt'
alias sondre='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/sondre_member_profile.txt'
alias mathias='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/mathias_member_profile.txt'
alias didrik='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/didrik_member_profile.txt'
alias bo='subl ~/revolve\ ntnu\ 2017/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/bo_member_profile.txt'


# Computer Architecture TDT4260
alias ca-ssh='ssh leskraas@tdt4260-leskraas.idi.ntnu.no'
alias ca-sync='sshfs leskraas@tdt4260-leskraas.idi.ntnu.no:/opt/framework ~/Documents/01\ -\ Datamaskinarkitektur/ntnu-server/'

# Design of digital systems

# Setting Razer DeathAdder Mouse Sensitivity
mouse=` xinput | grep DeathAdder | awk '{print $6}' | awk 'BEGIN {FS="=";} {print $2}'`
xinput --set-prop $mouse "Device Accel Constant Deceleration" 10
xinput --set-prop $mouse "Device Accel Velocity Scaling" 1
