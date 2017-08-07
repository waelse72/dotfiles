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
