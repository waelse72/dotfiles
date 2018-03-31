let mapleader = "-"
" change inside parentheses
map <leader>p ci(
" change inside braces
map <leader>b ci{
" change inside square brackets
map <leader>s ci[

map <leader>mp bi"<Esc>ea"<Esc>

" press C-1 to paste a whitespace and the contents of the register to the end of the line
nnoremap <C-1> A <esc>p

" disable arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" disable backspace and delete
inoremap <BS> <Nop>
inoremap <Del> <Nop>



"if has('mac') && ($TERM == 'xterm-256color' || $TERM == 'screen-256color')
  map <Esc>OP <F1>
  map <Esc>OQ <F2>
  map <Esc>OR <F3>
  map <Esc>OS <F4>
  map <Esc>[16~ <F5>
  map <Esc>[17~ <F6>
  map <Esc>[18~ <F7>
  map <Esc>[19~ <F8>
  map <Esc>[20~ <F9>
  map <Esc>[21~ <F10>
  map <Esc>[23~ <F11>
  map <Esc>[24~ <F12>
"endif


map <F2> :tabe ~/.vim/NOTES.md<CR>
map <F3> :so ~/.vimrc<CR>

" (test)
"
" [ a,b, c]
"
" ({test: ss})
"
" function a( () => {
"
"    let a = 1;
"    let Z = 0;
"
" });
"
"
