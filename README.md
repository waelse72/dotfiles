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


### iTerm2 colorschemes

see: https://github.com/mbadolato/iTerm2-Color-Schemes
