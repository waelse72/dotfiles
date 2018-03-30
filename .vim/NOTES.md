'' - jump to previous position
ci' - edit text surrounded by '

:%normal 2x - delete first two characters for each line (%: match all lines; normal: execute normal mode commands typed on the cmd line; 2x: delete 2 chars)

:mes - show vim messages

## append space and text at the end of the line

just hit 1
`nnoremap 1 A <esc>p`

## delete until next char

delete text until the next /
`dt /`

or including /
`df /`

## show var

`:set <somevar>?`

## show current key mapping

shows the current mapping of <C-]>
`:verbose nmap <C-]>`


insert spaces at beginning

Press Esc to enter 'command mode'
Use Ctrl+V to enter visual block mode
Move Up/Downto select the columns of text in the lines you want to comment.
Then hit Shift+i and type the text you want to insert.
Then hit Esc, wait 1 second and the inserted text will appear on every line.
