" General
" always show status line
set laststatus=2
set visualbell                             " don't beep
set noerrorbells                           " don't beep
set novb                                   " no flashing of screen
set nocompatible
set undofile                               " keep a undo file
set undodir=~/.vim/undo

" Editing
set expandtab                              " expand tabs to spaces
set tabstop=2
set shiftwidth=2
set shiftround
syntax enable
filetype plugin indent on
set wrap linebreak nolist                  " line wrapping
set breakindent                            " indent wrapped lines
"set omnifunc=syntaxcomplete#Complete

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

" vim-pandoc
" --------------
" vim-pandoc provides facilities to integrate Vim with the pandoc document
" converter and work with documents written in its markdown variant (although
" textile documents are also supported).
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

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
" Plug 'ervandew/supertab'

" utilsnips
" -----------------
" UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!
Plug 'https://github.com/SirVer/ultisnips'

" vim-snippets
" -------------
" a collection of vim snippets for snipmate
Plug 'https://github.com/honza/vim-snippets'


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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" vim-solarized8
" --------------
" This is yet another Solarized theme for Vim. It places itself half way
" between the original Solarized and the Flattened variant. It removes only
" some of the bullshit. 
Plug 'https://github.com/lifepillar/vim-solarized8.git'

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


" utilsnips
" ----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<Enter>"
" let g:UltiSnipsExpandTrigger="<nop>"
" let g:UltiSnipsJumpForwardTrigger="<nop>"
" let g:UltiSnipsJumpBackwardTrigger="<nop>"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
" inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/MyUltiSnips', 'UltiSnips']



" load my key mappings
source ~/.dotfiles/.vim/my-mappings.vim
