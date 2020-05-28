# dotfiles

## Cheatsheet

| area | command      | description                                           |
|------|--------------|-------------------------------------------------------|
| zsh  | bglight      | set light background                                  |
| zsh  | bgdark       | set dark background                                   |
| vim  | `ci'`        | change text surrounded by '                           |
| vim  | `lD` or `ld$`| delete until end of line, exclusive of current letter |
| vim  | `ys<obj>"`   | surround text object with "                           |

## Vim Edits

| command                     | description                                   |
|-----------------------------|-----------------------------------------------|
| `cf_`, `ct_`, `cF_`, `cT_`  | edit THIS_VARIABLE_HAS_UNDERSCORES            |

## Vim Movements

| move                  | description                                         |
|-----------------------|-----------------------------------------------------|
| `f"`, `t"`            | forward to char "                                   |
| `F"`, `T"`            | backward to char "                                  |

## Vim Text Objects

| object                | description                                         |
|-----------------------|-----------------------------------------------------|
| `aw`, `aW`            | a word, including spaces                            |
| `iw`, `iW`            | inner word, excluding spaces                        |
| `as`                  | a sentence                                          |
| `is`                  | inner sentence                                      |
| `ap`                  | a paragraph                                         |
| `ip`                  | inner paragraph                                     |
| `a]`, `a[`            | a block                                             |
| `i]`, `i[`            | inner block                                         |
| `a(`, `a)`, `ab`      | a block                                             |
| `i(`, `i)`, `ib`      | inner block                                         |

... more to come

## Vim Auto-Completion

The config uses `YouCompleteMe` and `ultisnips` for providing auto completion.
**Please note that snippets which are triggered by a regular expression will not show up
in the YouCompleteMe window.**

## Install Instructions

before you start you must install a patched font (awesome)
see: https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched


Install: clone and run 

```
./install.sh -i
```
### zsh

#### powerlevel9k

YOU HAVE TO DEFINE SETTINGS BEFORE SETTING YOUR THEME in `.zshrc`

```bash
POWERLEVEL9K_MODE='awesome-patched'
# ... more config stuff

# activate theme
ZSH_THEME="powerlevel9k/powerlevel9k"
```

### vim

#### install plugins

```
:PlugInst
```

#### setup YouCompleteMe

see https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64 for detailed instrucions


```bash
# optional: install node and npm if not already done
sudo apt-get install npm nodejs

cd ~/.vim/plugged/YouCompleteMe
sudo apt-get install build-essential cmake python-dev python3-dev
./install.py --tern-completer
```

#### tern_for_vim

```
cd ~/.vim/plugged/tern_for_vim/
npm install
```


### ubuntu tweaks

provide node as symlink to nodejs

```
sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
```

### iTerm2 Tweaks

If you set `g:solarized_visibility='low'` and you do not see the non white
space chars you should try to increase the contrast in iTerm's color settings.

#### Fix dircolors

see: http://www.mseri.me/on-iterm2-and-solarized-dark/
go to iTerm -> Preferences -> Profiles -> <our profile> -> Text -> uncheck the
Text Rendering option Draw bold text in bright colors


#### iTerm2 colorschemes

see: https://github.com/mbadolato/iTerm2-Color-Schemes


## Resources

* https://github.com/chriskempson/base16-shell
  * A shell script to change your shell's default ANSI colors but most
   importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by
   your terminal).
* https://gist.github.com/XVilka/8346728
  * True Colour (16 million colours) support in various terminal applications
   and terminals
* https://github.com/lifepillar/vim-solarized8
  * Optimized Solarized colorschemes. Best served with true-color terminals!

