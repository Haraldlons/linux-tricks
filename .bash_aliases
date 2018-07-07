# General aliases
alias ll='ls -alF'
alias la='ls -alhG'
alias l='ls -lhG'
alias ..='cd ..'
alias c='clear'
alias s='source ~/.bashrc && source_catkin_setup_bash_if_exist'
#alias s='source ~/.bashrc'
alias b='vim ~/.bashrc'
alias bb='vim ~/linux-tricks/.bash_aliases'
alias bbb='vim ~/linux-tricks/useful_programs.sh'
alias bbb_i='~/linux-tricks/useful_programs.sh'
alias h='history'
alias hf='history | grep $1' # Ex: 'hf <searchword>' -> 'hf git'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # Ex: 'alert "Hello World!"'
alias myip="curl http://ipecho.net/plain; echo"
alias xopen='xdg-open $1'

# Generate project from template
alias new_cpp='. ~/linux-tricks/scripts/new_c++_project.sh'
alias new_latex='. ~/linux-tricks/scripts/new_latex_project.sh'
# TODO: alias new_python='. ~/linux-tricks/scripts/new_python_project.sh'
alias new_note='. ~/linux-tricks/scripts/new_note.sh'
alias copy-sublime-settings='. ~/linux-tricks/scripts/copy-sublime-settings.sh'
alias copy-sublime-keymap='. ~/linux-tricks/scripts/copy-sublime-keymap.sh'

# Open notes
alias notes='subl ~/linux-tricks/notes'
alias note_linux='subl ~/linux-tricks/notes/linux_notes.md'
alias note_git='subl ~/linux-tricks/notes/git_notes.md'
alias note_bash='subl ~/linux-tricks/notes/bash_notes.md'
alias note_python='subl ~/linux-tricks/notes/python_notes.md'
alias note_ros='subl ~/linux-tricks/notes/ros_notes.md'
alias note_vim='subl ~/linux-tricks/notes/vim_notes.md'
alias note_latex='subl ~/linux-tricks/notes/latex_notes.md'
alias note_todo='subl ~/linux-tricks/notes/todo.md'
alias note_docker='subl ~/linux-tricks/notes/docker_notes.md'
alias dv='subl ~/linux-tricks/notes/r18dv_notes.md'

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
# Pretty git log -> 'git lg'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


# ROS
alias å='export ROS_IP=192.168.1.10 && export ROS_MASTER_URI=http://192.168.1.10:11311/'
#export ROS_MASTER_URI=http://192.168.1.10:11311 # IP to computer connecting to
#export ROS_IP=192.168.1.100 # Your own ip
alias r-l='rostopic list'
alias r-n='rosnode list'
alias r-e='rostopic echo $1' #Use: 'r-e /arduino/throttle_setpoint'
alias r-i='rostopic info $1' #Use: 'r-i /arduino/throttle_setpoint'
alias rr='rosrun'
alias o='atom ~/catkin_ws/src'

# RevolveDV Router PX connection
#export ROS_MASTER_URI=http://10.19.1.10:11311 && export ROS_IP=10.19.1.14

# Catkin
alias cm='cd ~/catkin_ws && catkin_make && cd -' # You can call 'cm' from wherever you want!


# Gazebo
alias gf='killall gzserver && killall gzclient'
alias g-reset='rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0" && sleep 0.5s && rosservice call /gazebo/reset_world'
alias gr='rosservice call /gazebo/set_model_state "{model_state: { model_name: rc_car, pose: { position: { x: 0, y: 0 ,z: 0.2 }, orientation: {x: 0, y: 0, z: 0, w: 1 } }, twist: { linear: {x: 0.0 , y: 0 ,z: 0 } , angular: { x: 0.0 , y: 0 , z: 0.0 } } , reference_frame: world } }" && rosservice call /gazebo/reset_world'
alias g-simnodes='roslaunch r18dv_rc_launch sim_nodes.launch'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/r18dv_gazebo_sim/models

# SSH
alias ø='ssh nvidia@192.168.1.10' #SSH to NVIDIA Jetson TX1
alias synctx='fusermount -u ~/tx_catkin_ws && rm -rf ~/tx_catkin_ws && mkdir -p ~/tx_catkin_ws && sshfs nvidia@192.168.1.10:/home/nvidia/catkin_ws/src ~/tx_catkin_ws && cd ~/tx_catkin_ws'

## Harald's personal aliases
alias tidal='cd ~/programs/tidal-music-linux && npm start'

# Easy navigation of folders
alias cdu='cd ~/linux-tricks'
alias cdus='subl ~/linux-tricks'
alias cdc='cd ~/catkin_ws/src/'
alias cdcs='subl ~/catkin_ws/src/'
alias cdr='cd ~/revolve_ntnu_team_2018'
alias cdrs='subl ~/revolve_ntnu_team_2018'

# To run special programs
#alias note='python ~/coding/dv_useful_scripts/make_new_note.py'
alias harald='cd ~/coding/pythonFun/pygame && python main.py && cd ~' #Yes, it's a bad alias...
alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' #Personal for setting Bose QC35 as main sound unit

# Open notes
alias øystein='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/øystein_member_profile.txt'
alias marcus='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/marcus_member_profile.txt'
alias edvard='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/edvard_member_profile.txt'
alias morten='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/morten_member_profile.txt'
alias paul='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/paul_member_profile.txt'
alias sondre='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/sondre_member_profile.txt'

alias mathias='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/mathias_member_profile.txt'
alias didrik='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/didrik_member_profile.txt'
alias bo='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/bo_member_profile.txt'


# --------------- Functions -----------------

function lazy() {
	# Use: lazy "this is a commit message" 
	# Will git add everyting in current repo, commit with attached message, and then push
	# Both failed and successfull execution will be notified to user by using notify-send

	echo "Running Git task in background..."
	function supress() {
			if [ -z "$(git add .)" ]; then 
				echo "'Git add .' succeeded"
			    if [[ "$( git commit -m "$1" )" == *"changed"* ]]; then
					# echo "'Git commit -m $1' succeeded"
					GIT_PUSH_OUTPUT_FILEPATH=git_push_output.txt
					git push &> $GIT_PUSH_OUTPUT_FILEPATH
					if grep -q "failed" "$GIT_PUSH_OUTPUT_FILEPATH"; then
						# echo "Git push failed"
			    		notify-send -t 15000 -u critical -i ~/linux-tricks/templates/icons/fail.jpeg "Git Push Failed!" "$(echo -e "Failed to push changes to GitHub. You should pull before you push. Current folder: \n$(echo $(pwd))" )"
					else
						# echo "Git push succeeded"
			    		notify-send -t 15000 -u critical -i ~/linux-tricks/templates/icons/accept.png "Git Push Succeeded!" "$(echo -e "Successfully added, commited and pushed all changes to github in folder: \n$(echo $(pwd))" )"
					fi
					rm $GIT_PUSH_OUTPUT_FILEPATH
				else
					# echo "No files to commit"
				    notify-send -t 15000 -u critical -i ~/linux-tricks/templates/icons/fail.jpeg "No files to commit" "Seems like all files have already been commited in folder:\n $(echo $(pwd))"
			    fi
			else
				# echo "'Git add .' failed"
			    notify-send -t 15000 -u critical -i ~/linux-tricks/templates/icons/fail.png "'Git add .' failed" "Something went wrong when adding"
			fi
	}
	(supress "$1" > /dev/null 2>&1 &)
	# Took me like 5 hours to properly supress function output while still passing git commit message
}

function source_catkin_setup_bash_if_exist(){
	if [ -f $HOME/catkin_ws/devel/setup.bash ]; then
		source $HOME/catkin_ws/devel/setup.bash
	fi
}
