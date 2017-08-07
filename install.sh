#!/bin/bash
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh


DOTFILES=$HOME/.dotfiles

FILES="
.tern-project
.vimrc
.vim/scripts.vim
.vim/yaml.vim
.vim/NOTES.md
.vim/autoload/plug.vim
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
      ;;
    u)
      create_or_remove_links false
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done


