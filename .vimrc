set nocompatible
syntax enable
filetype plugin indent on

" always show status line
set laststatus=2

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType json setlocal ts=4 sts=4 sw=4 expandtab
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


" *************************
" syntax files
" *************************

" typescript-vim 
" --------------
" Syntax file and other settings for TypeScript
" Checkout Tsuquyomi for omni-completion and other features for TypeScript
" editing.
Plug 'https://github.com/leafgarland/typescript-vim.git'

" ekalinin/Dockerfile.vim
" -----------------------
" Vim syntax file for Docker's Dockerfile and snippets for snipMate.
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'

" othree/javascript-libraries-syntax.vim
" --------------------------------------
" Syntax file for JavaScript libraries. Supports JavaScript libraries I am
" using (patches welcome). Should work well with other JavaScript syntax
" files. SyntaxComplete also works well on all supported languages.
Plug 'https://github.com/othree/javascript-libraries-syntax.vim'

" chr4/nginx.vim
" --------------
" Vim plugin for Nginx
Plug 'chr4/nginx.vim'

" *************************
" plugins
" *************************

" Valloric/YouCompleteMe
" ----------------------
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
" for Vim. It has several completion engines
Plug 'https://github.com/Valloric/YouCompleteMe.git'

" tern_for_vim.git
" ----------------
" This is a Vim plugin that provides Tern-based JavaScript editing support.
"
" In JavaScript files, the package will hook into omni completion to handle
" autocompletion, and provide the following commands:
Plug 'https://github.com/ternjs/tern_for_vim.git'

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

" pangloss/vim-javascript.git
" ---------------------------
" JavaScript bundle for vim, this bundle provides syntax highlighting and
" improved indentation.
Plug 'https://github.com/pangloss/vim-javascript.git'

" vim-syntastic/syntastic
" -----------------------
"Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It
"runs files through external syntax checkers and displays any resulting errors
"to the user.
Plug 'vim-syntastic/syntastic'

" Hydrangea theme
" ---------------
" This repository includes a color scheme file for Vim.
Plug 'https://github.com/yuttie/hydrangea-vim.git'

" itchyny/lightline.vim
" ---------------------
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" Solarized Colorscheme for Vim
" -----------------------------
Plug 'https://github.com/altercation/vim-colors-solarized.git'

" test.vim
" ---------------------------
" A Vim wrapper for running tests on different granularities.
Plug 'janko-m/vim-test'

" vim-terraform
" ----------------------------
"  This plugin adds a :Terraform command that runs terraform, with tab
"  completion of subcommands. 
Plug 'https://github.com/hashivim/vim-terraform'


" tcomment_vim
" tcomment provides easy to use, file-type sensible comments for Vim. It 
" can handle embedded syntax.
Plug 'https://github.com/tomtom/tcomment_vim'

" end of initialization of plugin system
call plug#end()

" ---------------------------------------------------------------------------
" END: vim-plug
" ---------------------------------------------------------------------------

" lightline settings
" ---------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }


" colors
" ---------------------------------------------------------------------------

let &t_Co=256
"let g:solarized_termcolors=16
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"

"fix for iterm2 greyish background
let g:solarized_termtrans = 1
set background=dark
"colorscheme hydrangea
colorscheme solarized
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


" vim-syntastic/syntastic
" ---------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" ugly: should be just eslint. I don't want to install eslint globally
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npx eslint "$@"'


" load my key mappings
source ~/.dotfiles/.vim/my-mappings.vim
