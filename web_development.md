Made by Harald Lønsthagen, 22.06.2017

=== THIS IS ONLY TO TEST .md extension


Motivation:
This is a document with fixes encountered on Ubuntu.

=========================================
				LaTeX - fixes
=========================================
Prob: Package babel Error: Unknown option `norsk'
Fix:  
1. Install latex package
sudo apt-get install texlive-lang-european
2. PROFIT!

=========================================
				Ubuntu - fixes
=========================================
1. Restart network service
sudo service network-manager restart

1. Install package
sudo dpkg -i DEB_PACKAGE

1. See bash history
history
2. PROFIT!


1. Liste alle tastatur og muser
xinput --list --short

1. Endre på en parameter for en mus eller tastatur
xinput --set-prop "Razer Razer DeathAdder" "Device Accel Constant Deceleration" 10


1. Liste alle egenskaper til en mus
xinput --list-props "Razer Razer DeathAdder"

1. Set monitor resolutions
xrandr --output DP-1 --mode "3840x2160"



=========================================
				Command line
=========================================
Remove folder and entire content
1.
rm -rf folderName
2. Profit!
---------------------------------
Show current working directory
1. 
pwd
2. PROFIT!
---------------------------------
Set bose headset as sound output
1. 
pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4
2. PROFIT!


=========================================
				Jetson TX1 fixes
=========================================

1. top -> se hvilke oppgaver som kjøres
top
2. drepe 
pkill <id>
3. 
systemctl stop apt-daily.service
systemctl kill --kill-who=all apt-daily.service
4. https://unix.stackexchange.com/questions/315502/how-to-disable-apt-daily-service-on-ubuntu-cloud-vm-image

systemctl disable apt-daily.timer
systemctl disable apt-daily.service

=========================================
				Random - fixes
=========================================


=========================================
				Web Development - fixes
=========================================
Install gulp.
1. sudo on linux
sudo npm install --global gulp-cli
2. PROFIT!
Hvis det ikke fungerer
1. 
npm install -g gulp
2. Profit!
Jeg installerte først ikke gulp globalt, så neste mappe jeg 
trengte gulp i fungerte det ikke lenger.

Fungerer fortsatt ikke:
npm install --save-dev gulp-install

sudo npm install del
sudo npm install gulp-load-plugins
sudo npm install -g bower gulp


Installere NODEJS
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs


=========================================
				Digital Ocean Droplet
=========================================
SETUP NEW DROPLED - DIGITAL OCEAN
Når man har kommet inn. Kjør følgende eksempler

1.
apt-get update
2.
apt-get install nginx
3.
service nginx reload
4.
service nginx restart
Nå har man default nginx side på serveren som hostes.


Reloade serveren
service nginx reload
service nginx restart


Notes about digitalOcean and all tricks.

General info:
ip:
46.101.198.183
Memory: 512 MB
Disk: 20 GB
OS: Ubuntu 16.04.2 x64

SSH - connecting: 
ssh root@46.101.198.183
pw:
TastaturMusSkjerm0
==== Brukere
ssh harald@46.101.198.183
pw:
KanskjeKommerKongen10

----------------------
SSH-tunneling
ssh -L 8006:localhost:8888 root@46.101.198.183

----------------
Sende lokal mappe til droplet over ssh
rsync -avz -e 'ssh' coding/pythonFun/ root@46.101.198.183:/documents/coding/

Denne er smart så den bare overfører det som er forskjellig. 
Merk at man kan kun lage en ny mappe der man overfører til. 
Så cmd over vil lage en ny mappe "coding" på droplet, og legge alle filene fra pythonFun i den. 
Det vil IKKE bli laget noe ny mappe pythonFun på droplet.
------------------
Sende mappe fra droplet til lokal
rsync -avz -e 'ssh' root@46.101.198.183:/documents/coding/telenor_summer_2017 coding/telenor_summer_2017/

------------------
apt-get -y install 
-y sier bare yes til spørsmål som kommer opp


# Shell commands
Størrelse på mappe/mapper
du -sh *

Spesifikk mappe om * = mappenavn
-------------------
Sjekk antall filer i mappe/folder/directory
ls -l . | egrep -c '^-'

Note: Først cd til mappen

==== Legge til ny bruker
1.
adduser <navn-på-ny-bruker>
2. Så fyll inn spørsmål som kommer

==== Fiks sudo rettigherer til en bruker
1.
usermod -aG sudo <navn-på-bruker>

==== Restrict SSH user to one folder
https://ubuntuforums.org/showthread.php?t=1719094


========= SSH Setup of users and stuff
==== make ssh-key pair
ssh-keygen

==== Copy key-pair to server
1.
ssh-copy-id sammy@your_server_ip
I think this is necessary since I've Disable Password Authentication 
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

==== Configure timezone
sudo dpkg-reconfigure tzdata

==== Pause a program
1. start program
python foo.py
2. pause program
ctr-z
3. restart program
fg
4. List all paused programs
jobs
5. Resume program based on index
when writing jobs, it wil be a list of programs paused. The first program paused will get the smallest index
fg %2
to start process 2 again.
Usefull tut: https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys

=================================
Public-key 
sudo nano /etc/ssh/sshd_config

PubkeyAuthentication yes
ChallengeResponseAuthentication no





========================================
	Problem fixes during install
========================================

During this tut:
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-jupyter-notebook-to-run-ipython-on-ubuntu-16-04
This fixed issue when doing this command:
sudo -H pip install jupyter
Fix:
https://stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting

----------------------
During installing environment
prob: 
pyvenv my_env
Error:
The virtual environment was not created successfully because ensurepip is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

Fix: 
https://stackoverflow.com/questions/39539110/pyvenv-not-working-because-ensurepip-is-not-available
-----


=========================================
				Git Commands
=========================================
1. Set global user.email on computer
git config --global user.email "email@example.com"
2. Profit!


1. Set user.email on single repository
git config user.email "email@example.com"
2. PROFIT!








