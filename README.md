Current set of dotfiles for Gavin Miller

## Setup

To install from `~/` run:

```
git init .
git remote add -t \* -f origin <repository-url>
git checkout master
```

Additional steps:

- Install homebrew
- Compile Command-T extensions: Run `rake make` in `~/.vim/bundle/command-t`

## Updates

- To update Command-T, vim-rails, vim-ruby, vim-bundler: (TODO: script this)

  ```
  cd ~/.vim/bundle/<project>
  git pull
  ```

## About

Borrowed heavily from Gary Bernhardt (https://github.com/garybernhardt/dotfiles),
checkout his awesome Destroy All Software screen casts!
  https://www.destroyallsoftware.com/screencasts

Terminal color schemes can be picked up from here:
https://github.com/gavingmiller/iTerm2-Color-Schemes
Although I'm not entirely sure if this is where my terminal is pulling its
colors from. ./bin/bash\_colors.sh might be the actual location.

