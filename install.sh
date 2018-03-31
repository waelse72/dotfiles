#!/bin/bash
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh


DOTFILES=$HOME/.dotfiles

FILES="
.config/fontconfig/conf.d/10-powerline-symbols.conf
.fonts
.oh-my-zsh/custom/init-dotfiles.zsh
.oh-my-zsh/custom/themes/agnoster
.oh-my-zsh/custom/plugins/zsh-dircolors-solarized
.oh-my-zsh/custom/plugins/zsh-autosuggestions
.oh-my-zsh/custom/plugins/zsh-detect-os
.oh-my-zsh/custom/themes/powerlevel9k
.tern-project
.vimrc
.vim/scripts.vim
.vim/colors/thaumaturge.vim
.vim/colors/smyck.vim
.vim/colors/bleh.vim
.vim/yaml.vim
.vim/NOTES.md
.vim/autoload/plug.vim
.tmux.conf
.zshrc
"

function create_or_remove_links {
  create=$1
  for file in $FILES; do
    source="$DOTFILES/$file"
    target="$HOME/$file"
    target_dir=$(dirname $target)

    if [[ "$file" == *\/* ]]; then 
      if ! [ -d "$target_dir" ]; then
        echo "creating $target_dir"
        mkdir -p "$target_dir"
      fi
    fi
   
    if ! [ -L "$target" ]; then
      if $create; then
        ln -s "$source" "$target"
      else
        rm $target
      fi
    fi
  done
}

while getopts ":ui" opt; do
  case $opt in
    i)
      create_or_remove_links true 
      #ln -s ~/.dotfiles/.solarized/vim-colors-solarized/colors/solarized.vim ~/.vim/colors >/dev/null 2>&1
      #ln -s ~/.dotfiles/.solarized/vim-colors-solarized/autoload/togglebg.vim ~/.vim/autoload >/dev/null 2>&1
      ;;
    u)
      create_or_remove_links false
      #rm ~/.vim/colors/solarized.vim >/dev/null 2>&1
      #rm ~/.vim/autoload/togglebg.vim >/dev/null 2>&1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done


