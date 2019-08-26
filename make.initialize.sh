#!/bin/bash

############################################################################################
# make.initialize.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Cribbed from: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh

########## Variables
dir=~/.dotfiles                    # dotfiles directory
bakdir=~/.dotfiles.bak             # dotfiles backup directory

# files/folders to symlink in homedir
# TODO: get directory listing and blacklist vs whitelist
links="bin \
      .ackrc \
      .bash \
      .bash.platform \
      .bashrc \
      .bash_profile \
      .config \
      .gitconfig \
      .githelpers \
      .gitmessage \
      .rspec \
      .ssh/config \
      .pryrc \
      .vim \
      .vimrc"

########## Main
echo -n "Creating $bakdir for backup of any existing dotfiles in ~ ... "
mkdir -p $bakdir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ... "
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles.bak directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $links
echo "Moving any existing dotfiles from ~ to $bakdir"
for link in $links; do
    mv ~/$link $bakdir &> /dev/null
    echo "Creating symlink to $link in home directory."
    ln -s $dir/$link ~/$link
done

# initialize vim submodules
cd $dir
git submodule update --init
