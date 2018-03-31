# dotfiles


Install: clone and run 

```
./install.sh -i
```

## vim

### install plugins

```
:PlugInst
```

### setup YouCompleteMe

see https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64 for detailed instrucions


```
# optional: install node and npm if not already done
sudo apt-get install npm nodejs

cd ~/.vim/plugged/YouCompleteMe
sudo apt-get install build-essential cmake python-dev python3-dev
./install.py --tern-completer
```

## tern_for_vim

```
cd ~/.vim/plugged/tern_for_vim/
npm install
```

## powerline

```
apt-get install socat python-psutil python-pygit2 python-bzrlib x11-xserver-utils
pip install pyuv i3ipc
# install powerline
pip install powerline-status
```

## fontconfig

update font config cache after installation

```
sudo fc-cache -vf ~/.fonts/
```

## javascript debugging

```
npm install -g vimdebug
```

start node with `--debug-brk`
after this type `node-vim-inspector` to launch the debugger




## ubuntu tweaks

provide node as symlink to nodejs

```
sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
```

## iTerm2 Tweaks

If you set ```g:solarized_visibility='low'``` and you do not see the non white space chars you should try to increase the contrast in iTerm's color settings.

### Fix dircolors

see: http://www.mseri.me/on-iterm2-and-solarized-dark/
go to iTerm -> Preferences -> Profiles -> <our profile> -> Text -> uncheck the Text Rendering option Draw bold text in bright colors


### iTerm2 colorschemes

see: https://github.com/mbadolato/iTerm2-Color-Schemes


## Resources

* https://github.com/chriskempson/base16-shell
 * A shell script to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal).
* https://gist.github.com/XVilka/8346728
 * True Colour (16 million colours) support in various terminal applications and terminals
* https://github.com/lifepillar/vim-solarized8
 * Optimized Solarized colorschemes. Best served with true-color terminals!

