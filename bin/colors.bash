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
