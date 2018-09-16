#!/usr/bin/env bash
###############
# Creates symlinks from home to dotfiles folder
###############
echo ""
echo "---------------------------"
echo "Setting up dotfile symlinks"
echo "---------------------------"
dir=~/dotfiles
backupdir=~/Backups
files=".bashrc .zshrc .profile .vimrc"


echo "Creating backup directory in $backupdir..."
if [[ ! -e $backupdir/dotfiles ]]; then
    mkdir -p $backupdir
    echo "... Backup directory created"
fi

echo "Changing to dotfiles directory $dir..."
cd $dir

echo "Moving any existing dotfile from $dir to $backupdir/dotfiles"
for file in $files; do
    mv ~/$file $backupdir/dotfiles
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
        echo "Creating symlink from $d1 to $LocalOneDrive"
        ln -s $d1 $LocalOneDrive
    elif [[ -e $d2 ]]; then
        echo "Creating symlink from $d2 to $LocalOneDrive"
        ln -s $d2 $LocalOneDrive
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
wsltty_local_path=$dir/wsltty

if [[ $(uname -r) =~ Microsoft$ ]]; then
    if [[ ! -e $wsltty_path_windows ]]; then
        echo "wsltty is not installed, download standalone installer"
    else
        rsync -ar --delete $wsltty_path_windows/ $backupdir/wsltty/
        echo "Backed up contents in $wsltty_local_path to $backupdir/wsltty"
        rsync -ar --delete $wsltty_local_path/ $wsltty_path_windows/

        echo "Sync contents from $dir/wsltty to $wsltty_path_windows"
    fi
fi

source ~/.bashrc
