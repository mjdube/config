
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

ab mail tcajee@student.wethinkcode.co.za
ab lft #include "../incs/libft.h"
noremap <F2> :Stdheader<cr>6Gf<ci<tcajee@student.wethinkcode.co.za<right><space><ESC>21x

ab zfs {{{<ESC>gccf}iTITLE<cr><cr><cr><cr><up><up><tab>

"}}}




ab ftest !gcc main.c -L. -lft -Wall -Werror -Wextra -o ft_test

" remove trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar> :let @/=_s<Bar><CR>

ab hc ----------
ab vc \+<cr>\|<cr>\|<cr>v

"=====[ Make arrow keys move visual blocks around ]======================

xmap <up>    <Plug>SchleppIndentUp
xmap <down>  <Plug>SchleppIndentDown
xmap <left>  <Plug>SchleppLeft
xmap <right> <Plug>SchleppRight


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <cr><cr> :!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=50

" Turn on the Wild menu
set wildmenu



" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=10

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

set foldmethod=marker


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set background
set background=dark
colorscheme desert

" " Enable colors
" if (has("termguicolors"))
"   set termguicolors
"  endif
"  colo desert

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
try
    colorscheme desert
catch
endtry


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Linebreak on 500 characters
set lbr
set tw=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" f9 to open NerdTree
nmap <F6> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

" function! VisualSelection(direction, extra_filter) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"
"     let l:pattern = escape(@", "\\/.*'$^~[]")
"     let l:pattern = substitute(l:pattern, "\n$", "", "")
"     if a:direction == 'gv'
"         call CmdLine("Ack '" . l:pattern . "' " )
"     elseif a:direction == 'replace'
"         call CmdLine("%s" . '/'. l:pattern . '/')
"     endif
"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction


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

set comments-=s1:/*,mb:*,ex:*/      "Don't recognize C comments
set comments-=:XCOMM                "Don't recognize lmake comments
set comments-=:%                    "Don't recognize PostScript comments
set comments-=:#                    "Don't recognize Perl/shell comments
set comments+=fb:*                  "Star-space is a bullet
set comments+=fb:-                  "Dash-space is a bullets

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

set updatecount=50                  "Save buffer every 10 chars typed


" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=300 ttimeoutlen=300

" "idleness" is 2 sec
set updatetime=10000

" Indent/outdent current block...
nmap %% $>i}``
nmap $$ $<i}``


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
set tabstop=4
" set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

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


" ====[ Show when lines extend past column 80 ]=================================>!<============

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
        let &rulerformat = g:BRF_new_ruhighlightlerformat
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

" let g:changes_hl_lines=1
" let g:changes_verbose=0
" let g:changes_autocmd=1



"======[ Breakindenting ]========

set breakindentopt=shift:2,sbr
set showbreak=↪
set breakindent
set linebreak


"=====[ Make jump-selections work better in visual block mode ]=================

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"


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
