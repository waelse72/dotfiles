let mapleader = "_"
" change inside parentheses
map <leader>cp ci(
" change inside braces
map <leader>cb ci{
" change inside square brackets
map <leader>cs ci[
" surround word with double quotes
map <leader>mp bi"<Esc>ea"<Esc>


nnoremap oo o<Esc>k
nnoremap OO O<Esc>j
" press Ap to paste a whitespace and the contents of the register at the end of the line
nnoremap <Leader>p A <esc>p
" insert space at cursor
nnoremap <Leader>s i <esc>
nnoremap <Leader><Space> i <esc>

" Remove all trailing whitespace by pressing _w
" see: https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" re-indent whole file
nnoremap <Leader>i gg=G

" jump to tag
noremap <Leader>t <C-]>


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

" Cycle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" append line at the end of the file
nmap  Go


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
