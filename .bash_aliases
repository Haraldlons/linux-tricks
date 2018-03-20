# General aliases
alias ll='ls -alF'
alias la='ls -alhG'
alias l='ls -lhG'
alias ..='cd ..'
alias c='clear'
alias s='source ~/.bashrc && source ~/catkin_ws/devel/setup.bash'
#alias s='source ~/.bashrc'
alias b='vim ~/.bashrc'
alias bb='vim ~/useful_computer_notes/.bash_aliases'
alias bbb='vim ~/useful_computer_notes/useful_programs.sh'
alias bbb_i='~/useful_computer_notes/useful_programs.sh'
alias h='history'
alias hf='history | grep $1' # Ex: 'hf <searchword>' -> 'hf git'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # Ex: 'alert "Hello World!"'
alias myip="curl http://ipecho.net/plain; echo"

# Generate project from template
alias new_cpp='. ~/useful_computer_notes/scripts/new_c++_project.sh'
alias new_latex='. ~/useful_computer_notes/scripts/new_latex_project.sh'
alias new_note='. ~/useful_computer_notes/scripts/new_note.sh'

# Open notes
alias note_linux='subl ~/useful_computer_notes/linux_notes.md'
alias note_git='subl ~/useful_computer_notes/git_notes.md'
alias note_bash='subl ~/useful_computer_notes/bash_notes.md'
alias note_python='subl ~/useful_computer_notes/python_notes.md'
alias note_ros='subl ~/useful_computer_notes/ros_notes.md'
alias note_vim='subl ~/useful_computer_notes/vim_notes.md'
alias note_latex='subl ~/useful_computer_notes/latex_notes.md'
alias note_todo='subl ~/useful_computer_notes/todo.md'

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


# Gazebo
alias g-fix='killall gzserver && killall gzclient'
alias g-reset='rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0" && sleep 0.5s && rosservice call /gazebo/reset_world'
#alias g-reset='rosservice call /gazebo/reset_world && rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0"'
alias g-simnodes='roslaunch r18dv_rc_launch sim_nodes.launch'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/r18dv_gazebo_sim/models

# SSH
alias ø='ssh nvidia@192.168.1.10' #SSH to NVIDIA Jetson TX1
alias synctx='fusermount -u ~/tx_catkin_ws && rm -rf ~/tx_catkin_ws && mkdir -p ~/tx_catkin_ws && sshfs nvidia@192.168.1.10:/home/nvidia/catkin_ws/src ~/tx_catkin_ws && cd ~/tx_catkin_ws'

## Harald's personal aliases

# Easy navigation of folders
alias cdu='cd ~/useful_computer_notes'
alias cdus='subl ~/useful_computer_notes'
alias cdc='cd ~/catkin_ws/src/'
alias cdcs='subl ~/catkin_ws/src/'

# To run special programs
alias note='python ~/coding/dv_useful_scripts/make_new_note.py'
alias harald='cd ~/coding/pythonFun/pygame && python main.py && cd ~' #Yes, it's a bad alias...
alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' #Personal for setting Bose QC35 as main sound unit

# Open notes
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

