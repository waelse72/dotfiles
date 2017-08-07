set nocompatible
syntax enable
filetype plugin indent on

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" ---------------------------------------------------------------------------
" BEGIN: vim-plug
" ---------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ekalinin/Dockerfile.vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/ternjs/tern_for_vim.git'

" end of initialization of plugin system
call plug#end()

" ---------------------------------------------------------------------------
" END: vim-plug
" ---------------------------------------------------------------------------


"enable keyboard shortcuts
let g:tern_map_keys=1
""show argument hints
let g:tern_show_argument_hints='on_hold'


