# RevolveDV Router PX connection
#export ROS_MASTER_URI=http://10.19.1.10:11311 && export ROS_IP=10.19.1.14

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
alias xo='xdg-open $1'

# Generate project from template
alias new_cpp='. ~/linux-tricks/scripts/new_c++_project.sh'
alias new_latex='. ~/linux-tricks/scripts/new_latex_project.sh'
# TODO: alias new_python='. ~/linux-tricks/scripts/new_python_project.sh'
alias new_note='. ~/linux-tricks/scripts/new_note.sh'
alias copy-sublime-settings='. ~/linux-tricks/scripts/copy-sublime-settings.sh'
alias copy-sublime-keymap='. ~/linux-tricks/scripts/copy-sublime-keymap.sh'

# Open notes
alias notes='subl ~/linux-tricks/notes/'
alias note_linux='subl ~/linux-tricks/notes/linux_notes.md'
alias linux_note='subl ~/linux-tricks/notes/linux_note.md'
alias git_note='subl ~/linux-tricks/notes/git_note.md'
alias bash_note='subl ~/linux-tricks/notes/bash_note.md'
alias python_note='subl ~/linux-tricks/notes/python_note.md'
alias ros_note='subl ~/linux-tricks/notes/ros_note.md'
alias vim_note='subl ~/linux-tricks/notes/vim_note.md'
alias latex_note='subl ~/linux-tricks/notes/latex_note.md'
alias todo='subl ~/linux-tricks/notes/todo.md'
alias docker_note='subl ~/linux-tricks/notes/docker_note.md'
alias dv='subl ~/linux-tricks/notes/r18dv_note.md'

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
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" # Pretty git log. Use: 'git lg'


# ROS
alias killros='killall -9 roscore && killall -9 rosmaster'
alias å='export ROS_IP=192.168.1.10 && export ROS_MASTER_URI=http://192.168.1.10:11311/'
#export ROS_MASTER_URI=http://192.168.1.10:11311 # IP to computer connecting to 
#export ROS_IP=192.168.1.100 # Your own ip

alias r-l='rostopic list'
alias r-n='rosnode list'
alias r-e='rostopic echo $1' #Use: 'r-e /arduino/throttle_setpoint'
alias r-i='rostopic info $1' #Use: 'r-i /arduino/throttle_setpoint'
alias rr='rosrun'
alias o='atom ~/catkin_ws/src'



# Catkin
alias cm='cd ~/catkin_ws && catkin_make && cd - && notification "Catkin_Make Finished" "catkin_make has finished. Return to terminal to see output" 15 "accept.png"' # You can call 'cm' from wherever you want!

# Gazebo
alias gf='killall gzserver && killall gzclient'
alias g-reset='rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0" && sleep 0.5s && rosservice call /gazebo/reset_world'
alias gr='rosservice call /gazebo/set_model_state "{model_state: { model_name: rc_car, pose: { position: { x: 0, y: 0 ,z: 0.2 }, orientation: {x: 0, y: 0, z: 0, w: 1 } }, twist: { linear: {x: 0.0 , y: 0 ,z: 0 } , angular: { x: 0.0 , y: 0 , z: 0.0 } } , reference_frame: world } }" && rosservice call /gazebo/reset_world'
alias g-simnodes='roslaunch r18dv_rc_launch sim_nodes.launch'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/r18dv_gazebo_sim/models

# SSH
alias ø='ssh nvidia@10.19.1.10' #SSH to NVIDIA Jetson TX1
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
# alias harald='cd ~/coding/pythonFun/pygame && python main.py && cd ~' #Yes, it's a bad alias...
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
	# Or just: lazy # This will generate default commit message
	# Will git add everyting in current repo, commit with attached message, and then push
	# Both failed and successfull execution will be notified to user by using notify-send
	# TODO: Pull and push
	# TODO: Add all files and commit all and list all files commited when pushing in notification

	# TODO: Only first word of commit message gets passed unfortunately
	echo "Running Git task in background..."
	function supress() {
		TITLE=""
		MESSAGE=""
		SECONDS_DISPLAYED=15
		if ! doesCommandOutputString "git add ." "fatal"; then 
			echo "Git add . succeeded"
		if [[ $# -eq 0 ]]; then
			echo "Did not get commit message"
			COMMIT_MESSAGE="Im Lazy"
		else
			echo "Did get commit message"
			COMMIT_MESSAGE="$1"
		fi
			if doesCommandOutputString 'git commit -m "$COMMIT_MESSAGE"' "changed"; then
				MESSAGE="New changes commited"
				echo $MESSAGE
			else
				MESSAGE="Nothing new to commit"
				echo $MESSAGE
			fi
			LATEST_COMMIT_INFO="$(git show --stat --oneline HEAD)"
			MESSAGE="$MESSAGE\n\n$LATEST_COMMIT_INFO"
			if doesCommandOutputString "git push" "error"; then
				MESSAGE="Git push rejected. Pulling first"
				echo $MESSAGE
				if doesCommandOutputString "git pull" "CONFLICT"; then
					TITLE="Merge conflict detected"
					MESSAGE="$MESSAGE\nGit pull resulted in merge conflict. Please resolve manually!"
					ICON="fail.jpeg"
				else
					if doesCommandOutputString "git push" "rejected"; then
						TITLE="FUCKED"
					else
						TITLE="Git Add, Commit and Push Succeeded"
						MESSAGE="$MESSAGE\nGit push succeeded, just had to pull first"
						ICON="accept.png"
					fi
				fi
			else
				echo "GIT PUSH Succeeded FIRST TIME"
				TITLE="Git Add, Commit and Push Succeeded"
				MESSAGE="$MESSAGE\nGit push succeeded"
				ICON="accept.png"
			fi
		else
			echo "git add failed"
			TITLE="Git Add failed"
			MESSAGE="Are you sure you are in a Git Repository?"
			ICON="pling.png"
		fi
		notification "$TITLE" "$MESSAGE" $SECONDS_DISPLAYED "$ICON"
	}
	(supress $1 > /dev/null 2>&1 &)
	# (supress $1)
	# Took me like 5 hours to properly supress function output while still passing git commit message
}

function doesCommandOutputString(){
	# Check if Command will echo out anything containing String
	# So much sweat to make this simple function...
	COMMAND=$1
	STRING=$2
	# isInFile=$( $(eval $COMMAND) | grep -c $STRING)
	touch log
	eval $COMMAND >> log 2>&1
	isInFile=$(cat log | grep -c $STRING)
	if [ $isInFile -eq 0 ]; then
		git reset log
	  	rm log
	  	false
	else
		git reset log
	  	rm log
	  	true
	fi
}

function unitTests(){
	echo "UNIT-TESTS"
	echo "Tests for 'doesCommandOutputString"
	cd ~/Documents/tpk4141-studass
	doesCommandOutputString "git push" "To"
	if [ $? -eq 0 ]; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	doesCommandOutputString "git push" "To"
	if ! doesCommandOutputString "git push" "To" ; then 
		echo "FAIL:"
	else
		echo "PASS:"
	fi

	doesCommandOutputString "git push" "Tfdso"
	if [ $? -eq 0 ]; then 
		echo "FAIL:"
	else
		echo "PASS:"
	fi

	doesCommandOutputString "git push" "error"
	if [ $? -eq 0 ]; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	doesCommandOutputString "git push" "failed"
	if [ $? -eq 0 ]; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	doesCommandOutputString "git push" "rejected"
	if [ $? -eq 0 ]; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	doesCommandOutputString "git push" "rejefdsacted"
	if [ $? -eq 0 ]; then 
		echo "FAIL:"
	else
		echo "PASS:"
	fi

	# doesCommandOutputString "git push" "rejefdsacted"
	if doesCommandOutputString "git push" "dthisfdsafs"; then 
		echo "FAIL:"
	else
		echo "PASS:"
	fi

	if doesCommandOutputString "git push" "To"; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	cd ~
	if doesCommandOutputString "git add ." "fatal"; then 
		echo "PASS:"
	else
		echo "FAIL:"
	fi

	if doesCommandOutputString "git add ." "fatfdsafdsafadsal"; then 
		echo "FAIL:"
	else
		echo "PASS:"
	fi
}


# Print notification function
function notification(){
	# Displays notification in top right corner. Very pretty
	# Use: notification <title> <message> <display_time> <icon>
	# Ex: notification "Git Push Successfull" "A git push has been conducted successfully in the background" 5 "accept.png"
	if [ $# -eq 4 ]
	then 
		# echo "hello"
	  	TITLE=$1
	  	MESSAGE=$2
		SECONDS_DISPLAYED=$( expr $3 \* 1000 ) # $3 = seconds
		ICON=$4
	else
		ICON="pling.png"
		if [ $# -eq 3 ]
		  then 
		  	echo "Got only 3 arguments, using default logo"
		  	TITLE=$1
		  	MESSAGE=$2
			SECONDS_DISPLAYED=$( expr $3 \* 1000 ) # $3 = seconds	
		else
			SECONDS_DISPLAYED=$( expr 2 \* 1000 ) 	
			if [ $# -eq 2 ]
		  	then
				echo "Got only 2 arguments, using default logo and 10 sec timeout"

				TITLE=$1
	  			MESSAGE=$2
	  		else
	  			MESSAGE="You got a notification!"
	  			if [ $# -eq 1 ]
	  			then
	  				echo "Got only 1 argument"
	  				TITLE=$1
	  			else
	  				echo "Did not get any arguments. Displaying default notification"
	  				TITLE="Notification!"
	  			fi
	  		fi
		fi
	fi
	notify-send -t $SECONDS_DISPLAYED -u critical -i "$HOME/linux-tricks/templates/icons/$ICON" "$TITLE" "$MESSAGE"
	# $(echo $(pwd))

	# EXTRA INFO
	# - Icons located in linux-tricks/templates/icons
	# - On my machine I have to use the 'critical' tag, if not the notification is not allways displayed
}


function source_catkin_setup_bash_if_exist(){
	if [ -f $HOME/catkin_ws/devel/setup.bash ]; then
		source $HOME/catkin_ws/devel/setup.bash
	fi
}

