"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
colorscheme blaquemagick


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"=====[ Comments are important ]==================

"highlight Comment term=bold ctermfg=white


"====[ Escape insert mode via 'jj' ]=============================

imap jj <ESC>

"====[ I'm sick of typing :%s/.../.../g ]=======

nmap S :%s//g<LEFT><LEFT>
xmap S :s//g<LEFT><LEFT>

"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
set lcs=tab:»·,trail:␣,nbsp:˷
highlight InvisibleSpaces ctermfg=Black ctermbg=Black
call matchadd('InvisibleSpaces', '\S\@<=\s\+\%#\ze\s*$', -10)

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END


"====[ Set up smarter search behaviour ]=======================

set hlsearch        "Highlight all matches
highlight clear Search
highlight       Search    ctermfg=White  ctermbg=Black  cterm=bold
highlight    IncSearch    ctermfg=White  ctermbg=Red    cterm=bold


"=====[ Enable smartwrapping ]==================================

" No smartwrapping in any of these files...
"let g:SW_IGNORE_FILES = '.vimrc,*.vim,*.pl,*.pm,**/bin/**'

" set comments-=s1:/*,mb:*,ex:*/      "Don't recognize C comments
" set comments-=:XCOMM                "Don't recognize lmake comments
" set comments-=:%                    "Don't recognize PostScript comments
" set comments-=:#                    "Don't recognize Perl/shell comments
" set comments+=fb:*                  "Star-space is a bullet
" set comments+=fb:-                  "Dash-space is a bullets

set formatoptions-=cro

set wrapmargin=2                            "Wrap 2 characters from the edge of the window
"set cinwords = ""                           "But not for C-like keywords
set cinoptions+=#1
set cinkeys-=0#

"=======[ Fix smartindent stupidities ]============

set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks

let g:vim_indent_cont = 0                   " No magic shifts on Vim line continuations

nnoremap <silent> >> :call ShiftLine()<CR>|               "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction


"=====[ Quicker access to Ex commands ]==================

nmap ; :
xmap ; :


"=====[ Make Visual modes work better ]==================

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

xnoremap v <C-V>
xnoremap <C-V> v

"Square up visual selections...
set virtualedit=block

" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
xmap <BS> x

" Make vaa select the entire file...
xmap aa VGo1G


"=====[ Make arrow keys move visual blocks around ]======================

xmap <up>    <Plug>SchleppUp
xmap <down>  <Plug>SchleppDown
xmap <left>  <Plug>SchleppLeft
xmap <right> <Plug>SchleppRight

xmap D       <Plug>SchleppDupLeft
xmap <C-D>   <Plug>SchleppDupLeft



"=====[ Configure % key (via matchit plugin) ]==============================

" Match angle brackets...
set matchpairs+=<:>,«:»,｢:｣

"=====[ Miscellaneous features (mainly options) ]=====================

set title           "Show filename in titlebar of window
set titleold=
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

set nomore          "Don't page long listings

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected

"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000

set backspace=indent,eol,start      "BS past autoindents, line boundaries,
                                    "     and even the start of insertion

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings
                                    "but prefer Unix endings

set wildmode=list:longest,full      "Show list of completions
                                    "  and complete as much as possible,
                                    "  then iterate full completions

set complete-=t                     " I don't use tags, so no need to search for them

set infercase                       "Adjust completions to match case

set noshowmode                      "Suppress mode change messages

set updatecount=10                  "Save buffer every 10 chars typed


" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=300 ttimeoutlen=300

" "idleness" is 2 sec
set updatetime=2000

set thesaurus+=~/Documents/thesaurus    "Add thesaurus file for ^X^T
set dictionary+=~/Documents/dictionary  "Add dictionary file for ^X^K


"====[ Simplify textfile backups ]============================================

" Back up the current file
"Nmap BB [Back up current file]  :!bak -q %<CR><CR>:echomsg "Backed up" expand('%')<CR>


"=====[ Remap various keys to something more useful ]========================

" Use space to jump down a page (like browsers do)...
"nnoremap   <Space> <PageDown>
"xnoremap   <Space> <PageDown>

" Format file with autoformat (capitalize to specify options)...
nmap          F  !Gformat -T4 -
nmap <silent> f  !Gformat -T4<CR>
nmap          ff r<CR>fgej

xmap          F :!format -T4 -all -
xmap <silent> f :!format -T4 -all<CR>

" Install current file and swap to alternate file...
"Nmap IP [Install current file and swap to alternate] :!install -f %<CR>


" Add *** as **/* on command-line...
"cmap *** **/*


" " Take off and nuke the entire buffer contents from space
" " (It's the only way to be sure)...
" nnoremap <expr> XX ClearBuffer()

" function! ClearBuffer ()
"     if &filetype =~ 'perl'
"         return "1Gj}dGA\<CR>\<CR>\<ESC>"
"     else
"         return '1GdG'
"     endif
" endfunction

" Replace the current buffer with a copy of the most recent file...

"nmap RR 1GdG:0r#<CR><C-G>

" Insert cut marks...
nmap -- A<CR><CR><CR><ESC>k6i-----cut-----<ESC><CR>


" Indent/outdent current block...
nmap %% $>i}``
nmap $$ $<i}``


"=====[ Itinerary generation ]===========

autocmd BufNewFile,BufRead  *.itn  nnoremap zd !!gen_itinerary_dates<CR>


"=====[ General programming support ]===================================

" Insert various shebang lines...
iab hbc #! /bin/csh
iab hbs #! /bin/sh

"=====[ Show help files in a new tab, plus add a shortcut for helpg ]==============

let g:help_in_tabs = 1

nmap <silent> H  :let g:help_in_tabs = !g:help_in_tabs<CR>

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help' && g:help_in_tabs
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

"Simulate a regular cmap, but only if the expansion starts at column 1...
function! CommandExpandAtCol1 (from, to)
    if strlen(getcmdline()) || getcmdtype() != ':'
        return a:from
    else
        return a:to
    endif
endfunction

"Expand hh -> helpg...
cmap <expr> hh CommandExpandAtCol1('hh','helpg ')


"=====[ Cut and paste from the system clipboard ]====================

" When in Normal mode, paste over the current line...
nmap  <C-P> 0d$"*p

" When in Visual mode, paste over the selected region...
xmap  <C-P> "*pgv

" In Normal mode, yank the entire buffer...
nmap <C-C> 1G"*yG``:call YankedToClipboard()<CR>

" In Visual mode, yank the selection...
xmap  <C-C> "*y:call YankedToClipboard()<CR>

function! YankedToClipboard ()
    let block_of = (visualmode() == "\<C-V>" ? 'block of ' : '')
    let N = strlen(substitute(@*, '[^\n]\|\n$', '', 'g')) + 1
    let lines = (N == 1 ? 'line' : 'lines')
    echo block_of . N lines 'yanked to clipboard'
endfunction

"=====[ Correct common mistypings in-the-fly ]=======================

iab    retrun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab  liekwise  likewise
iab      moer  more
iab  previosu  previous


"=====[ Tab handling ]======================================

set shiftwidth=4   "Indent/outdent by four columns
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else


" Make the completion popup look menu-ish on a Mac...
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue

" Make diffs less glaringly ugly...
highlight DiffAdd     cterm=bold ctermfg=green     ctermbg=black
highlight DiffChange  cterm=bold ctermfg=grey      ctermbg=black
highlight DiffDelete  cterm=bold ctermfg=black     ctermbg=black
highlight DiffText    cterm=bold ctermfg=magenta   ctermbg=black


"=====[ Highlight cursor ]===================

" Inverse highlighting for cursor...
highlight CursorInverse ctermfg=black ctermbg=white

" Set up highlighter at high priority (i.e. 99)
call matchadd('CursorInverse', '\%#.', 99)


"=====[ Highlight row and column on request ]===================

" Toggle cursor row highlighting on request...
highlight CursorLine   term=bold ctermbg=darkgrey ctermfg=yellow  cterm=bold
nmap <silent> ;c :set cursorline!<CR>

" Toggle cursor column highlighting on request...
" (via visualguide.vim plugin, so as to play nice)
nmap     <silent> \  :silent call VG_Show_CursorColumn('flip')<CR>
xnoremap <silent> \  :<C-W>silent call VG_Show_CursorColumn('flip')<CR>gv
imap     <silent> <C-\>  <C-O>:silent call VG_Show_CursorColumn('flip')<CR>


"=====[ Search folding ]=====================

" Show only sub defns (and maybe comments)...
let perl_sub_pat = '^\s*\%(sub\|func\|method\|package\)\s\+\k\+'
let vim_sub_pat  = '^\s*fu\%[nction!]\s\+\k\+'
augroup FoldSub
    autocmd!
    autocmd BufEnter * nmap <silent> <expr>  zp  FS_FoldAroundTarget(perl_sub_pat,{'context':1})
    autocmd BufEnter * nmap <silent> <expr>  za  FS_FoldAroundTarget(perl_sub_pat.'\zs\\|^\s*#.*',{'context':0, 'folds':'invisible'})
    autocmd BufEnter *.vim,.vimrc nmap <silent> <expr>  zp  FS_FoldAroundTarget(vim_sub_pat,{'context':1})
    autocmd BufEnter *.vim,.vimrc nmap <silent> <expr>  za  FS_FoldAroundTarget(vim_sub_pat.'\\|^\s*".*',{'context':0, 'folds':'invisible'})
    autocmd BufEnter * nmap <silent> <expr>             zv  FS_FoldAroundTarget(vim_sub_pat.'\\|^\s*".*',{'context':0, 'folds':'invisible'})
augroup END

" Show only 'use' statements
nmap <silent> <expr>  zu  FS_FoldAroundTarget('\(^\s*\(use\\|no\)\s\+\S.*;\\|\<require\>\s\+\S\+\)',{'context':1})


"====[ Show when lines extend past column 80 ]=================================>!<============

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\zs\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END


"====[ Accelerated up and down on wrapped lines, but counted motions use actual lines ]============

nmap <expr> j  v:count ? 'j' : '<Plug>(accelerated_jk_gj)'
nmap <expr> k  v:count ? 'k' : '<Plug>(accelerated_jk_gk)'


"=====[ Improve ruler with various useful information]=================================

let g:BRF_new_rulerformat = '%40(%#NonText# %v⇢ %l⇣ %= %{BRF_ErrStatus()}  %<%{BRF_WordCount()}⁞ %L⤓  %P%)'

function! BRF_ErrStatus()
    " Count errors and warnings in quickfix list...
    let [errors, warnings] = [0,0]
    for type in map(getqflist(), {key, val -> get(val, "type", "?")})
        if     type == "" || type == 'e'  |  let errors   += 1
        elseif               type == 'w'  |  let warnings += 1
        endif
    endfor

    " Count matches and distinct files in location list...
    let loclist  = getloclist(0)
    let matches  = len(loclist)
    let files    = {}
    for locelem in loclist
        let files[locelem.bufnr] = 1
    endfor
    let buffers  = len(files)

    " Generate report for ruler...
    let status = []
    if errors   | call add(status, errors   . 'ꜝ') | endif
    if warnings | call add(status, warnings . 'ʷ') | endif
    if matches  | call add(status, matches  . 'ᵐ ' . buffers . 'ᵇ') | endif

    return join(status, ' ')
endfunction

let g:BRF_interval = 1
function! BRF_WordCount()

    " Skip an increasing percentage of increasingly expensive updates, as the file gets longer...
    let g:BRF_interval += 1
    if exists("b:BRF_wordcount")
        if g:BRF_interval < b:BRF_wordcount / 500
            return '~' . b:BRF_wordcount
        endif
        let g:BRF_interval = 1
    endif

    " Otherwise, recount the file...
    if &modified || !exists("b:BRF_wordcount")
        let lines = join(getline(1,'$'), ' ')
        let lines = substitute(lines, '\d\.\d',         'X', 'g')
        let lines = substitute(lines, '\a[''-]\a',      'X', 'g')
        let lines = substitute(lines, '[[:alnum:]]\+',  'X', 'g')
        let lines = substitute(lines, '[^[:alnum:]]\+', '',  'g')
        let b:BRF_wordcount = strlen(lines)
    endif

    " Return the precise count...
    return ' ' . b:BRF_wordcount
endfunction

function! BRF_ToggleRuler ()
    if strlen(&rulerformat)
        let &rulerformat = ''
    else
        let &rulerformat = g:BRF_new_rulerformat
    endif
    set ruler
    redraw
endfunction

nmap <silent> ;w :silent call BRF_ToggleRuler()<CR><C-L>

let &rulerformat = g:BRF_new_rulerformat
set ruler


"======[ Add a $$ command in Visual mode ]==============================

xnoremap <silent>       ]   $"yygv_$
xnoremap <silent><expr> _$  Under_dollar_visual()

function! Under_dollar_visual ()
    " Locate block being shifted...
    let maxcol = max(map(split(@y, "\n"), 'strlen(v:val)')) + getpos("'<")[2] - 2

    " Return the selection that does the job...
    return maxcol . '|'
endfunction


"=====[ Configure change-tracking ]========

let g:changes_hl_lines=1
let g:changes_verbose=0
let g:changes_autocmd=1


"======[ Breakindenting ]========

set breakindentopt=shift:2,sbr
set showbreak=↪
set breakindent
set linebreak


"=====[ Automate syntax highlighting ]===============================

" Keep long lines from slowing Vim too much
set synmaxcol=200

augroup Autosyntax_actions
    autocmd!
    autocmd FileType netrw  syntax on
    autocmd BufEnter   *    call AS_Enter()
    autocmd BufLeave   *    syntax off
augroup END

command! -complete=filetype -nargs=+ Autosyntax call AS_set_active(<q-args>)

let g:AS_active_in = {}

function! AS_set_active(list)
    for ft in split(a:list, '\s\+')
        let g:AS_active_in[ft] = 1
        let g:AS_active_in['.'.ft] = 1
    endfor
endfunction

Autosyntax itn
Autosyntax pod6
Autosyntax todo
Autosyntax diff patch

function! AS_Enter ()
    let suffix = '.' . expand('<afile>:e')
    if get(g:AS_active_in, &filetype, 0) || suffix != '.' && get(g:AS_active_in, suffix, 0)
        syntax enable
    endif
endfunction

nmap <silent> ;y   :call AS_toggle()<CR>

function! AS_toggle ()
    let suffix = '.' . expand('%:e')
    if exists('g:syntax_on')
        syntax off
        let g:AS_active_in[&filetype] = 0
        let g:AS_active_in[suffix]    = 0
    else
        syntax enable
        let g:AS_active_in[&filetype] = 1
        let g:AS_active_in[suffix]    = 1
    endif
endfunction


"=====[ Let <UP> and <DOWN> iterate the quickfix buffer list too ]=========

let g:ArrNav_arglist_fallback = 1



"=====[ Make jump-selections work better in visual block mode ]=================

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"


"=====[ Configure ALE ]==================
" Install the following:
"     https://github.com/w0rp/ale
"     https://github.com/jceb/vim-hier

highlight AleError    ctermfg=red     cterm=bold
highlight AleWarning  ctermfg=magenta cterm=bold

augroup ALE_Autoconfig
    au!
    autocmd User GVI_Start  silent call Stop_ALE()
    autocmd User PV_Start   silent call Stop_ALE()
    autocmd User PV_End     silent call Start_ALE()
    autocmd User ALELint    silent HierUpdate
augroup END

let g:ale_set_loclist          = 0
let g:ale_set_quickfix         = 1
let g:ale_set_signs            = 0

function! Start_ALE ()
    ALEEnable
    HierStart
endfunction

function! Stop_ALE ()
    silent call s:ChangeProfile(&filetype)
    ALEDisable
    HierStop
    call setqflist([])
    redraw!
endfunction

function! Toggle_ALE ()
    if g:ale_enabled
        call Stop_ALE()
    else
        call Start_ALE()
    endif
    echo 'Error highlighting ' . (g:ale_enabled ? 'on' : 'off')
endfunction


"=====[ Select a completion from the menu without inserting a <CR> ]========

inoremap <expr> <CR> ((pumvisible())?("\<C-Y>"):("\<CR>"))


"=====[ Change cursor during insertion ]======================

let &t_SI="\033[5 q" " start insert mode, switch to blinking cursor
let &t_EI="\033[1 q" " end insert mode, back to square cursor


"=====[ Completion during search (via Command window) ]======================

" function! s:search_mode_start()
"     cnoremap <tab> <c-f>:resize 1<CR>a<c-n>
"     let s:old_complete_opt = &completeopt
"     let s:old_last_status = &laststatus
"     set completeopt-=noinsert
"     set laststatus=0
" endfunction

" function! s:search_mode_stop()
"     try
"         silent cunmap <tab>
"     catch
"     finally
"         let &completeopt = s:old_complete_opt
"         let &laststatus  = s:old_last_status
"     endtry
" endfunction

" augroup SearchCompletions
"     autocmd!
"     autocmd CmdlineEnter [/\?] call <SID>search_mode_start()
"     autocmd CmdlineLeave [/\?] call <SID>search_mode_stop()
" augroup END


"=====[ Make multi-selection incremental search prettier ]======================

augroup SearchIncremental
    autocmd!
    autocmd CmdlineEnter [/\?]   highlight  Search  ctermfg=DarkRed   ctermbg=Black cterm=NONE
    autocmd CmdlineLeave [/\?]   highlight  Search  ctermfg=White ctermbg=Black cterm=bold
augroup END
