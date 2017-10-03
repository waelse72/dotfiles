set nocompatible
syntax enable
filetype plugin indent on

" always show status line
set laststatus=2

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType typescript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType docker-compose setlocal ts=2 sts=2 sw=2 expandtab


" ---------------------------------------------------------------------------
" BEGIN: vim-plug
" ---------------------------------------------------------------------------

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/ekalinin/Dockerfile.vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
" tern_for_vim.git
" ----------------
" This is a Vim plugin that provides Tern-based JavaScript editing support.
"
" In JavaScript files, the package will hook into omni completion to handle
" autocompletion, and provide the following commands:
Plug 'https://github.com/ternjs/tern_for_vim.git'
" typescript-vim 
" --------------
" Syntax file and other settings for TypeScript
" Checkout Tsuquyomi for omni-completion and other features for TypeScript
" editing.
Plug 'https://github.com/leafgarland/typescript-vim.git'
" tsuquyomi
" ---------
" A Vim plugin for TypeScript
Plug 'https://github.com/Quramy/tsuquyomi.git'
" vimproc.vim
" -----------
" vimproc is a great asynchronous execution library for Vim. It is a fork of
" proc.vim by Yukihiro Nakadaira. I added some features and fixed some bugs
" and I'm maintaining it now.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" chr4/nginx.vim
" --------------
" Vim plugin for Nginx
Plug 'chr4/nginx.vim'
" pangloss/vim-javascript.git
" ---------------------------
" JavaScript bundle for vim, this bundle provides syntax highlighting and
" improved indentation.
Plug 'https://github.com/pangloss/vim-javascript.git'
" othree/javascript-libraries-syntax.vim
" --------------------------------------
" Syntax file for JavaScript libraries. Supports JavaScript libraries I am
" using (patches welcome). Should work well with other JavaScript syntax
" files. SyntaxComplete also works well on all supported languages.
Plug 'https://github.com/othree/javascript-libraries-syntax.vim'
" Hydrangea theme
" ---------------
" This repository includes a color scheme file for Vim.
Plug 'https://github.com/yuttie/hydrangea-vim.git'
" itchyny/lightline.vim
" ---------------------
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" end of initialization of plugin system
call plug#end()

" ---------------------------------------------------------------------------
" END: vim-plug
" ---------------------------------------------------------------------------

" colors
" ---------------------------------------------------------------------------

let &t_Co=256
colorscheme hydrangea
"colorscheme thaumaturge
"colorscheme smyck

" ternjs/tern_for_vim
" ---------------------------------------------------------------------------


"enable keyboard shortcuts
let g:tern_map_keys=1
""show argument hints
let g:tern_show_argument_hints='on_hold'

" vim-javascript
" ---------------------------------------------------------------------------

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Enables some additional syntax highlighting for NGDocs. Requires JSDoc plugin to be enabled as well.
let g:javascript_plugin_ngdoc = 1

" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" othree/javascript-libraries-syntax.vim
" ---------------------------------------------------------------------------

" You can use g:used_javascript_libs to setup used libraries, ex:
let g:used_javascript_libs = 'underscore,angularjs,angularui,handlebars,chai'


" hydrangea-vim (theme)
" ---------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'hydrangea',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }
