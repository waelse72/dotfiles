let mapleader = "-"
" change inside parentheses
map <leader>p ci(
" change inside braces
map <leader>b ci{
" change inside square brackets
map <leader>s ci[

map <leader>mp bi"<Esc>ea"<Esc>

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
