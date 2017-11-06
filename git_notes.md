=========================================
				Git Commands
=========================================
1. Set global user.email on computer
git config --global user.email <email@example.com>
2. Profit!


1. Set user.email on single repository
git config user.email "email@example.com"
2. PROFIT!

1. If you want to remove untracked files (e.g., new files, generated files):
git clean -f
2. PROFIT!


=========================================
				Basic operations
=========================================


----Pull new branch from remote and make new branch local based on it
1. 
git checkout --track origin/remote_branch
2. PROFIT!

----Pull all remote branches to local
1. oneliner
	git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
2. PROFIT!

----Delete a branch
git branch -d <branch-name>
NB: You can't be checkout out in the branch when deleting it

----Revert 'git add <file>'. Unstage <file>
git reset <file>

----See changes done after doing 'git pull'
1.
git log --name-status -2
>>Will show you the names of the files that changed for the last two commits.
	OR
1.
git log -p -2
>>Will show you the changes themselves.

----See changes which will be done if pulling
git fetch
git log --name-status origin/master
>>Will show you what commits you are about to retrieve, along with the names of the files.

----Delete folder and its content
git rm -r one-of-the-directories
git commit -m "Remove duplicated directory"
git push origin <your-git-branch> (typically 'master', but not always)
PROFIT!

=========================================
				Git Flow
=========================================
http://nvie.com/posts/a-successful-git-branching-model/

----Creating a feature branch 
When starting work on a new feature, branch off from the develop branch.
1.
git checkout -b myfeature develop
2. PROFIT!
Switched to a new branch "myfeature"

----Incorporating a finished feature on develop
Finished features may be merged into the develop branch to definitely add them to the upcoming release:
1.
git checkout develop
>>Switched to branch 'develop'
2.
git merge --no-ff myfeature
>>Updating ea1b82a..05e9557
>>(Summary of changes)
3.
git branch -d myfeature
>>Deleted branch myfeature (was 05e9557).
4.
git push origin develop
5. PROFIT!
The --no-ff flag causes the merge to always create a new commit object, even if the merge could be performed with a fast-forward. This avoids losing information about the historical existence of a feature branch and groups together all commits that together added the feature. Compare:

----Creating a release branch
1.
git checkout -b release-1.2 develop
2. 
./bump-version.sh 1.2
3. 
git commit -a -m "Bumped version number to 1.2"
4. PROFIT!
NB: ./bump is a shell script which modifies some files to 1.2 and some lines to the version is edited to 1.2 in the actuall code. We don't use this per(3.11.17) in Revolve.

----Finishing a release branch

```
git checkout master
git merge --no-ff release-1.2
git tag -a 1.2
```


=========================================
				Submodules
=========================================

----Add a submodule to the master-repo
```
git submodule add <URL-repo>
```
----Se changes to just one repo
```
git diff --cached <repo-name>
```

----Cloning a project with submodules
```
git submodule deinit <submodule>
```


