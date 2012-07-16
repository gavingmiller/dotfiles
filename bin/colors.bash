#!/bin/bash
# Description: Small cheat sheet script because my memory is cruddy.

# tputcolors 1 - 7
# 1 red
# 2 green
# 3 yellow
# 4 blue
# 5 pink
# 6 cyan
# 7 white

# Use bold to get pastel colors
# $(tput bold)$(tput setaf $i)Text$(tput sgr0)

echo "tput colors"
echo
echo -e "$(tput bold) bld  tput-command-colors$(tput sgr0)"

for i in $(jot - 1 7); do
  echo " $(tput bold)$(tput setaf $i)Text$(tput sgr0) \$(tput setaf $i)"
done

echo
echo ' Bold            $(tput bold)'
echo ' Underline       $(tput sgr 0 1)'
echo ' Reset           $(tput sgr0)'
echo

# ANSI Color Ref
# Format: $green = "\033[01;32m";
#
# Black      0;30       Dark Gray    1;30
# Red        0;31       Bold Red     1;31
# Green      0;32       Bold Green   1;32
# Yellow     0;33       Bold Yellow  1;33
# Blue       0;34       Bold Blue    1;34
# Purple     0;35       Bold Purple  1;35
# Cyan       0;36       Bold Cyan    1;36
# Light Gray 0;37       White        1;37

echo -e "\033[00;30mBlack      0;30       \033[01;30mDark Gray     1;30"
echo -e "\033[00;31mRed        0;31       \033[01;31mBold Red      1;31"
echo -e "\033[00;32mGreen      0;32       \033[01;32mBold Green    1;32"
echo -e "\033[00;33mYellow     0;33       \033[01;33mBold Yellow   1;33"
echo -e "\033[00;34mBlue       0;34       \033[01;34mBold Blue     1;34"
echo -e "\033[00;35mPurple     0;35       \033[01;35mBold Purple   1;35"
echo -e "\033[00;36mCyan       0;36       \033[01;36mBold Cyan     1;36"
echo -e "\033[00;37mLight Gray 0;37       \033[01;37mLight Gray    1;37"
