" General
" always show status line
set laststatus=2
set visualbell                             " don't beep
set noerrorbells                           " don't beep
set novb                                   " no flashing of screen
set nocompatible
set history=10000                           " limit history, must be after nocompatible
set undofile                               " keep a undo file
set undodir=~/.vim/undo

" be more verbose for debugging 
" set verbose=9

" Editing
set expandtab                              " expand tabs to spaces
set tabstop=2
set shiftwidth=2
set shiftround
set path=.,~/,/usr/local/include,/usr/include
syntax enable
filetype plugin indent on
set wrap linebreak nolist                  " line wrapping
set breakindent                            " indent wrapped lines

set spell spelllang=en_us

set maxmempattern=10000


"set omnifunc=syntaxcomplete#Complete

" The time in milliseconds that is waited for a key code or mapped key
" sequence to complete (see also ttimeoutlen)
" WARNING! Changing this may have unexpected results if you are not typing
" fast! DEFAULT is 1000
" set timeoutlen=450

" Insert and command-line mode Caps Lock.
" Lock search keymap to be the same as insert mode.
set imsearch=-1
" Load the keymap that acts like capslock.
set keymap=insert-only_capslock
" Turn it off by default.
set iminsert=0

" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType zsh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType terraform setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType json setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType typescript setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType docker-compose setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab textwidth=79 expandtab autoindent fileformat=unix
"autocmd FileType python-doctest setlocal ts=4 sts=4 sw=4 expandtab textwidth=79 expandtab autoindent fileformat=unix commentstring=\>\>\>\ %s
autocmd FileType python-doctest setlocal ts=4 sts=4 sw=4 expandtab textwidth=79 expandtab autoindent fileformat=unix commentstring=\"\ %s
autocmd BufNewFile,BufRead *.py set tabstop=4 sw=4 sts=4 textwidth=79 expandtab autoindent fileformat=unix

" Editing reStructuredText in Vim
" ----------------------------------
" indentation settings
autocmd FileType rst setlocal expandtab shiftwidth=3 tabstop=3
" show a ruler at the right hand margin
autocmd FileType rst setlocal colorcolumn=120
" for wrapping text
autocmd FileType rst setlocal textwidth=118
" set spelling
autocmd FileType rst setlocal spell spelllang=en_us
" enable syntax highlighting
" autocmd FileType rst syntax on
" all files use utf-8 encoding
autocmd FileType rst setlocal encoding=utf-8




" Control C, which is NEVER used. Now comments out lines!
autocmd BufNewFile,BufRead *.py let python_pudb_trace = "from pudb import set_trace; set_trace()"
autocmd BufNewFile,BufRead *.py let comment_char = "#"

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" remove trailing spces
autocmd FileType c,cpp,java,python,javascript,zsh,sh,yaml,json,rst,typescript,html,docker-compose autocmd BufWritePre <buffer> %s/\s\+$//e
" reset cursor when leaving vim
" autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"

" augroup javascript
  " autocmd! " Remove all vimrc autocommands
"
  " autocmd * javascript set wildignore+=node_modules/**
" augroup END
"
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,blaze*,READONLY,llvm,Library*
set wildignore+=CMakeFiles,packages/*,**/packages/*,**/node_modules/*

" Spelling
autocmd FileType gitcommit setlocal spell        " spell check for git commit messages
autocmd BufRead,BufNewFile *.md setlocal spell   " spell check for markdown files
set complete+=kspell                             " autocomplete words

" Appearance

" show special characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

set colorcolumn=80                         " highlight 80 char column

" color setup
let b:solarized_scheme_type = "solarized8"
if $VIM_SOLARIZED_MODE == "light"
  let b:solarized_mode = "light"
elseif $VIM_SOLARIZED_MODE == "dark"
  let b:solarized_mode = "dark"
else 
  let b:solarized_mode = "dark"
endif



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

" vim-pydocstring
" ---------------
" vim-pydocstring is a generator for Python docstrings and is capable of automatically
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

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

" Riv: Notes and wiki in rst
" --------------
Plug 'https://github.com/gu-fan/riv.vim'
" enable inline python rst
let g:riv_python_rst_hl=1
" chr4/nginx.vim
" --------------
" Vim plugin for Nginx
Plug 'chr4/nginx.vim'

" *************************
" plugins
" *************************

" vim-pandoc
" --------------
" vim-pandoc provides facilities to integrate Vim with the pandoc document
" converter and work with documents written in its markdown variant (although
" textile documents are also supported).
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" vim-jsdoc
" --------------
" jsdoc.vim generates JSDoc block comments based on a function signature.
Plug 'https://github.com/heavenshell/vim-jsdoc'


" vim-surround
" --------------
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and
" add such surroundings in pairs.
Plug 'https://github.com/tpope/vim-surround'

" nerdcommenter
" --------------
" Comment functions so powerful—no comment necessary.
Plug 'https://github.com/scrooloose/nerdcommenter'

" supertab
" ----------------
" Supertab is a vim plugin which allows you to use <Tab> for all your insert
" completion needs (:help ins-completion)
Plug 'ervandew/supertab'

" Valloric/YouCompleteMe
" ----------------------
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
" for Vim. It has several completion engines
Plug 'https://github.com/Valloric/YouCompleteMe.git'

" utilsnips
" -----------------
" UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'https://github.com/SirVer/ultisnips'

" vim-snippets
" -------------
" a collection of vim snippets for snipmate
Plug 'https://github.com/honza/vim-snippets'

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

" itchyny/lightline.vim
" -----------------------------------------------------------------------------
" A light and configurable statusline/tabline plugin for Vim.
" vim-quack-solarized is a solarized color scheme for vim which seem to work
" better than the default scheme packaged with lightline 
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/pearofducks/vim-quack-lightline'

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

" vim-go
" ---------------------------
" GO support for vim
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" vim-solarized8
" --------------
" This is yet another Solarized theme for Vim. It places itself half way
" between the original Solarized and the Flattened variant. It removes only
" some of the bullshit. 
Plug 'https://github.com/lifepillar/vim-solarized8.git'

"Neomake is a plugin for Vim/Neovim to asynchronously run programs.

" You can use it instead of the built-in :make command (since it can pick 
" up your 'makeprg' setting), but its focus is on providing an extra 
" layer of makers based on the current file (type) or project. Its origin is 
" a proof-of-concept for Syntastic to be asynchronous.
Plug 'neomake/neomake'

" end of initialization of plugin system
call plug#end()

" ---------------------------------------------------------------------------
" END: vim-plug
" ---------------------------------------------------------------------------

" colors
" ---------------------------------------------------------------------------
let g:solarized_visibility="low" " can also be set to normal or high
if b:solarized_scheme_type == "solarized8"
  let &t_Co=256
  let g:solarized_use16 = 1
  let g:solarized_statusline = "normal"
  if $OSX
    "fix for iterm2 greyish background
    let g:solarized_termtrans = 1
  endif
elseif b:solarized_scheme_type == "solarized"

  let g:solarized_termcolors=16
endif

if b:solarized_mode == "dark"
  set background=dark
elseif b:solarized_mode == "light"
  set background=light
endif

if b:solarized_scheme_type == "solarized8"
  colorscheme solarized8
elseif b:solarized_scheme_type == "solarized"
  colorscheme solarized
endif

" Cursor to yellow on insert mode
" Blue on command/other mode
" Note the use of hex codes (ie b58900, <Esc>\033]Pl<hex RGB>)
" cursor styles: \e[<code>, where code is
" 0, 1 or none: Blink Block (Default)
" 2: Steady Block
" 3: Blink Underline
" 4: Steady Underline

if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\033]Plb58900\033\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\033]Plb58900\033\\"
  let &t_SI = "\ePtmux;\e\e[2 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
  silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Plb58900\033\\"
  autocmd VimLeave * silent !echo -ne "\<Esc>Ptmux;\<Esc>\033]Plb58900\033\\"
else
  let &t_EI = "\033]Pl3971ED\033\\"
  let &t_SI = "\033]PlFBA922\033\\"
  let &t_SI = "\e[0 q"
  let &t_EI = "\e[0 q"
  silent !echo -ne "\033]Pl3971ED\033\\"
  autocmd VimLeave * silent !echo -ne "\033]Pl3971ED\033\\"
endif

call togglebg#map("<F5>")

" Enable italic text
" see: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#comment-1818205274
" highlight Comment cterm=italic

" fix colors of QuickFixLine (type :highlight to see all color mappings)
"highlight QuickFixLine term=reverse cterm=reverse ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow
if $OSX
  highlight QuickFixLine term=bold cterm=bold ctermfg=1 guifg=Red 
endif

" lightline settings
" ---------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'quack',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

" vim-pandoc
" ---------------------------------------------------------------------------

let g:pandoc#syntax#conceal#use = 1
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["ruby", "literatehaskell=lhaskell", "bash=sh"]

" nerdcommenter
" ---------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

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

" Enables some additional syntax highlighting for NGDocs. Requires JSDoc
" plugin to be enabled as well.
let g:javascript_plugin_ngdoc = 1

" Enables syntax highlighting for Flow.
let g:javascript_plugin_flow = 1

" othree/javascript-libraries-syntax.vim
" ---------------------------------------------------------------------------

" You can use g:used_javascript_libs to setup used libraries, ex:
let g:used_javascript_libs = 'underscore,angularjs,angularui,handlebars,chai'

" vim-jsdoc
" ---------------------------------------------------------------------------
" fix for 'Not an editor command: JsDoc'
" https://github.com/heavenshell/vim-jsdoc/issues/73
command! -register JsDoc call jsdoc#insert()

" Allow prompt for interactive input.
let g:jsdoc_allow_input_prompt = 1

" vim-syntastic/syntastic
" ---------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode="passive"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" ugly: should be just eslint. I don't want to install eslint globally
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npx eslint "$@"'

let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_mode_map = {
     \ "mode": "passive",
     \ "active_filetypes": ["ruby", "php"],
     \ "passive_filetypes": ["python", "java"] }

" utilsnips / YouCompleteMe
" ----------------------------------------------------------------------------
" Trigger configuration. 

" provide a custom trigger function for expanding a trigger when hitting
" return. When calling UltiSnips#ExpandSnippetOrJump the function sets the
" global variable g:ulti_expand_or_jump_res to indicate the result of the
" function.  0 = fail, 1 = expand, 2 = jump.  
" see h: UltiSnips-trigger-functions

let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsExpandTrigger = "<nop>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/MyUltiSnips', 'UltiSnips']

" let g:UltiSnipsUsePythonVersion = 2

" 
" Neomake
" ------------------------
" Run linter on write
" autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0




" load my key mappings
source ~/.dotfiles/.vim/my-mappings.vim
