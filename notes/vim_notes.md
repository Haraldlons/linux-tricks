# Vim 

# Installation
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo apt-get install gnome-tweak-tool -y && gnome-tweak-tool


This text file is for adding stuff.

# The Basics
## List of commands
- h moves the cursor one character to the left.
- j moves the cursor down one line.
- k moves the cursor up one line.
- l moves the cursor one character to the right.
- 0 moves the cursor to the beginning of the line.
- $ moves the cursor to the end of the line.
- w move forward one word.
- b move backward one word.
- G move to the end of the file.
- gg move to the beginning of the file.
- `. move to the last edit.

# Editing
- d starts the delete operation.
- dw will delete a word.
- d0 will delete to the beginning of a line.
- d$ will delete to the end of a line.
- dgg will delete to the beginning of the file.
- dG will delete to the end of the file.
- u will undo the last operation.
- Ctrl-r will redo the last undo.

# Searching and replacing
- /text search for text in the document, going forward.
- n move the cursor to the next instance of the text from the last search. This will wrap to the beginning of the document.
- N move the cursor to the previous instance of the text from the last search.
- ?text search for text in the document, going backwards.
- :%s/text/replacement text/g search through the entire document for text and replace it with replacement text.
- :%s/text/replacement text/gc search through the entire document and confirm before replacing text.

# Variables
$1, $2, ...
  The first, second, etc command line arguments to the script

variable=value
  To set a value for a variable, Remember, no spaces on either side of =

Quotes " '
  Double will do variable substitution, single will not

export var1
  Make the variable var1 available to child processes

fd = file descriptor

# User input
read varName
  Read input from the user and store it in the variable varName
/dev/stdin 
  A file you can read to get the STDIN for the Bash script

# Arithmetic
 let expression
  Make a variable equal to an expression
 expr expression
  print out the result of the expression
 $(( expression ))
  Return the result oof the expression
 ${#var}
  Return the length of the variable var

# If statements
  echo $? # Print out last output in bash command window
  Operator	Description
! EXPRESSION	The EXPRESSION is false.
-n STRING	The length of STRING is greater than zero.
-z STRING	The lengh of STRING is zero (ie it is empty).
STRING1 = STRING2	STRING1 is equal to STRING2
STRING1 != STRING2	STRING1 is not equal to STRING2
INTEGER1 -eq INTEGER2	INTEGER1 is numerically equal to INTEGER2
INTEGER1 -gt INTEGER2	INTEGER1 is numerically greater than INTEGER2
INTEGER1 -lt INTEGER2	INTEGER1 is numerically less than INTEGER2
-d FILE	FILE exists and is a directory.
-e FILE	FILE exists.
-r FILE	FILE exists and the read permission is granted.
-s FILE	FILE exists and it's size is greater than zero (ie. it is not empty).
-w FILE	FILE exists and the write permission is granted.
-x FILE	FILE exists and the execute permission is granted.


