
"====[ Make the 81st column stand out ]====================

    " OR ELSE just the 81st column of wide lines...
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)


"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

    exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list


"====[ Swap : and ; to make colon commands easier to type ]======

nnoremap  ;  :
nnoremap  :  ;

"====[ Visual drag tool ]======
"Add the following (uncommented) to your .vimrc...
"runtime plugin/dragvisuals.vim
"vmap  <expr>  <LEFT>   DVB_Drag('left')
"vmap  <expr>  <RIGHT>  DVB_Drag('right')
"vmap  <expr>  <DOWN>   DVB_Drag('down')
"vmap  <expr>  <UP>     DVB_Drag('up')
"vmap  <expr>  D        DVB_Duplicate()
"Remove any introduced trailing whitespace after moving...
"let g:DVB_TrimWS = 1
"Or, if you use the arrow keys for normal motions, choose
"four other keys for block dragging. For example:
"vmap  <expr>  h        DVB_Drag('left')
"vmap  <expr>  l        DVB_Drag('right')
"vmap  <expr>  j        DVB_Drag('down')
"vmap  <expr>  k        DVB_Drag('up')
"Or:
"vmap  <expr>  <S-LEFT>   DVB_Drag('left')
"vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
"vmap  <expr>  <S-DOWN>   DVB_Drag('down')
"vmap  <expr>  <S-UP>     DVB_Drag('up')
"Or even:
"vmap  <expr>   <LEFT><LEFT>   DVB_Drag('left')
"vmap  <expr>  <RIGHT><RIGHT>  DVB_Drag('right')
"vmap  <expr>   <DOWN><DOWN>   DVB_Drag('down')
"vmap  <expr>     <UP><UP>     DVB_Drag('up')
