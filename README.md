# Dotfiles

## Download the configuration

### If `~/.config` doesn't exist

```bash
git clone git@github.com:zshuzh/dotfiles.git ~/.config
```

### If `~/.config` exists but isn't already a Git repository

```bash
cd ~/.config || exit
git init
git remote add origin git@github.com:zshuzh/dotfiles.git
git fetch origin
git checkout --no-overwrite-ignore -b master --track origin/master
```
