
### Adding New Plugins:

```
git submodule add <repo>
git submodule init
```

And modify the newly added entry in `.gitmodules` to:

```
ignore = dirty
```
