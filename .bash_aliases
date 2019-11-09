# Harald's Bash Aliases
## Contains various aliases for many different tasks

# ------- General aliases --------
# Most used aliases
alias l='ls -lhG'
alias ..='cd ..'
alias c='clear'
alias b='$editor ~/.bashrc'
alias bb='$editor ~/linux-tricks/.bash_aliases' 
alias r='ranger'
alias s='source ~/.bashrc && source_catkin_setup_bash_if_exist'
alias g='git status' # Really useful!
# If you don't want to use the default settings, you can change them here
# This file is added to .gitignore so you don't need to worry
source ~/linux-tricks/.personal_settings

# Other useful aliases
alias la='ls -alhG'
alias bbb='$editor ~/linux-tricks/installs/install_basic_linux_programs.sh'
alias bbb_i='~/linux-tricks/installs/install_basic_linux_programs.sh'
alias h='history'
alias hf='history | grep $1' # Ex: 'hf <searchword>' -> 'hf git'
alias ...='cd ../..'
alias ....='cd ../../..'
alias comp='docker-compose'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' # Ex: 'alert "Hello World!"'
alias myip="curl http://ipecho.net/plain; echo" # curl must be installed
alias xo='xdg-open $1'
alias ssha='ssh -i ~/coding/jenkins/key.pem ubuntu@ec2-13-53-69-228.eu-north-1.compute.amazonaws.com'
alias sshi='ssh -i ~/coding/jenkins/jenkins-ireland.pem ubuntu@ec2-34-243-237-49.eu-west-1.compute.amazonaws.com'
alias sshb='ssh -i "~/coding/jenkins/build-server.pem" ec2-user@ec2-54-246-223-185.eu-west-1.compute.amazonaws.com'
alias sshb2='ssh -i "~/coding/jenkins/build-server.pem" ec2-user@ec2-18-203-23-195.eu-west-1.compute.amazonaws.com'
#alias sshb='ssh -i "~/coding/jenkins/build-server.pem" ec2-user@ec2-54-246-223-185.eu-west-1.compute.amazonaws.com'
# Generate project from template
alias new_cpp='. ~/linux-tricks/scripts/new_c++_project.sh'
alias new_latex='. ~/linux-tricks/scripts/new_latex_project.sh'
# TODO: alias new_python='. ~/linux-tricks/scripts/new_python_project.sh'
alias new_note='. ~/linux-tricks/scripts/new_note.sh'
alias copy-sublime-settings='. ~/linux-tricks/scripts/copy-sublime-settings.sh' #TODO: Check if works
alias copy-sublime-keymap='. ~/linux-tricks/scripts/copy-sublime-keymap.sh' #TODO: Check if works
alias razer='. ~/linux-tricks/scripts/set_razer_sensitivity.sh'

# Changing other programs
alias tmux='tmux -2'

# Open notes
alias notes='subl ~/linux-tricks/notes/ ~/latex-documents/ ~/notes/'
alias linux_note='subl ~/linux-tricks/notes/linux_note.md'
alias git_note='subl ~/linux-tricks/notes/git_note.md'
alias bash_note='subl ~/linux-tricks/notes/bash_note.md'
alias python_note='subl ~/linux-tricks/notes/python_note.md'
alias ros_note='subl ~/linux-tricks/notes/ros_note.md'
alias vim_note='subl ~/linux-tricks/notes/vim_note.md'
alias latex_note='subl ~/linux-tricks/notes/latex_note.md'
alias todo='subl ~/linux-tricks/notes/todo_note.md'
alias docker_note='subl ~/linux-tricks/notes/docker_note.md'
alias dv='subl ~/linux-tricks/notes/r18dv_note.md'
alias react-notes='subl ~/linux-tricks/notes/react-notes.md'

# -------- Git --------
alias g-s='git status'
alias g-a='git add' # Ex: 'git add main.cpp'
alias g-aa='git add *' # Caution! This adds all files
alias g-a-a='git add *' # Caution! This adds all files
alias g-c='git commit -m' #Ex: 'g-c "This is a commit message"'
alias g-r='git reset' # Not testet yet
alias g-dd='git diff' # Not tested yet, but should be 'g-dd main.py'
alias g-d='git pull' # d for download
alias g-u='gitpush' # u for upload
alias g-v='git remote -v'
alias g-user='git config --global user.email' # Ex: 'g-user haraldlons@gmail.com'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global status.submoduleSummary true 
git config --global alias.diff "diff --word-diff"
git config --global alias.branch "branch -ra"
git config --global alias.ai "add --interactive"
git config --global alias.dc "diff --cached"

function gitpush(){
	git push --porcelain 2>&1 | tee ~/linux-tricks/.output.log 

	if (cat ~/linux-tricks/.output.log) | grep -q 'error'; then
		notification "Git Push Unsuccessfull" "Please check console output" 5 "fail.png"
	elif (cat ~/linux-tricks/.output.log) | grep -q '='; then
		notification "Git Push Successfull" "Everything up to date" 5 "accept.png"
	else
		notification "Git Push Successfull" "Successfull pushed new files to origin" 5 "accept.png"
	fi
	rm ~/linux-tricks/.output.log
}

# -------- ROS --------
alias killros='killall -9 roscore && killall -9 rosmaster'
alias å='export ROS_IP=192.168.1.10 && export ROS_MASTER_URI=http://192.168.1.10:11311/'
alias r-l='rostopic list'
alias r-n='rosnode list'
alias r-e='rostopic echo $1' #Use: 'r-e /arduino/throttle_setpoint'
alias r-i='rostopic info $1' #Use: 'r-i /arduino/throttle_setpoint'
alias rr='rosrun'
alias o='subl ~/catkin_ws/src'


# -------- Gazebo --------
alias gf='killall gzserver && killall gzclient'
alias g-reset='rostopic pub /throttle_setpoint std_msgs/UInt16 "data: 0" && sleep 0.5s && rosservice call /gazebo/reset_world'
alias gr='rosservice call /gazebo/set_model_state "{model_state: { model_name: rc_car, pose: { position: { x: 0, y: 0 ,z: 0.2 }, orientation: {x: 0, y: 0, z: 0, w: 1 } }, twist: { linear: {x: 0.0 , y: 0 ,z: 0 } , angular: { x: 0.0 , y: 0 , z: 0.0 } } , reference_frame: world } }" && rosservice call /gazebo/reset_world'
alias g-simnodes='roslaunch r18dv_rc_launch sim_nodes.launch'
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/catkin_ws/src/r18dv_gazebo_sim/models

# SSH
alias ø='ssh nvidia@10.19.1.10' #SSH to NVIDIA Jetson TX1
# Will exit from ranger to folder viewed in ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
	
if [ ! -z ${IWantHaraldsPersonalAliases+x} ];
then 
	# Harald's personal aliases will by default NOT be set
	# If you want them, you have to add 'export IWantHaraldsPersonalAliases=true' to your .bashrc file
	#export ROS_MASTER_URI=http://10.19.1.10:11311 && export ROS_IP=10.19.1.14

	alias clion="~/programs/clion-2018.2/bin/clion.sh"
	alias tidal='cd ~/programs/tidal-music-linux && npm start'
	alias synctx='fusermount -u ~/tx_catkin_ws && rm -rf ~/tx_catkin_ws && mkdir -p ~/tx_catkin_ws && sshfs nvidia@192.168.1.10:/home/nvidia/catkin_ws/src ~/tx_catkin_ws && cd ~/tx_catkin_ws'
	alias cdu='cd ~/linux-tricks'
	alias cdus='subl ~/linux-tricks'
	alias cdc='cd ~/catkin_ws/src/'
	alias cdcs='subl ~/catkin_ws/src/'
	alias cdr='cd ~/revolve_ntnu_team_2018'
	alias cdrs='subl ~/revolve_ntnu_team_2018'
	alias f='pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4 && exit' # Set Bose QC35 as main sound unit
	alias sshasker='ssh lons@85.165.206.231'
	alias sshaskert='ssh -N -L localhost:8889:localhost:8889 lons@85.165.206.231'

	# Open notes
	alias experiences='subl ~/Documents/career/pai/pai-experiences.md'
	alias questions='subl ~/Documents/career/pai/pai-questions.md'
	alias øystein='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/øystein_member_profile.txt'
	alias marcus='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/marcus_member_profile.txt'
	alias edvard='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/edvard_member_profile.txt'
	alias morten='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/morten_member_profile.txt'
	alias paul='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/paul_member_profile.txt'
	alias sondre='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/sondre_member_profile.txt'
	alias mathias='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/mathias_member_profile.txt'
	alias didrik='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/didrik_member_profile.txt'
	alias bo='subl ~/revolve_ntnu_team_2018/1_meeting_notes/6_personal_and_individual_meetings/member_profiles/bo_member_profile.txt'
	alias bjørn='subl ~/Documents/project-thesis-aventi/organizational/meetings/18-12-03-møte-bjørn.md'
fi


# --------------- Functions -----------------
function extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

function source_catkin_setup_bash_if_exist(){
	if [ -f $HOME/catkin_ws/devel/setup.bash ]; then
		source $HOME/catkin_ws/devel/setup.bash
	fi
}


function cm(){
	# Cd's to catkin_ws, tries to run 'catkin_make', prints notification in top right corner with status of compilation
	# Useful for running in the background

	cd ~/catkin_ws
	if catkin_make; then
	    echo "Catkin_Make Compilation True"
	    notification "Catkin_Make Compilation Succeeded" "Return to terminal to see output" 15 "accept.png"
	else
	    echo "Catkin_Make Failed"
	    notification "Catkin_Make Compilation Failed" "Return to terminal to see output" 15 "fail.png"
	fi
	cd -
}


function lazy() {
	# Use: lazy "commit message" 
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
					ICON="fail.png"
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



# Print notification function
function notification(){
	# Displays notification in top right corner. Very pretty
	# Use: notification <title> <message> <display_time> <icon>
	# Ex: notification "Git Push Successfull" "A git push has been conducted successfully in the background" 5 "accept.png"
	if [ $# -eq 4 ] # TODO: Use else if
	then 
		# echo "hello"
	  	TITLE=$1
	  	MESSAGE=$2
		SECONDS_DISPLAYED=$( expr $3 \* 1000 ) # $3 = seconds
		TIMEOUT=7
		ICON=$4
	else
		ICON="pling.png"
		if [ $# -eq 3 ]
		  then 
		  	echo "Got only 3 arguments, using default logo"
		  	TITLE=$1
		  	MESSAGE=$2
			SECONDS_DISPLAYED=$( expr $3 \* 1000 ) # $3 = seconds	
			# TIMEOUT=$3
		else
			SECONDS_DISPLAYED=$( expr 7 \* 1000 ) 	
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

	
		# $( notify-send -t $SECONDS_DISPLAYED -u critical -i "$HOME/linux-tricks/templates/icons/$ICON" "$TITLE" "$MESSAGE"
	 # 	$( sleep $s3 && pkill notify-osd) )
	# TODO: Correct timeout duration
	($( notify-send -t $SECONDS_DISPLAYED -u critical -i "$HOME/linux-tricks/templates/icons/$ICON" "$TITLE" "$MESSAGE" && $( sleep $(echo $SECONDS_DISPLAYED) && killall notify-osd) ) > /dev/null 2>&1 &)
	# $(echo $(pwd))

	# EXTRA INFO
	# - Icons located in linux-tricks/templates/icons
	# - On my machine I have to use the 'critical' tag, if not the notification is not allways displayed
}

# Some unit tests
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
