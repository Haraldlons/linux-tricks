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

# End of file
