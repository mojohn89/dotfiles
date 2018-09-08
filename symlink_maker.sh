#!/usr/bin/env bash
###############
# Creates symlinks from home to dotfiles folder
###############


dir=~/dotfiles
backupdir=~/dotfiles_old
files=".bashrc .zshrc .profile .vimrc"

echo "Creating backup directory in $backupdir..."
mkdir -p $backupdir
echo "Backup directory created."
echo ""

echo "Changing to new directory $dir..."
cd $dir
echo "Changed into new directory."
echo "" 

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $backupdir"
	mv ~/$file $backupdir
	echo "Creating symlink to $file in home dir..."
	ln -s $dir/$file ~/$file
done

source ~/.bashrc
