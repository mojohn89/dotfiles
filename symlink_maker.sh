#!/usr/bin/env bash
###############
# Creates symlinks from home to dotfiles folder
###############
echo ""
echo "---------------------------"
echo "Setting up dotfile symlinks"
echo "---------------------------"
dir=~/dotfiles
backupdir=$dir/dotfiles_old
files=".bashrc .zshrc .profile .vimrc"


echo "Creating backup directory in $backupdir..."
if [[ ! -e $backupdir ]]; then
    mkdir -p $backupdir
    echo "... Backup directory created"
fi

echo "Changing to dotfiles directory $dir..."
cd $dir

echo "Moving any existing dotfile from $dir to $backupdir"
for file in $files; do
    mv ~/$file $backupdir
    echo " - Creating symlink to $file in home dir..."
    ln -s $dir/$file ~/$file
done

echo ""
echo "------------------------------"
echo "Setting up Vundle with plugins"
echo "------------------------------"
vundlepath=~/.vim/bundle/Vundle.vim
if [ -d $vundlepath ]; then 
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

echo ""
echo "---------------------------"
echo "Setting up OneDrive symlink"
echo "---------------------------"
get_username=$(powershell.exe '$env:UserName')
username=${get_username//$'\r'/}
LocalOneDrive=~/OneDrive
d1="/mnt/c/OneDrive"
d2="/mnt/c/Users/$username/OneDrive"

if [[ ! -e $LocalOneDrive ]]; then
    if [[ -e $d1 ]]; then
        echo "Create symlink from $d1 to $LocalOneDrive"
    elif [[ -e $d2 ]]; then
        echo "Creating symlink $d2 to $LocalOneDrive"
    else
        echo "Couldn't find OneDrive location, check possible locations"
    fi
else 
    echo "OneDrive symlink already exists"
fi


echo ""
echo "-----------------------"
echo "Checking WSLtty install"
echo "-----------------------"
wsltty_path_windows=/mnt/c/Users/$username/AppData/Roaming/wsltty

if [[ $(uname -r) =~ Microsoft$ ]]; then
    if [[ ! -e wsltty_path_windows ]]; then
        echo "wsltty is not installed, download standalone installer"
    else
        echo "Copy contents from github to wsltty location"
    fi
fi



source ~/.bashrc
