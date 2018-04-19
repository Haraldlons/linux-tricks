# Git Taggin

## Creating a tag
```
git tag -a v1.4 -m  "my version 1.4"
```

## Show which commit a tag is linked to
```
git show v1.4
```

## Delete a local tag
1. delete local tag '12345'
```
git tag -d 12345
```
2. delete remote tag '12345' (eg, GitHub version too)
```
git push origin :refs/tags/12345
```
1. alternative approach
```
git push --delete origin tagName
git tag -d tagName
```