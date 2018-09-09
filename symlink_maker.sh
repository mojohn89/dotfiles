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
echo "---"

echo "Changing to new directory $dir..."
cd $dir
echo "Changed into new directory."
echo "---" 

echo "Moving any existing dotfiles from ~ to $backupdir"
for file in $files; do
	mv ~/$file $backupdir
	echo " - Creating symlink to $file in home dir..."
	ln -s $dir/$file ~/$file
done
echo "---"
vundlepath="~/.vim/bundle/Vundle.vim"
if [ ! -d $vundlepath ]
then 
    echo "Vundle is installed..."
    vim +PluginInstall +qall
    echo ".. And plugins are now up to date."
else 
    echo "Vundle is not installed, installing..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
    echo "Vundle is installed..."
    vim +PluginInstall +qall
    echo ".. And plugins are now up to date."
fi

source ~/.bashrc
