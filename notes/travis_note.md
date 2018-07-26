# Jenkins Notes

## How to add CI with Travis to a new repo.
1 Add .travis.yml from template
2 Add Docker credentials
2.1 [Add Docker Credentials](https://sebest.github.io/post/using-travis-ci-to-build-docker-images/)
```bash
travis encrypt -r RevolveNTNU/r18dv_isam2 DOCKER_EMAIL=haraldlons@gmail.com --add
travis encrypt -r RevolveNTNU/r18dv_isam2 DOCKER_USER=haraldlons --add
travis encrypt -r RevolveNTNU/r18dv_isam2 DOCKER_PASS=password --add
```
Add these credentials to the .travis.yml file with env: global: -secure:<key>
3 Add GitHub Credentials
3.1 [Make new Github Key for pushing and merging branches](https://chrisdown.name/2015/09/27/auto-merging-successful-builds-from-travis-ci.html)
3.2 Add the key to .travis.yml
```bash
# cd to repository
cd /r18dv_pipeline/r18dv_utils
travis encrypt -r RevolveNTNU/r18dv_isam2 'GITHUB_SECRET_TOKEN=<your token>' --add
travis encrypt -r RevolveNTNU/r18dv_isam2 'GITHUB_SECRET_TOKEN=85f3db21f01823e0451ca00b2aef9fef537692d2' --add
```
4 Go to Travis, go to revolve page. Next to 'GitHub Apps Integration
' press the 'Manage repositories on GitHub'. Then add the repo to use the [Jenkins app](https://github.com/organizations/RevolveNTNU/settings/installations/214128#url/ )
5.1 Add the auto-merge script
5.2 Make sure you have the correct auto-merge-script.
You don't want the branch merged from to get deleted, and you want to clone the repo using git@github, and not http://(...)
7.8 Edit .travis.yml
	- BRANCHES_TO_MERGE_REGEX
	- BRANCHE_TO_MERGE_INTO
	- GITHUB_REPO  
	- Search in .travis.yml for r18dv and replace with correct repo
8.1 Add Dockerfile
8.2 change r18dv_utils to r18dv_<repo-name>
9 Add docker_entry_script.sh to repo (you don't need to change anything)
10 Add SSH Key to Travis for that specific repo
```bash
#travis sshkey --upload ~/.ssh/id_rsa -r myorg/main 
travis sshkey --upload ~/.ssh/id_rsa -r RevolveNTNU/r18dv_launchfiles
# There might be important that RevolveNTNU is capatilized correctly
```
11. Push changes to GitHub and watch the action unfold!

# DEBUG
## If you fuckup and install 
```bash
# DON'T RUN THIS
sudo apt-get install travis
```
Then you have to fix it by visiting:
https://github.com/travis-ci/travis.rb/issues/400
