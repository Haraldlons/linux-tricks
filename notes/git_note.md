
# Git Commands

Most common Git commands

## Table of contents
[Basic Operations](#basic)

[Basic Operations2](#basic2)

[Git Flow](#git_flow)

[Submodules](#submodules)

[End](#end)

<a name="basic"/>

## Basic operations
#### Pull new branch from remote and make new branch local based on it
1.
```bash
git checkout --track origin/remote_branch
```
2. PROFIT!

## Configure git correctly
#### Set global user.email on computer
```bash
git config --global user.email <email@example.com>
```
Profit!


#### Set user.email on single repository
```bash
git config user.email "email@example.com"
```
Profit!

### Reset local repository branch to be just like remote repository HEAD
```bash
git fetch origin
git reset --hard origin/master
```

#### Remove all untracked files (e.g., new files, generated files):
```bash
git clean -f
```
Profit!


#### Pull new branch from remote and make new branch local based on it
```bash
git checkout --track origin/remote_branch
```
or 
```bash
git pull
git checkout <remote_branch>
```
Profit!

#### Pull all remote branches to local
One liner:
```bash
git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
```

#### Delete a branch
```bash
git branch -d <branch-name>
```
NB: You can't be checkout out in the branch when deleting it

#### Revert 'git add <file>'. Unstage <file>
```bash
git reset <file>
```

#### See changes done after doing 'git pull'

```bash
git log --name-status -2
>>Will show you the names of the files that changed for the last two commits.
```
Or
```bash
git log -p -2
>>Will show you the changes themselves.
```

#### See changes which will be done if pulling
```bash
git fetch
git log --name-status origin/master
>>Will show you what commits you are about to retrieve, along with the names of the files.
```

#### Delete folder and its content
```bash
git rm -r one-of-the-directories
git commit -m "Remove duplicated directory"
git push origin <your-git-branch> # (typically 'master', but not always)
```
Profit!

#### To stage all manually deleted files you can use:
```bash
git rm $(git ls-files --deleted)
```

#### If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:

```bash
git rm --cached FILENAME
```
<a name="git_flow"/>

## Git Flow
http://nvie.com/posts/a-successful-git-branching-model/

#### Creating a feature branch
When starting work on a new feature, branch off from the develop branch.
```bash
git checkout -b myfeature develop
>>Switched to a new branch "myfeature"
```
Profit!

#### Incorporating a finished feature on develop
Finished features may be merged into the develop branch to definitely add them to the upcoming release:

```bash
git checkout develop
>>Switched to branch 'develop'

git merge --no-ff myfeature
>>Updating ea1b82a..05e9557
>>(Summary of changes)

git branch -d myfeature
>>Deleted branch myfeature (was 05e9557).

git push origin develop
```
Profit!
The --no-ff flag causes the merge to always create a new commit object, even if the merge could be performed with a fast-forward. This avoids losing information about the historical existence of a feature branch and groups together all commits that together added the feature. Compare:

#### Creating a release branch
```bash
git checkout -b release-1.2 develop
./bump-version.sh 1.2 # If you have a bash script which updates version
git commit -a -m "Bumped version number to 1.2"
```
Profit!
NB: ./bump-version.sh is a shell script which modifies some files to 1.2 and some lines to the version is edited to 1.2 in the actuall code. We don't use this per(3.11.17) in Revolve.


#### Finishing a release branch
```bash
git checkout master
git merge --no-ff release-1.2
git tag -a 1.2 	
```
Profit!

#### Revert a branch to an old commit
[Link](https://stackoverflow.com/posts/17667057/edit)
```bash
git checkout master
git reset --hard e3f1e37
git push --force origin master
# Then to prove it (it won't print any diff)
git diff master..origin/master
```
Profit!

## Different Git Commands
#### Saving detached HEAD to a branch
```bash
git branch my-temporary-work
git checkout master
git merge my-temporary-work
```
Profit!

<a name="submodules"/>

## Submodules
#### See more info with git status in submodules
```bash
git config --global status.submoduleSummary true
```

#### See what commit each submodule is linking to
```bash
git submodule status
```

#### Ignore dirty submodules with 'git status'
```bash
git status --ignore-submodules=dirty
```
You often want to do this since many submodules will often be dirty

#### Add a submodule to the master-repo
```bash
cd /root_repo
git submodule add <URL-repo>
```

#### Se changes to just one repo
```bash
git diff --cached <repo-name>
```
<a name="end"/>

#### Cloning a project with submodules
```bash
cd <your_catkin_workspace>/src
git clone git+ssh://git@github.com/RevolveNTNU/<root_repo_name>.git
cd <root_repo_name>
git fetch origin master
git submodule init #to initialize your local configuration file, and git submodule update to fetch all the data from that project and check out the appropriate commit listed in your superproject:
git submodule update # Add: "--remote" to get the newest version of the master branch, instead of the commit tracked by root repo. (Not recommended)
```


#### Renaming a submodule
https://stackoverflow.com/questions/9878860/how-can-i-rename-a-git-repository-with-submodules


# Tagging

## Creating tags

### Normal
```bash
cd <repository>
git tag -a v1.4 -m "my version 1.4"
# Show tag
git show v1.4
```

###  Lightweight
```bash
git tag v1.4-lw
```

## Deleting tags

#### Delete a local tag
```bash
git tag -d 12345
```

#### Delete remote tag '12345' (eg, GitHub version too)
```bash
git push origin :refs/tags/12345
```
alternative approach
```bash
git push --delete origin tagName
git tag -d tagName
```

## Listing tags
```bash
cd <repository>
git tag
# You can also search for tags that match a particular pattern.
git tag -l "v1.8.5*"
```
## Show content of tag
```bash
git show v1.4
```

## Git Kraken

#### Make Git Kraken not track a repo. Forget repo. Ignore repo
```bash
cd .gitkraken/profiles/d6e5a8ca26e14325a4275fc33b17e16f/
nano localRepoCache
```
NB: It might not be 'd6e5a8ca26e14325a4275fc33b17e16f' on your computer, but something similar
Then you will get something like this
```
{
  "localRepoCache": [
    "/home/harald/Documents/01 - Datamaskinarkitektur/.git",
    "/home/harald/Documents/06 - Matematikk 3/.git",
    "/home/harald/catkin_ws/src/r18dv_host_nodes/.git",
    "/home/harald/coding/dv_useful_scripts/.git"
  ]
}
```
Delete the line you want gitkraken to forget.

# Stage hunks
git add <file> -p
git add -i
