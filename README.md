# dotfiles

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
