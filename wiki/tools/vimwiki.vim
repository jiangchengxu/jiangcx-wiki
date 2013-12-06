let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <SNR>29_AutoPairsReturn =AutoPairsReturn()
inoremap <F2> u@.
nmap  :w
nmap  
xnoremap <silent>  y:call g:vimim_visual()
nnoremap <silent>  i=g:vimim_chinese()
map Q gq
xmap S <Plug>VSurround
nmap \ihn :IHN
nmap \is :IHS:A
nmap \ih :IHS
nmap \caL <Plug>CalendarH
nmap \cal <Plug>CalendarV
map \rwp <Plug>RestoreWinPosn
map \swp <Plug>SaveWinPosn
map \ds <Plug>DrawItStop
map \di <Plug>DrawItStart
nnoremap <silent> \b :CommandTBuffer
nnoremap <silent> \t :CommandT
nmap <silent> \w\t <Plug>VimwikiTabMakeDiaryNote
nmap <silent> \w\w <Plug>VimwikiMakeDiaryNote
nmap <silent> \w\i <Plug>VimwikiDiaryGenerateLinks
nmap <silent> \wi <Plug>VimwikiDiaryIndex
nmap <silent> \ws <Plug>VimwikiUISelect
nmap <silent> \wt <Plug>VimwikiTabIndex
nmap <silent> \ww <Plug>VimwikiIndex
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
xmap <silent> gi 
nnoremap <silent> gi a=g:vimim_gi()
nnoremap <silent> n :call g:vimim_search()n
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>CalendarH :cal Calendar(1)
nnoremap <silent> <Plug>CalendarV :cal Calendar(0)
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
noremap <silent> <Plug>DrawItStop :set lz:call DrawIt#DrawItStop():set nolz
noremap <silent> <Plug>DrawItStart :set lz:call DrawIt#DrawItStart():set nolz
map <F9> :Calendar
map <F7> :NERDTreeToggle
nmap <F8> :TagbarToggle
imap S <Plug>ISurround
imap s <Plug>Isurround
imap  :wa
inoremap  u
imap  
inoremap <silent>  =g:vimim_onekey()
inoremap  =g:vimim_chinese()
imap \ihn :IHN
imap \is :IHS:A
imap \ih :IHS
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set autowriteall
set background=dark
set backspace=indent,eol,start
set cscopetag
set dictionary=/usr/share/dict/words
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=cn
set hlsearch
set iminsert=0
set incsearch
set laststatus=2
set makeprg=make\ %:r.o
set mouse=a
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim/bundle/vundle,~/.vim/bundle/vimwiki,~/.vim/bundle/VimIM,~/.vim/bundle/TagHighlight,~/.vim/bundle/Command-T,~/.vim/bundle/DrawIt,~/.vim/bundle/Tagbar,~/.vim/bundle/The-NERD-tree,~/.vim/bundle/calendar.vim--Matsumoto,~/.vim/bundle/surround.vim,~/.vim/bundle/repeat.vim,~/.vim/bundle/a.vim,~/.vim/bundle/Auto-Pairs,~/.vim/bundle/code_complete,~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vundle/after,~/.vim/bundle/vimwiki/after,~/.vim/bundle/VimIM/after,~/.vim/bundle/TagHighlight/after,~/.vim/bundle/Command-T/after,~/.vim/bundle/DrawIt/after,~/.vim/bundle/Tagbar/after,~/.vim/bundle/The-NERD-tree/after,~/.vim/bundle/calendar.vim--Matsumoto/after,~/.vim/bundle/surround.vim/after,~/.vim/bundle/repeat.vim/after,~/.vim/bundle/a.vim/after,~/.vim/bundle/Auto-Pairs/after,~/.vim/bundle/code_complete/after
set scrolloff=10
set shiftwidth=4
set showmatch
set smartcase
set softtabstop=4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tags=tags;
set textwidth=70
set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,.git
set nowrapscan
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/vimwiki/wiki/tools
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +5 ~/vimwiki/wiki/index.wiki
badd +173 ~/vimwiki/wiki/tools/vim.wiki
badd +1 ~/.vim/doc/ad
silent! argdel *
edit ~/vimwiki/wiki/tools/vim.wiki
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe '2resize ' . ((&lines * 24 + 25) / 51)
argglobal
edit ~/.vim/doc/usr_26.cnx
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> 	 =CodeComplete()=SwitchRegion()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal nobuflisted
setlocal buftype=help
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'help'
setlocal filetype=help
endif
setlocal foldcolumn=0
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=100
setlocal foldlevel=100
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcroql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=!-~,^*,^|,^\",192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'help'
setlocal syntax=help
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 150 - ((13 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
150
normal! 0
wincmd w
argglobal
let s:cpo_save=&cpo
set cpo&vim
lnoremap <buffer> <silent> <expr> <BS> g:vimim_backspace()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <expr> <S-Tab> vimwiki#tbl#kbd_shift_tab()
nmap <buffer> <silent> 	 <Plug>VimwikiNextLink
vmap <buffer> <silent>  <Plug>VimwikiNormalizeLinkVisualCR
nmap <buffer> <silent>  <Plug>VimwikiFollowLink
vmap <buffer> <silent> + <Plug>VimwikiNormalizeLinkVisual
nmap <buffer> <silent> + <Plug>VimwikiNormalizeLink
nmap <buffer> <silent> - <Plug>VimwikiRemoveHeaderLevel
nmap <buffer> <silent> <D-CR> <Plug>VimwikiTabnewLink
nmap <buffer> <silent> = <Plug>VimwikiAddHeaderLevel
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
nnoremap <buffer> O :call vimwiki#lst#kbd_oO('O')
nmap <buffer> <silent> \wr <Plug>VimwikiRenameLink
nmap <buffer> <silent> \wd <Plug>VimwikiDeleteLink
nmap <buffer> \whh <Plug>Vimwiki2HTMLBrowse
nmap <buffer> \wh <Plug>Vimwiki2HTML
vnoremap <buffer> <silent> ac :call vimwiki#base#TO_table_col(0, 1)
onoremap <buffer> <silent> ac :call vimwiki#base#TO_table_col(0, 0)
vnoremap <buffer> <silent> a\ :call vimwiki#base#TO_table_cell(0, 1)
onoremap <buffer> <silent> a\ :call vimwiki#base#TO_table_cell(0, 0)
vnoremap <buffer> <silent> ah :call vimwiki#base#TO_header(0, 1)
onoremap <buffer> <silent> ah :call vimwiki#base#TO_header(0, 0)
nnoremap <buffer> gww :VimwikiTableAlignW
nnoremap <buffer> gqq :VimwikiTableAlignQ
nnoremap <buffer> gl3 :VimwikiListChangeLevel #
nnoremap <buffer> gl# :VimwikiListChangeLevel #
nnoremap <buffer> gl- :VimwikiListChangeLevel -
nnoremap <buffer> gl8 :VimwikiListChangeLevel *
nnoremap <buffer> gl* :VimwikiListChangeLevel *
nnoremap <buffer> glm :VimwikiListChangeLevel >>
nnoremap <buffer> gll :VimwikiListChangeLevel <<
vnoremap <buffer> <silent> ic :call vimwiki#base#TO_table_col(1, 1)
onoremap <buffer> <silent> ic :call vimwiki#base#TO_table_col(1, 0)
vnoremap <buffer> <silent> i\ :call vimwiki#base#TO_table_cell(1, 1)
onoremap <buffer> <silent> i\ :call vimwiki#base#TO_table_cell(1, 0)
vnoremap <buffer> <silent> ih :call vimwiki#base#TO_header(1, 1)
onoremap <buffer> <silent> ih :call vimwiki#base#TO_header(1, 0)
nnoremap <buffer> o :call vimwiki#lst#kbd_oO('o')
nnoremap <buffer> <silent> <Plug>VimwikiRemoveHeaderLevel :call vimwiki#base#RemoveHeaderLevel()
nnoremap <buffer> <silent> <Plug>VimwikiAddHeaderLevel :call vimwiki#base#AddHeaderLevel()
nmap <buffer> <silent> <M-Right> <Plug>VimwikiTableMoveColumnRight
nmap <buffer> <silent> <M-Left> <Plug>VimwikiTableMoveColumnLeft
nmap <buffer> <silent> <C-Up> <Plug>VimwikiDiaryPrevDay
nmap <buffer> <silent> <C-Down> <Plug>VimwikiDiaryNextDay
nmap <buffer> <silent> <Nul> <Plug>VimwikiToggleListItem
vmap <buffer> <silent> <C-Space> <Plug>VimwikiToggleListItem
nmap <buffer> <silent> <C-Space> <Plug>VimwikiToggleListItem
nmap <buffer> <silent> <S-Tab> <Plug>VimwikiPrevLink
nmap <buffer> <silent> <BS> <Plug>VimwikiGoBackLink
nmap <buffer> <silent> <C-S-CR> <Plug>VimwikiTabnewLink
nmap <buffer> <silent> <C-CR> <Plug>VimwikiVSplitLink
nmap <buffer> <silent> <S-CR> <Plug>VimwikiSplitLink
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> 	 =CodeComplete()=SwitchRegion()
lnoremap <buffer> <silent> <expr>  g:vimim_cycle_vimim()
lnoremap <buffer> <silent> <expr>  g:vimim_enter()
lnoremap <buffer> <silent> <expr>  g:vimim_one_key_correction()
lnoremap <buffer> <silent> <expr>  g:vimim_esc()
lnoremap <buffer> <silent> <expr>   g:vimim_space()
inoremap <buffer> <silent>   =AutoPairsSpace()
lnoremap <buffer> <expr> ! g:punctuation("!")
inoremap <buffer> <silent> " =AutoPairsInsert('"')
lnoremap <buffer> <expr> # g:punctuation("#")
lnoremap <buffer> <expr> $ g:punctuation("$")
lnoremap <buffer> <expr> % g:punctuation("%")
lnoremap <buffer> <expr> & g:punctuation("&")
lnoremap <buffer> ' =g:vimim_single_quote()
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
lnoremap <buffer> <expr> ( g:punctuation("(")
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
lnoremap <buffer> <expr> ) g:punctuation(")")
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
lnoremap <buffer> <expr> * g:punctuation("*")
lnoremap <buffer> <expr> + g:punctuation("+")
lnoremap <buffer> <expr> , g:punctuation(",")
lnoremap <buffer> <expr> - g:vimim_page("-")
lnoremap <buffer> <expr> . g:punctuation(".")
lnoremap <buffer> <expr> 0 g:vimim_label("0")
lnoremap <buffer> <expr> 1 g:vimim_label("1")
lnoremap <buffer> <expr> 2 g:vimim_label("2")
lnoremap <buffer> <expr> 3 g:vimim_label("3")
lnoremap <buffer> <expr> 4 g:vimim_label("4")
lnoremap <buffer> <expr> 5 g:vimim_label("5")
lnoremap <buffer> <expr> 6 g:vimim_label("6")
lnoremap <buffer> <expr> 7 g:vimim_label("7")
lnoremap <buffer> <expr> 8 g:vimim_label("8")
lnoremap <buffer> <expr> 9 g:vimim_label("9")
lnoremap <buffer> <expr> : g:punctuation(":")
lnoremap <buffer> <expr> ; g:punctuation(";")
lnoremap <buffer> <expr> < g:punctuation("<")
lnoremap <buffer> <expr> = g:vimim_page("=")
lnoremap <buffer> <expr> > g:punctuation(">")
lnoremap <buffer> <expr> ? g:punctuation("?")
lnoremap <buffer> <expr> @ g:punctuation("@")
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
lnoremap <buffer> <expr> [ g:vimim_page("[")
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
lnoremap <buffer> <expr> ] g:vimim_page("]")
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
lnoremap <buffer> <expr> ^ g:punctuation("^")
lnoremap <buffer> <expr> _ g:punctuation("_")
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
lnoremap <buffer> <silent> a =g:wubi()a=g:vimim()
lnoremap <buffer> <silent> b =g:wubi()b=g:vimim()
lnoremap <buffer> <silent> c =g:wubi()c=g:vimim()
lnoremap <buffer> <silent> d =g:wubi()d=g:vimim()
lnoremap <buffer> <silent> e =g:wubi()e=g:vimim()
lnoremap <buffer> <silent> f =g:wubi()f=g:vimim()
lnoremap <buffer> <silent> g =g:wubi()g=g:vimim()
lnoremap <buffer> <silent> h =g:wubi()h=g:vimim()
lnoremap <buffer> <silent> i =g:wubi()i=g:vimim()
lnoremap <buffer> <silent> j =g:wubi()j=g:vimim()
lnoremap <buffer> <silent> k =g:wubi()k=g:vimim()
lnoremap <buffer> <silent> l =g:wubi()l=g:vimim()
lnoremap <buffer> <silent> m =g:wubi()m=g:vimim()
lnoremap <buffer> <silent> n =g:wubi()n=g:vimim()
lnoremap <buffer> <silent> o =g:wubi()o=g:vimim()
lnoremap <buffer> <silent> p =g:wubi()p=g:vimim()
lnoremap <buffer> <silent> q =g:wubi()q=g:vimim()
lnoremap <buffer> <silent> r =g:wubi()r=g:vimim()
lnoremap <buffer> <silent> s =g:wubi()s=g:vimim()
lnoremap <buffer> <silent> t =g:wubi()t=g:vimim()
lnoremap <buffer> <silent> u =g:wubi()u=g:vimim()
lnoremap <buffer> <silent> v =g:wubi()v=g:vimim()
lnoremap <buffer> <silent> w =g:wubi()w=g:vimim()
lnoremap <buffer> <silent> x =g:wubi()x=g:vimim()
lnoremap <buffer> <silent> y =g:wubi()y=g:vimim()
lnoremap <buffer> <silent> z =g:wubi()z=g:vimim()
lnoremap <buffer> <expr> { g:punctuation("{")
inoremap <buffer> <silent> { =AutoPairsInsert('{')
lnoremap <buffer> <expr> } g:punctuation("}")
inoremap <buffer> <silent> } =AutoPairsInsert('}')
lnoremap <buffer> <expr> ~ g:punctuation("~")
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=b:*,b:#,b:-
setlocal commentstring=%%%s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vimwiki'
setlocal filetype=vimwiki
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=100
setlocal foldlevel=100
setlocal foldmarker={{{,}}}
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tnro
setlocal formatlistpat=^\\s*[*#-]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.wiki
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vimwiki'
setlocal syntax=vimwiki
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=70
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
3
normal zo
11
normal zo
23
normal zo
44
normal zo
48
normal zo
58
normal zo
68
normal zo
72
normal zo
79
normal zo
83
normal zo
93
normal zo
79
normal zo
103
normal zo
114
normal zo
124
normal zo
154
normal zo
173
normal zo
178
normal zo
181
normal zo
187
normal zo
201
normal zo
204
normal zo
209
normal zo
212
normal zo
215
normal zo
220
normal zo
3
normal zo
11
normal zo
20
normal zo
23
normal zo
44
normal zo
48
normal zo
54
normal zo
58
normal zo
68
normal zo
72
normal zo
79
normal zo
83
normal zo
86
normal zo
90
normal zo
93
normal zo
79
normal zo
103
normal zo
107
normal zo
114
normal zo
124
normal zo
154
normal zo
173
normal zo
178
normal zo
181
normal zo
187
normal zo
201
normal zo
204
normal zo
209
normal zo
212
normal zo
215
normal zo
220
normal zo
224
normal zo
let s:l = 35 - ((13 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 020l
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe '2resize ' . ((&lines * 24 + 25) / 51)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
