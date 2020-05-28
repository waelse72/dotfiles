" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
plugin/vissortPlugin.vim	[[[1
30
" vissortPlugin.vim
"  Author:	Charles E. Campbell
"			BISort() by Piet Delport
"  Date:	Nov 02, 2012
"  Version:	4d	NOT RELEASED

" ---------------------------------------------------------------------
" Load Once: {{{1
if &cp || exists("g:loaded_vissort")
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Public Interface: {{{1
com! -range -nargs=0 -bang	Vissort		sil! keepj  <line1>,<line2>call vissort#VisSort(<bang>0)
com! -range -nargs=*		BS			sil! keepj  <line1>,<line2>call vissort#BlockSort(<f-args>)
com! -range -nargs=*		CFuncSort	sil! keepj  <line1>,<line2>call vissort#BlockSort('','^}','^[^/*]\&^[^ ][^*]\&^.*\h\w*\s*(','^.\{-}\(\h\w*\)\s*(.*$','')
com!        -nargs=?		VisOption	sil! call vissort#Options(<q-args>)
sil! com    -nargs=?		VSO	        sil! call vissort#Options(<q-args>)

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo

" ---------------------------------------------------------------------
"  Modelines: {{{1
" vim:ts=4 fdm=marker
doc/vissort.txt	[[[1
262
*vissort.txt*	Visual-Mode Based Sorting		Sep 21, 2012

Author:  Charles E. Campbell  <NdrOchip@ScampbellPfamilyA.Mbiz>
Copyright: (c) 2004-2012 by Charles E. Campbell		*vissort-copyright*
           The VIM LICENSE applies to vissort.vim and vissort.txt
           (see |copyright|) except use "vissort" instead of "Vim"
	   No warranty, express or implied.  Use At-Your-Own-Risk.

	  (remove NOSPAM from Campbell's email first)

==============================================================================
1. Contents						*vissort-contents*

	1. Contents.......................................: |vissort-contents|
	2. Sorting a Column...............................: |vissort|
	3. Sorting Lines Based Upon a Column..............: |vissort-lines|
	4. BlockSort......................................: |vissort-blocksort|
	5. Options........................................: |vissort-options|
	6. History........................................: |vissort-history|

==============================================================================
2. Sorting a Column				*vissort* *vissort-column*

   Sorting a column independently of the surrounding lines~

   |vissort| provides the ability to sort lines based on a column; the
   technique described here allows one to sort columns independently of any
   line contents surrounding the column.

   This topic is also covered on vim's wiki
>
	http://vim.wikia.com/wiki/index.php?search=vissort&fulltext=0
<
   Select the column using |blockwise-visual| mode (use ctrl-v, move).  Then,
   assuming <vis.vim> has been installed as a plugin, type
>
	:B sort
<
   or you may often use an external sorting program; in such a case, the
   typical command is:
>
	:B !sort
<
  Since these methods use blockwise-visual selection, the command will appear
  as
>
	:'<,'>B sort
<
   Examples:~

	Original Text: >

	one      two      three   four
	five     six      seven   eight
	nine     ten      eleven  twelve
	thirteen fourteen fifteen sixteen
<
	Use <vis.vim>'s B command with sort - sorts the column only: >

	    ctrl-v to select column
	    :'<,'>B Bisort
	one      fourteen three   four
	five     six      seven   eight
	nine     ten      eleven  twelve
	thirteen two      fifteen sixteen
<
	Note how only the column (two, six, ten, fourteen) is affected;
	the rest of the lines are left as they were.

==============================================================================
3. Sorting Lines Based Upon a Column			 *vissort-lines*
>
	sorting lines based on selected column
<
   :[range]Vissort   actually same as Bisort
   :'<,'>Vissort     apply sort to visual-block only

   Select a block of text with visual-block mode; use the Vissort command to
   sort the block.  This function sorts the lines *based on the selected
   column*.

   Example:~

	Original Text: >

	one      two      three   four
	five     six      seven   eight
	nine     ten      eleven  twelve
	thirteen fourteen fifteen sixteen
<
	Use ctrl-v (Visual-Block) to select two..fourteen column,
	then Vissort: >

	thirteen fourteen fifteen sixteen
	five     six      seven   eight
	nine     ten      eleven  twelve
	one      two      three   four
<
==============================================================================
4. BlockSort					*vissort-blocksort*

   :'<,'>BS
   :'< '>BS nextblock endblock findtag tagpat tagsub
   :[range]call BlockSort(nextblock,endblock,findtag,tagpat,tagsub)
   :[range]call BlockSort(...)

              If any arguments are missing, BlockSort()
                    will query the user for them.

    This function's purpose is to sort blocks of text based on tags
    contained within the blocks.

    WARNING: this function can move lots of text around, so using it
    is use-at-your-own-risk!  Please check and verify that things
    have worked as you expected.  Backing up your file before
    modifying it would be advisable before doing such things as
    sorting C functions.

    nextblock:
      Blocks are assumed to begin on a line containing the nextblock pattern.

      If the nextblock pattern is "" (the empty string), then the next block is
      assumed to begin with the line following the line matching the endblock
      pattern.

    endblock:
      Blocks are assumed to end with a line containing the endblock pattern.

      If the endblock pattern is "" (the empty string), then the end of the
      block will be assumed to be the line preceding the line matching
      the nextblock pattern.

    findtag:
      Blocks are assumed to contain a tag findable by the findtag pattern.

      If the findtag pattern is "", then nextblock line will be assumed
      to contain the tag.

    tagpat, tagsub:
      The tagpat and tagsub are used by a |substitute()|; the tag is extracted
      by applying the tagpat to the line containing the tag and substitution
      is made with the tagsub pattern.

      If the tagpat is "", then it will default to '^.*$'.

      If the tagsub is "", then if the tagpat was "", then tagsub will
      take on the default value of "&".

      If the tagsub is "" but the tagpat wasn't "", then the tagsub will
      take on the default value of '\1'.

   Examples:~

    1. :[range]call BlockSort('^[a-z]','---$','\u','^.*\(\u\).*$','\1')

     Original Text: >
     	one
             	some
             	junk
             	B
             	appears
             	---
     	two
             	some more
             	junk
             	A
             	appears here.
             	---
<
     After BlockSort('^[a-z]','---$','\u','^.*\(\u\).*$','\1') >
     	two
             	some more
             	junk
             	A
             	appears here.
             	---
     	one
             	some
             	junk
             	B
             	appears
             	---
<
     Explanation of Arguments for Example#1:~
     [range]call BlockSort(
     '^[a-z]',       | blocks begin lines with a character in the range [a-z]
     '---$',         | blocks end with three dashes and end-of-line
     '\u',           | blocks have at least one upper case character ([A-Z]) in them
     '^.*\(\u\).*$', | lines  that have an upper case character (ie. are a tag) are
     '\1')           |        transformed to contain only that upper case character

    2. Sorting C functions (see warning above!)			*CFuncSort*
			    [USE AT YOUR OWN RISK]~

	:[range]CFuncSort
	:[range]call BlockSort('','^}','^[^/*]\&^[^ ][^*]\&^.*\h\w*\s*(','^.\{-}\(\h\w*\)\s*(.*$','')

	CFuncSort is a command that does exactly the same thing as the
	BlockSort shown above; its just easier to type.

	Each function is a block; the nextblock is implied by being the endblock + 1.

	The endblock assumes that C functions end with a pattern matching '^}'.  This
	assumption is not required by the language, but it is typical use.

	The findtag pattern attempts to avoid comments; its not perfect:
	                 1         2
	        12345678901234567890  <--column
		/* something()
		 * somethingelse()
		 */
       		// something()
	Its looking for a C-word ('\h\w*') followed by possible white space
	and an open parenthesis.  It undoubtedly can be confused by prototypes,
	stuff that looks like functions but is inside comments, etc.

	Once such a line is found, the tagpat operates to identify the function name.
	Since tagsub is '', its default value of '\1' is used.

     Explanation of Arguments for Example#2:~
     [range]call BlockSort(
     '',                                | blocks begin after the next pattern
     '^}',                              | blocks end with a closing curly
                                        |     brace which begins the line
     '^[^/*]\&^[^ ][^*]\&^.*\h\w*\s*(', | the block is tagged by an identifier
                                        |     followed by optional spaces and
					|     opening "(".  Some care is taken
					|     to avoid comment lines.
     '^.\{-}\(\h\w*\)\s*(.*$',          | the tag is extracted by using this
                                        |     pattern
     '')                                | the default value of '\1' is used to
                                        |     extract only the tag

==============================================================================
5. Options					*vissort-options*

	g:vissort_sort~
		Default Value: "sort"
		This string holds the command used to invoke sorting.
		(see |:sort|)

	g:vissort_option~
		Default Value: ""
		This string holds any options desired; ie. "n".
		(see |:sort|)
		One may set this option with the >
			:VSO x
<		command, where "x" is an option (such as n or i).
		One may remove options with >
			:VSO
<
==============================================================================
6. History						 *vissort-history*
	v4	Dec 19, 2011	* removed BISort function (which provided
				  internal sorting for vim v6)
				* updated document and text
	v1-3	2005		* sorry, earlier versions didn't have history


==============================================================================
vim:tw=78:ts=8:ft=help

autoload/vissort.vim	[[[1
284
" vissort.vim
"  Author:	Charles E. Campbell
"  Date:	Apr 16, 2013
"  Version:	4
"               COMBAK: need to check on document.  I've removed the input() stuff, using defaults instead

" ---------------------------------------------------------------------
" Load Once: {{{1
if &cp || exists("g:loaded_vissort")
 finish
endif
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of vissort needs at least vim 7.0"
 echohl Normal
 finish
endif
let g:loaded_vissort = "v4"
let s:keepcpo        = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Options: {{{1
if !exists("g:vissort_sort")
 let g:vissort_sort= "sort"
endif
if !exists("g:vissort_option")
 let g:vissort_option= ""
endif

" =====================================================================
" Functions: {{{1

" ---------------------------------------------------------------------
" vissort#VisSort:  sorts lines based on visual-block selected portion of the lines {{{2
" Author: Charles E. Campbell
fun! vissort#VisSort(isnmbr) range
"  call Dfunc("vissort#VisSort(isnmbr=".a:isnmbr.")")
  let vissort_option= (exists("g:vissort_option") && g:vissort_option != "")? " ".g:vissort_option : ""
"  call Decho("vissort_option<".vissort_option.">")
  if visualmode() != "\<c-v>"
   " no visual selection, just plain sort it
   exe "sil! ".a:firstline.",".a:lastline.g:vissort_sort.vissort_option
"   call Dret("vissort#VisSort : no visual selection, just plain sort it")
   return
  endif

  " do visual-block sort
  "   1) yank a copy of the visual selected region
  "   2) place @@@ at the beginning of every line
  "   3) put a copy of the yanked region at the beginning of every line
  "   4) sort lines
  "   5) remove ^...@@@  from every line
  let firstline= line("'<")
  let lastline = line("'>")
  let keeprega = @a
  silent norm! gv"ay

  " prep
  '<,'>s/^/@@@/
  sil! keepj norm! '<0"aP
  if a:isnmbr
   sil! '<,'>s/^\s\+/\=substitute(submatch(0),' ','0','g')/
  endif
  exe "sil! keepj '<,'>".g:vissort_sort.vissort_option

  " cleanup
  exe "sil! keepj ".firstline.",".lastline.'s/^.\{-}@@@//'

  let @a= keeprega
"  call Dret("vissort#VisSort")
endfun

" ---------------------------------------------------------------------
" vissort#Options: {{{2
fun! vissort#Options(...)
"  call Dfunc("vissort#Options() a:0=".a:0)
  if a:0 > 0
   if exists("g:vissort_option") && g:vissort_option == ""
"	call Decho("unlet-ting g:vissort_option")
    unlet g:vissort_option
   endif
   let g:vissort_option= a:1
"   call Decho("setting g:vissort_option<".g:vissort_option.">")
  elseif exists("g:vissort_option")
"   call Decho("unlet-ting g:vissort_option")
   unlet g:vissort_option
  endif
"  call Dret("vissort#Options")
endfun

" ---------------------------------------------------------------------
" vissort#BlockSort: provides an autoload-style interface for BS and CFuncSort commands {{{2
fun! vissort#BlockSort(...) range
"  call Dfunc("vissort#BlockSort() range=".a:firstline.",".a:lastline." args=".string(a:000))
"  call Decho('exe '.a:firstline.','.a:lastline.'call BlockSort('.string(a:000).')')
  let arglist= a:000
  exe a:firstline.','.a:lastline.'call BlockSort(arglist)'
"  call Dret("vissort#BlockSort")
endfun

" ---------------------------------------------------------------------
" BlockSort: Uses either vim-v7's built-in sort or, for vim-v6, Piet Delport's {{{2
"            binary-insertion sort, to sort blocks of text based on tags
"            contained within them.
"              nextblock : text to search() to find the beginning of next block
"                          "" means to use the line following the endblock pattern
"              endblock  : text to search() to find end-of-current block
"                          "" means use just-before-the-nextblock
"              findtag   : text to search() to find the tag in the current block.
"                          "" means the nextblock began with the tag
"              tagpat    : text to use in substitute() to specify tag pattern (extract tag from findtag)
"              			   "" means to use "^.*$"
"              tagsub    : text to use in substitute() to eliminate non-tag portion
"                          from tag pattern
"                          "" means: if tagpat == "": use '&'
"                                    else             use '\1'
"
"  Usage:
"      :[range]call BlockSort(nextblock,endblock,findtag,tagpat,tagsub)
"
"      Any missing arguments will be queried for
"
" With endblock specified, text is allowed in-between blocks;
" such text will remain in-between the sorted blocks
fun! BlockSort(...) range
"  call Dfunc("BlockSort(".string(a:000).") a:0=".a:0." range=".a:firstline.",".a:lastline)

  " get input from argument list or query user
  if a:0 == 1 && type(a:1) == 3
   let arglist= a:1
  else
   let arglist= a:000
  endif
"  call Decho(string(arglist)." (len=".len(arglist).")")
  let vars      = ["nextblock","endblock","findtag","tagpat","tagsub"]
  let ivar      = 0
  let nextblock = '^.*$'
  let endblock  = ''
  let findtag   = '^.*$'
  let tagpat    = ''
  let tagsub    = '&'
  for var in vars
   if ivar <= len(arglist)
"	call Decho("exe let ".vars[ivar]."='".arglist[ivar]."'")
	exe "let ".vars[ivar]."='".arglist[ivar]."'"
   else
	break
   endif
   let ivar= ivar + 1
  endfor

  " sanity check
  if nextblock == "" && endblock == ""
   echoerr "BlockSort: both nextblock and endblock patterns are empty strings"
"   call Dret("BlockSort")
   return
  endif

  " defaults for tagpat and tagsub
  if tagpat == ""
   let tagpat= '^.*$'
   if tagsub == ""
   	let tagsub= '&'
   endif
  endif
  if tagsub == ""
   let tagsub= '\1'
  endif
"  call Decho("nextblock<".nextblock.">")
"  call Decho("endblock <".endblock.">")
"  call Decho("findtag  <".findtag.">")
"  call Decho("tagpat   <".tagpat.">")
"  call Decho("tagsub   <".tagsub.">")

  " don't allow wrapping around the end-of-file during searches
  " I put an empty "guard line" at the end to take care of fencepost issues
  " Its removed at the end of the function
  let akeep  = @a
  let wskeep = &ws
  set nows
  set lz
  let tagcnt = 0
  keepj $put =''
  call cursor(a:firstline,1)
"  call Decho("block sorting range[".a:firstline.",".a:lastline."]")

  " extract tag information: blocktag blockbgn blockend
  let i= a:firstline
  while 0 < i && i < a:lastline
   let tagcnt = tagcnt + 1
   let inxt   = 0
   call cursor(i,1)

   " find tag
   if findtag != ""
    let t= search(findtag,'c')
	if t == 0
	 echoerr "unable to find tag in block starting at line ".i
"     call Dret("BlockSort")
	 return
	endif
   endif
"   call Decho(printf("tag#%3d line#%3d: %s",tagcnt,line("."),getline(".")))
   let blocktag{tagcnt} = substitute(getline("."),tagpat,tagsub,"")." ".tagcnt
   let blockbgn{tagcnt} = i

   " find end-of-block and nextblock
   if endblock == ""
   	let blockend{tagcnt} = search(nextblock)
   	let inxt             = blockend{tagcnt}
    if blockend{tagcnt} == 0
     let blockend{tagcnt}= a:lastline
	else
   	 let blockend{tagcnt} = blockend{tagcnt} - 1
    endif
   else
   	let blockend{tagcnt}= search(endblock)
    if blockend{tagcnt} == 0
      let blockend{tagcnt} = a:lastline
     elseif nextblock == ""
	  let inxt= blockend{tagcnt} + 1
	 else
      let inxt = search(nextblock)
    endif
"	call Decho(printf("blockbgn%-3d at line#%3d",tagcnt,blockbgn{tagcnt}))
"    call Decho(printf("blocktag%-3d='%s'"       ,tagcnt,blocktag{tagcnt}))
"	call Decho(printf("blockend%-3d at line#%3d",tagcnt,blockend{tagcnt}))
   endif

   " save block text
   exe "sil! keepj ".blockbgn{tagcnt}.",".blockend{tagcnt}."y a"
   let blocktxt{tagcnt}= @a
   
"   call Decho("tag<".blocktag{tagcnt}."> block[".blockbgn{tagcnt}.",".blockend{tagcnt}."] i=".i." inxt=".inxt)
   let i= inxt
  endwhile

  " set up a temporary buffer+window with sorted tags
  new
  set buftype=nofile
  let i= 1
  while i <= tagcnt
   sil! keepj put =blocktag{i}
   let i= i + 1
  endwhile
  sil! keepj 1d
  if exists("vissort_option") && g:vissort_option != ""
   exe "sil! keepj %".g:vissort_sort." ".g:vissort_option
  else
   exe "sil! keepj %".g:vissort_sort
  endif
  let i= 1
  while i <= tagcnt
   let blocksrt{i}= substitute(getline(i),'^.* \(\d\+\)$','\1','')
"   call Decho("blocksrt{".i."}=".blocksrt{i}." <".blocktag{blocksrt{i}}.">")
   let i = i + 1
  endwhile
  q!

  " delete blocks and insert sorted blocks
  while tagcnt > 0
   exe "sil! ".blockbgn{tagcnt}.",".blockend{tagcnt}."d"
   sil! keepj put! =blocktxt{blocksrt{tagcnt}}
   let tagcnt= tagcnt - 1
  endwhile

  " cleanup: restore setting(s) and register(s)
  let &ws= wskeep
  let @a = akeep
  set nolz
  sil! keepj $d
  call cursor(a:firstline,1)
"  call Dret("BlockSort")
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo

" ---------------------------------------------------------------------
"  Modelines: {{{1
" vim:ts=4 fdm=marker
