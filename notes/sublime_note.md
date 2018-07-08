##### Table of Contents  
[Headers](#headers)  
[Emphasis](#emphasis)  
...snip...    
<a name="headers"/>


## How to update sublime text 3
1. Remove current sublime version
```bash
sudo apt-get remove sublime-text
```
2. Install new version
[Installation link](https://www.sublimetext.com/docs/3/linux_repositories.html)
```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

## Remove automatic loading of last session
If you struggle with sublime remember last session, and when you open a folder you also open the last folder you previously worked on. This can be annoying.
1. Go to: "Preferences -> Settings"
Add the following: 
```
{
  "hot_exit": false,
  "remember_open_files": false
}
```
[Link](https://forum.sublimetext.com/t/disable-automatic-loading-of-last-session/4132/8)