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

" "插件设置" {
        if g:islinux
            source ~/.vim/scripts/scripts.vim
        endif
" }

" "系统及界面设定" {
        set nocompatible         "关闭兼容模式
        set background=dark      "设置文本颜色，必须在syntax enable前调用
        filetype plugin on       "启用自动补全
        syntax enable            "打开语法高亮
        set autoread             "文件改动时自动刷新
        set laststatus=2         "显示状态条
        set makeprg=make\ %:r.o  "设置make编译程序
        set cursorline           "光标行高亮
        "highlight CursorLine ctermbg=yellow
        set ruler                "显示所在的位置
        set autoread             "文件在外部修改后,自动加载
        set nobackup             "不要备份文件
        set nowrap               "不自动换行
        set noswapfile           "不使用swap文件
        set foldenable           "启用折叠
        set foldmethod=indent    "折叠方式
        set foldlevel=100        "启动vim时不自动折叠
        set nu                   "显示行号
        set shortmess=atI        "去掉欢迎界面
        set cmdheight=2          "设置命令行的高度
        set helplang=cn          "设置帮助的语言类型

        "自动运用vim设定
        autocmd BufWritePost .vimrc,.gvimrc,_vimrc silent source %
        "快速编辑.vimrc文件
        nmap <leader>e :tabedit ~/.vimrc<CR>
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
        
        "显示空格及TAB
        noremap <F2> :set list<CR>

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
            "colorscheme Tomorrow-Night-Eighties
        else
            "colorscheme Tomorrow-Night-Eighties
        endif
" }

" "搜索和匹配" {
        set showmatch           "高亮显示匹配的括号
        set matchtime=5         "匹配括号高亮的时间
        set scrolloff=10        "光标移动到buffer顶部和底部时保持10行距离
        set novisualbell        "不要闪烁
        set hlsearch            "高亮搜索
        set nowrapscan          "搜索到文件头或文件尾时自动停止
        set incsearch           "边输入边查找
        set ignorecase          "搜索时忽略大小写
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

        set autoindent                          "继承前一行的所进方式，特别适用于多行所进
        "set cindent                             "使用C缩进模式
        set shiftwidth=4                        "设置换行时自动缩进4个空格
        "set softtabstop=4                       "插入模式tab使用4个空格
        set tabstop=4                           "设置Tab键的宽度
        "set smartindent                         "智能缩进
        set expandtab                           "将tab自动转化成空格
        autocmd FileType text setlocal textwidth=78     "设置每行的最大宽度
        set formatoptions+=B                     "合并两行中文时,不在中间添加空格

        " 根据后缀名指定文件类型
        au BufRead,BufNewFile *.h     setlocal ft=c
        au BufRead,BufNewFile *.di    setlocal ft=d
        au BufRead,BufNewFile *.dhtml setlocal ft=htmldjango
        au BufRead,BufNewFile *.sql   setlocal ft=mysql
        au BufRead,BufNewFile *.txt   setlocal ft=txt
        au BufRead,BufNewFile *.java   setlocal ft=java

        "新建的文件,刚打开的文件不折叠
        autocmd BufNewFile,BufRead * setlocal nofoldenable
" }
"
" "缩写" {
        :iab @h <C-R>=strftime("%F")<CR>  提交人:姜成绪 审核人:周华
" }

