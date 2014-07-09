"============================================================================
" Copyleft: 	jcx
" Version: 	1.0.0
" Time:		20130924
"============================================================================
 
" "系统环境设定" {
        " 判断操作系统是 Windows 还是 Linux {
            let g:iswindows = 0
            let g:islinux = 0
            if(has("win32") || has("win64") || has("win95") || has("win16"))
                let g:iswindows = 1
            else
                let g:islinux = 1
            endif
        " }
 
        "判断是终端还是 Gvim {
            if has("gui_running")
                let g:isGUI = 1
            else
                let g:isGUI = 0
            endif
        " }

" }
 
" "Windows Gvim 默认配置" {
        if (g:iswindows && g:isGUI)
            source $VIMRUNTIME/vimrc_example.vim
            source $VIMRUNTIME/mswin.vim
            behave mswin
            set diffexpr=MyDiff()
         
            function MyDiff()
                let opt = '-a --binary '
                if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
                if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
                let arg1 = v:fname_in
                if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
                let arg2 = v:fname_new
                if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
                let arg3 = v:fname_out
                if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
                let eq = ''
                if $VIMRUNTIME =~ ' '
                    if &sh =~ '\<cmd'
                        let cmd = '""' . $VIMRUNTIME . '\diff"'
                        let eq = '"'
                    else
                        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
                    endif
                else
                    let cmd = $VIMRUNTIME . '\diff'
                endif
                silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
            endfunction
        endif
" }
 
" "Linux Gvim/Vim 默认配置" {
        if g:islinux
            set hlsearch        "高亮搜索
            set incsearch       "在输入要搜索的文字时，实时匹配
         
            " Uncomment the following to have Vim jump to the last position when
            " reopening a file
            if has("autocmd")
                au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
            endif
         
            if g:isGUI
                " Source a global configuration file if available
                if filereadable("/etc/vim/gvimrc.local")
                    source /etc/vim/gvimrc.local
                endif
            else
                " This line should not be removed as it ensures that various options are
                " properly set to work with the Vim-related packages available in Debian.
                runtime! debian.vim
         
                " Vim5 and later versions support syntax highlighting. Uncommenting the next
                " line enables syntax highlighting by default.
                if has("syntax")
                    syntax on
                endif
         
                set mouse=a                    " 在任何模式下启用鼠标
                set t_Co=256                   " 在终端启用256色
                set backspace=2                " 设置退格键可用
         
                " Source a global configuration file if available
                if filereadable("/etc/vim/vimrc.local")
                    source /etc/vim/vimrc.local
                endif
            endif
        endif
" }

" "导入默认vimrc" {
        "source $VIMRUNTIME/vimrc_example.vim
        "source $VIMRUNTIME/syntax/c.vim
" }

" "系统及界面设定" {
        set nocompatible         "关闭兼容模式
        set background=dark      "设置文本颜色，必须在syntax enable前调用
        set autoread             "文件改动时自动刷新
        set laststatus=2         "显示状态条
        set makeprg=make\ %:r.o  "设置make编译程序
        set cursorline           "光标行高亮
        "highlight CursorLine ctermbg=yellow
        set ruler                "显示所在的位置
        set autoread             "文件在外部修改后,自动加载
        set nobackup			 "不要备份文件
        set nowrap               "不自动换行
        set noswapfile			 "不使用swap文件
        set foldenable           "启用折叠
        set foldmethod=indent	 "折叠方式
        set foldlevel=100		 "启动vim时不自动折叠
        set nu			         "显示行号
        syntax enable			 "打开语法高亮
        filetype plugin on		 "启用自动补全
        set shortmess=atI        "去掉欢迎界面
        set cmdheight=2          "设置命令行的高度
" }

" "按键映射" {
        "jj映射为ESC
        imap jj <Esc><Right>

        "Ctrl-u映射为CAP
        inoremap <C-u> <ESC>gUiwea

        "用空格键开关折叠
        nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

        "窗口跳转
        noremap <C-j> <C-W>j
        noremap <C-k> <C-W>k
        noremap <C-h> <C-W>h
        noremap <C-l> <C-W>l
" }

" "GUI主题及菜单设置" {
        if has("gui_running")
            set guioptions-=T
            set guioptions-=m
            set guioptions-=r
            set guioptions-=L
            set guioptions+=e
            set t_Co=256
            set guitablabel=%M\ %t
        endif
        "colorscheme darkblue   "深蓝色配色方案
        "colorscheme desert     "经典配色方案
        "colorscheme molokai     "sublime text2配色方案
        if g:isGUI
            colorscheme Tomorrow-Night-Eighties
        else
            colorscheme Tomorrow-Night-Eighties
        endif
" }

" "搜索和匹配" {
        set showmatch		"高亮显示匹配的括号
        set matchtime=5		"匹配括号高亮的时间
        set scrolloff=10	"光标移动到buffer顶部和底部时保持10行距离
        set novisualbell	"不要闪烁
        set hlsearch		"高亮搜索
        set nowrapscan		"搜索到文件头或文件尾时自动停止
        set incsearch		"边输入边查找
        set ignorecase		"搜索时忽略大小写
        set smartcase           "智能大小写搜索
        if g:islinux
            set dictionary+=/usr/share/dict/words   "设置快速补全字典
        endif
" }

" "文件设置" {
" }

" "设置文件编码和文件格式" {
        "set fenc=utf-8
        "set encoding=utf-8
        filetype on                             "启用文件类型侦测
        filetype plugin on                      "针对不同的文件类型加载对应的插件
        filetype plugin indent on               "启用缩进
        set fileencodings=utf-8,gbk,cp936,latin-1
        "set fileformat=unix
        set fileformats=unix,dos,mac

        set autoindent		                     "继承前一行的所进方式，特别适用于多行所进
        "set cindent                             "使用C缩进模式
        set shiftwidth=4	                     "设置换行时自动缩进4个空格
        "set softtabstop=4                       "插入模式tab使用4个空格
        set tabstop=4		                     "设置Tab键的宽度
        "set smartindent                         "智能缩进
        set expandtab		                     "将tab自动转化成空格
        autocmd FileType text setlocal textwidth=78     "设置每行的最大宽度
        set formatoptions+=B                     "合并两行中文时,不在中间添加空格

        " 根据后缀名指定文件类型
        au BufRead,BufNewFile *.h     setlocal ft=c
        au BufRead,BufNewFile *.di    setlocal ft=d
        au BufRead,BufNewFile *.dhtml setlocal ft=htmldjango
        au BufRead,BufNewFile *.sql   setlocal ft=mysql
        au BufRead,BufNewFile *.txt   setlocal ft=txt
" }

" "插件设置" {

    " Vundle { "用于方便的管理vim插件,具体用法参考:h vundle帮助"
            " 获取方式: git clone https://github.com/gmarik/vundle.git  ~/.vim/bundle/vundle
            " Vundle 设置(必须) {
                    set nocompatible    "禁用Vi兼容模式 必须 
                    filetype off        "禁用文件类型侦测 必须 

                    if g:islinux
                        set rtp+=~/.vim/bundle/vundle/
                        call vundle#rc()
                    else
                        set rtp+=$VIM/vimfiles/bundle/vundle/
                        call vundle#rc('$VIM/vimfiles/bundle')
                    endif

                    "让Vundle管理Vundle 必须
                    Bundle 'gmarik/vundle'
            " }

            " Vundle 插件仓库 {
                    "格式1：Github上其他用户的仓库（非vim-scripts账户里的仓库，所以要加Github用户名）
                    "Bundle 'mattn/zencoding-vim'
                    "Bundle 'Lokaltog/vim-powerline'
                    "Bundle 'kien/ctrlp.vim'
                    Bundle 'charz/multi-cscope-db'
                    "Bundle 'fholgado/minibufexpl.vim'
                    Bundle 'ervandew/supertab'
                    Bundle 'Yggdroot/indentLine'
                    Bundle 'Lokaltog/vim-powerline'
                    "Bundle 'vim-scripts/Java-Syntax-and-Folding'

                    "格式2：vim-scripts里面的仓库，直接打仓库名即可。
                    "Bundle 'FuzzyFinder'
                    Bundle 'vimwiki'
                    Bundle 'VimIM'
                    Bundle 'TagHighlight'
                    Bundle 'Command-T'
                    "Bundle 'DrawIt'
                    Bundle 'Tagbar'
                    Bundle 'The-NERD-tree'
                    Bundle 'calendar.vim--Matsumoto'
                    Bundle 'surround.vim'
                    Bundle 'repeat.vim' 
                    "Bundle 'prop.vim' 
                    "Bundle 'adt.vim' 
                    "Bundle 'robo'   
                    Bundle 'Auto-Pairs'
                    Bundle 'code_complete'
                    "Bundle 'word_complete.vim'
                    Bundle 'a.vim'
                    Bundle 'matchit.zip'
                    Bundle 'commentary.vim'
                    Bundle 'bufexplorer.zip'
                    Bundle 'cSyntaxAfter'
                    "Bundle 'ZoomWin'

                    "格式3：非Github的Git仓库
                    "Bundle 'git://git.wincent.com/command-t.git'
            " }

            filetype plugin indent on   "required
    " }

    " "Vimwiki" { "使用vim编写wiki"
            "set nocompatible 	                "关闭兼容模式
            "filetype plugin on	                "针对不同的文件类型加载对应的插件
            "syntax on                           "开启文件类型侦测

            let g:vimwiki_w32_dir_enc='utf-8'	"设置编码
            let g:vimwiki_use_mouse=0		    "使用鼠标映射
            let g:vimwiki_use_calendar=1        "启用calendar-vim插件

            "声明可以在vimwiki里面使用的HTML标签
            let g:vimwiki_valid_html_tags = 'a,p,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'

            let blog = {}
            if g:islinux
                let blog.path          = '~/vimwiki/wiki/'
                let blog.path_html     = '~/vimwiki/html/'
                let blog.template_path = '~/vimwiki/templates/'
                let blog.option_path_html  = '~/vimwiki/public'
            else
                let blog.path           = '$VIM/vimfiles/vimwiki/wiki/'
                let blog.path_html      = '$VIM/vimwiki/html/'
                let blog.template_path  = '$VIM/vimwiki/templates/'
                let blog.option_path_html  = '$VIM/vimwiki/public'
            endif
            let blog.template_default  = 'site'
            let blog.template_ext      = '.html'
            let blog.auto_export       = 1
            let g:vimwiki_list = [blog]
    " }

    " "TagBar script" {
            nmap <F8> :TagbarToggle<CR>
    " }

    " "NERD tree"{
            map <F7> :NERDTreeToggle<CR>
    " }

    " "Ctags" {
            set tags=tags;
            if g:islinux
                set tags+=~/.vim/systags
            else
                set tags+=$VIM/vimfiles/systags
            endif
            set autochdir
    " }

    " "calendar" {
            if g:islinux 
                let g:calendar_diary='~/vimwiki/wiki/diary'
            else
                let g:calendar_diary='$VIM/vimfiles/vimwiki/wiki/diary'
            endif
            map <F9> :Calendar<CR>
    " }

    " "adt.vim" {
            "let g:adtVimAndroidPath='~/local/share/android-sdk'
    " }

    " "word_complete.vim" {
            ":autocmd BufEnter * call DoWordComplete()
    " }

    " "man.vim" {
            runtime! ftplugin/man.vim
    " }

    " "a.vim" {
            ":A switches to the header file corresponding to the current file being edited (or vise versa) 
            ":AS splits and switches 
            ":AV vertical splits and switches 
            ":AT new tab and switches 
            ":AN cycles through matches 
            ":IH switches to file under cursor 
            ":IHS splits and switches 
            ":IHV vertical splits and switches 
            ":IHT new tab and switches 
            ":IHN cycles through matches 
            "<Leader>ih switches to file under cursor 
            "<Leader>is switches to the alternate file of file under cursor (e.g. on  <foo.h> switches to foo.cpp) 
            "<Leader>ihn cycles through matches 
    " }

    " "vimim" { "vim输入法"
            "关闭云输入法
            let g:vimim_cloud = 0
            "开启云输入法
            "let g:vimim_cloud = 'baidu'
            "Tab键为gi无菜单窗
            let g:vimim_map = 'tab_as_gi' 
            "Ctrl-\ 开关输入法
            let g:vimim_map = 'c-bslash'
            "彻底不安中文标点
            let g:vimim_punctuation=-1
    " }
    "
    " "cscope" {
            if has("cscope")
                "设定可以使用quickfix窗口来查看cscope结果
                set cscopequickfix=s-,c-,d-,i-,t-,e-
                "使用Ctrl-]和Ctrl-t在代码间跳转
                set cscopetag
                "如果想反响搜索顺序设置为1
                set csto=0
                "在当前目录中添加任何数据库
                if filereadable("cscope.out")
                    cs add cscope.out
                "否则添加环境中所指定的数据库
                elseif $CSCOPE_DB != ""
                    cs add $CSCOPE_DB
                endif
                set cscopeverbose
                "快捷键设置
                nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  "查找本C符号
                nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  "查找本定义" 
                nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  "查找调用本函数的函数" 
                nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  "查找本字符串"
                nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  "查找本egrep模式"
                nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  "查找本文件"
                nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR> "查找包含本文件的文件" 
                nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  "查找本函数调用的函数" 
            endif
    " }

    " "Command-T" {
            set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,.git
    " }

    " "ctrlp.vim" {
            set runtimepath^=~/.vim/bundle/ctrlp.vim 
    " }

    " "eclm 设置" {
            nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
            nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
            nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
    " }

    " "minibufexpl.vim" {
            "let g:miniBufExplMapWindowNavVim=1
            "let g:miniBufExplMapWindowNavArrows=1
            "let g:miniBufExplMapCTabSwitchBufs=1
            "let g:miniBufExplModSelTarget=1
    " }

    " "bufexplorer.vim" {  "轻松的在缓存中切换(相当于另一种多个文件间的切换方式)"
            " <Leader>be  在当前窗口显示缓存列表并打开选定文件
            " <Leader>bs  水平分割窗口显示缓存列表,并在缓存列表窗口中打开选定文件
            " <Leader>bv  垂直分割窗口显示缓存列表,并在缓存列表窗口中打开选定文件
    " }

    " "CSyntaxAfter.vim" {  "高亮括号与运算符等"
            au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
    " }

    " "powerline.vim" { "状态栏插件,更好的状态栏效果"
    " }
    
    " "ZoomWin插件配置" {  "用于分割窗口的最大化与还原"
            " 常规模式下使用快捷键<c-w>o 在最大化与还原间切换
            "是 
    " }

    " "vim-scripts/Java-Syntax-and-Folding" { "用于java语法和目录高亮"
    " }
" }
