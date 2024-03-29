Made by Harald Lønsethagen, 22.06.2017

Motivation:
This is a document with fixes encountered on Ubuntu.

## Latex Fixes
#### Install norwegian
Problem: Package babel Error: Unknown option `norsk`.
- Install latex package
```bash
sudo apt-get install texlive-lang-european
```

## Ubuntu - fixes
#### Restart network service
```bash
sudo service network-manager restart
```

#### Install a .deb package
```bash
sudo dpkg -i DEB_PACKAGE
```

#### Install a .tar package
```bash
mkdir foldername
mv filename.tar foldername
cd foldername
sudo tar -xvf filename.tar
./setup.sh
```

#### See bash history
```bash
history
```

#### Liste alle tastatur og muser
```bash
xinput --list --short
```
#### Change Razer DeathAdder sensitivity
```bash
xinput --set-prop "Razer Razer DeathAdder" "Device Accel Constant Deceleration" 10
```

#### List all properties of a mouse
```bash
xinput --list-props "Razer Razer DeathAdder"
```

#### Set monitor resolution
```bash
xrandr --output DP-1 --mode "3840x2160"
```

#### Unable to parse ...lists
```bash
sudo rm -vf /var/lib/apt/lists/*
sudo apt-get update
```
- `-v, --verbose` explain what is being done

- `-f, --force` ignore nonexistent files and arguments, never prompt

#### How to use PPA's
https://askubuntu.com/questions/4983/what-are-ppas-and-how-do-i-use-them

## Command line

```bash
# Remove folder and entire content
rm -rf folderName
# Show current working directory
pwd
# See which tasks is running
top
# Kill a task
pkill <id>
```

#### Connect Bose QC 35 to Linux Ubuntu
https://askubuntu.com/a/885198

#### Set bose headset as sound output
```bash
pacmd set-default-sink bluez_sink.04_52_C7_7A_CF_F4
```

## Jetson TX1 fixes and commands

```bash
systemctl stop apt-daily.service
systemctl kill --kill-who=all apt-daily.service
```
From: https://unix.stackexchange.com/questions/315502/how-to-disable-apt-daily-service-on-ubuntu-cloud-vm-image
```bash
systemctl disable apt-daily.timer
systemctl disable apt-daily.service
```
## Web Development
#### Install gulp
```bash
sudo npm install --global gulp-cli
```
if not work:

```bash
npm install -g gulp
```
If it still dosn't work:
```bash
npm install --save-dev gulp-install
```
```bash
sudo npm install del
sudo npm install gulp-load-plugins
sudo npm install -g bower gulp
```

#### Install NodeJS
```bash
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## Digital Ocean Droplet
#### Setup of new dropled
When first logged in, it is recommended to run the following examples

```bash
apt-get update
apt-get install nginx
service nginx reload
service nginx restart
```
#### Restart Nginx hosted site
```bash
service nginx reload
service nginx restart
```
#### General notes about Digital Ocean

ip:
46.101.198.183
Memory: 512 MB
Disk: 20 GB
OS: Ubuntu 16.04.2 x64

SSH - connecting:
ssh root@46.101.198.183
pw:

==== Brukere
ssh harald@46.101.198.183
pw:


## Networking and SSH

### Mount TX catkin/src on own pc

```
mkdir -p ~/tx_catkin_ws && sshfs nvidia@192.168.1.10:/home/nvidia/catkin_ws/src ~/tx_catkin_ws
```

### Unmount
```
fusermount -u <mountpoint>
```
Sometimes you need to unmount the tx_catkin_ws folder because shit happens


----------------------
SSH-tunneling
```bash
ssh -L 8006:localhost:8888 root@46.101.198.183
```
----------------
Sende lokal mappe til droplet over ssh
```bash
rsync -avz -e 'ssh' coding/pythonFun/ root@46.101.198.183:/documents/coding/
```

Denne er smart så den bare overfører det som er forskjellig.
Merk at man kan kun lage en ny mappe der man overfører til.
Så cmd over vil lage en ny mappe "coding" på droplet, og legge alle filene fra pythonFun i den.
Det vil IKKE bli laget noe ny mappe pythonFun på droplet.
------------------
Sende mappe fra droplet til lokal
rsync -avz -e 'ssh' root@46.101.198.183:/documents/coding/telenor_summer_2017 coding/telenor_summer_2017/

------------------
```bash
apt-get -y install #-y sier bare yes til spørsmål som kommer opp
```

#### Shell commands
Størrelse på mappe/mapper
```bash
du -sh *
```
Spesifikk mappe om * = mappenavn
-------------------
Sjekk antall filer i mappe/folder/directory
```bash
ls -l . | egrep -c '^-'
```
Note: Først cd til mappen

==== Legge til ny bruker
1.
```bash
adduser <navn-på-ny-bruker>
```
2. Så fyll inn spørsmål som kommer

==== Fiks sudo rettigherer til en bruker
1.
```bash
usermod -aG sudo <navn-på-bruker>
```
==== Restrict SSH user to one folder
https://ubuntuforums.org/showthread.php?t=1719094


========= SSH Setup of users and stuff
==== make ssh-key pair
```bash
ssh-keygen
```
==== Copy key-pair to server
1.
```bash
ssh-copy-id sammy@your_server_ip
```
I think this is necessary since I've Disable Password Authentication
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

==== Configure timezone
```bash
sudo dpkg-reconfigure tzdata
```
==== Pause a program
1. start program
```bash
python foo.py
```
2. pause program
```bash
ctr-z
```bash
3. restart program
```
fg
```bash
4. List all paused programs
```
jobs
```
5. Resume program based on index
when writing jobs, it wil be a list of programs paused. The first program paused will get the smallest index
```bash
fg %2
```
to start process 2 again.
Usefull tut: https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys

#### Public-key
```bash
sudo nano /etc/ssh/sshd_config
```
PubkeyAuthentication yes
ChallengeResponseAuthentication no




#### Problem fixes during install

During this tut:
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-jupyter-notebook-to-run-ipython-on-ubuntu-16-04
This fixed issue when doing this command:
```bash
sudo -H pip install jupyter
```
Fix:
https://stackoverflow.com/questions/14547631/python-locale-error-unsupported-locale-setting

----------------------
During installing environment
prob:
```bash
pyvenv my_env
```
Error:
The virtual environment was not created successfully because ensurepip is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

Fix:
https://stackoverflow.com/questions/39539110/pyvenv-not-working-because-ensurepip-is-not-available
-----

#### How to install WhatPulse
===
https://www.youtube.com/watch?v=GI2L_gCRjBk
https://basicsysadmin.com/How_to_Install_WhatPulse_in_Ubuntu


## Permission

### Make file executable
```bash
#chmod +x <filename>
chmod +x run_file
```
---

### Give a file all permission

# Useful programs for Linux
Here is a list of useful programs for Linux

```
sublime text 3
whatpulse
slack
ckb
git kraken
vlc
gimp
screensaver
pycharm
```

## Install Tidal on Linux
1.
```bash
sudo apt install aptitude
sudo aptitude install pepperflashplugin-nonfree browser-plugin-freshplayer-pepperflash

sudo apt-get install libssl1.0-dev
sudo apt-get install nodejs-dev
sudo apt-get install node-gyp
sudo apt-get install npm

cd ~
# Clone this repository
git clone https://github.com/Bunkerbewohner/tidal-music-linux
# Go into the repository
cd tidal-music-linux
# Install dependencies and run the app
npm install && npm start
```
