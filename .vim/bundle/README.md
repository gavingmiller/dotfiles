
### Adding New Plugins:

```
# cwd = .dotfiles/
git submodule add <repo> .vim/bundle/<repo>
git submodule init
```

And modify the newly added entry in `.gitmodules` to:

```
ignore = dirty
```
