Current set of dotfiles for [Gavin Miller](http://gavinmiller.io)

## Setup

To install from `~/` run:

```
git clone git@github.com:gavingmiller/dotfiles.git .dotfiles
cd .dotfiles
./make.initialize.sh
```

Create a `~/.gituser` file that looks like the following:

```
[user]
  name = <your name>
  email = <commit email>
```


Additional steps:

- Install homebrew
  - `brew install ctags`
- Compile Command-T extensions: Run `rake make` in `~/.vim/bundle/command-t`

## Updates

- To update Command-T, vim-rails, vim-ruby, vim-bundler, vim-fugitive: (TODO: script this)

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
