set nocompatible
syntax enable
filetype plugin indent on

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType typescript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType docker-compose setlocal ts=2 sts=2 sw=2 expandtab

colorscheme thaumaturge
"colorscheme smyck


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
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'https://github.com/Quramy/tsuquyomi.git'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'chr4/nginx.vim'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/yuttie/hydrangea-vim.git'

" end of initialization of plugin system
call plug#end()

" ---------------------------------------------------------------------------
" END: vim-plug
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

" javascript-libraries-syntax
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

