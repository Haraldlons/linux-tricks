# Python tricks, tips and general notes


### Downloading udemy-courses
Install udemy-dl version 0.2.2-alpha.2
```bash
sudo pip install udemy-dl==0.2.2-alpha.2
```
Download a course
```bash
udemy-dl <http-link-to-udemy-course> -o <path/to_folder/>
```
NB: udemy-dl will not make a new folder under to_folder
		"ariac2c not found". Just ignore this message
1.
```bash
udemy-dl https://www.udemy.com/artificial-intelligence-az/learn/v4/overview -o udemyCources/test/
```
```python
s = "Python syntax highlighting"
print s
```

### Installing chromedriver
1. Look at this page
https://sites.google.com/a/chromium.org/chromedriver/getting-started
2. Go to dowload page
https://sites.google.com/a/chromium.org/chromedriver/downloads
3. Choose latest version
https://chromedriver.storage.googleapis.com/index.html?path=2.33/
4. Download version corresponding to your system
5. Extract the .zip folder
6. Move the "chromdriver" file to somewhere convenient
7. Change the $PATH variable to include the folder the "chromdriver" file is in
Open bashrc
```bash
nano ~./bashrc
```
Add the following to the end of the file
```bash
export PATH="/home/harald/coding/quiz:$PATH"
```
8. Restart IDE's if you are using them
