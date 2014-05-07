"============================================================================
" Copyleft: 	jcx
" Version: 	1.0.0
" Time:		20130924
"============================================================================

" 导入默认vimrc {
        source $VIMRUNTIME/vimrc_example.vim
        source $VIMRUNTIME/syntax/c.vim
" }

" 系统设定 {
        set nocompatible         "关闭兼容模式
        set background=dark      "设置文本颜色，必须在syntax enable前调用
        "set clipboard=unnamed   "使用系统剪贴板
        set autoread             "文件改动时自动刷新
        set laststatus=2         "显示状态条
        set makeprg=make\ %:r.o  "设置make编译程序
        color desert             "设置主题
        set cursorline           "光标行高亮
        highlight CursorLine ctermbg=yellow
        set ruler                "显示所在的位置
" }

" GUI设置{
if has("gui_running")
        set guioptions-=T
        set guioptions+=e
        set t_Co=256
        set guitablabel=%M\ %t
endif
        "colorscheme darkblue   "深蓝色配色方案
        "colorscheme desert     "经典配色方案
        "colorscheme molokai     "sublime text2配色方案
" }

" 搜索和匹配 {
        set showmatch		"高亮显示匹配的括号
        set matchtime=5		"匹配括号高亮的时间
        set scrolloff=10	"光标移动到buffer顶部和底部时保持10行距离
        set novisualbell	"不要闪烁
        set hlsearch		"高亮搜索
        set nowrapscan		"搜索到文件头或文件尾时自动停止
        set incsearch		"边输入边查找
        set ignorecase		"搜索时忽略大小写
        set smartcase           "智能大小写搜索
        set dictionary+=/usr/share/dict/words   "设置快速补全字典
" }

" 文件设置 {
        set nobackup			"不要备份文件
        set noswapfile			"不使用swap文件
        set foldmethod=syntax	"折叠方式
        set foldlevel=100		"启动vim时不自动折叠
        set nu			        "显示行号
        syntax enable			"打开语法高亮
        filetype plugin on		"启用自动补全
        set nowrap              "不自动换行
" }

" 设置文件编码和文件格式 {
        "set fenc=utf-8
        "set encoding=utf-8
        set fileencodings=ucs-bom,gb18030,utf-8,gbk,cp936,latin-1
        "set fileformat=unix
        set fileformats=unix,dos,mac

        set autoindent		"继承前一行的所进方式，特别适用于多行所进
        "set cindent        "使用C缩进模式
        set shiftwidth=4	"设置换行时indent的长度
        "set softtabstop=4  "插入模式tab使用4个空格
        set tabstop=4		"普通模式制表符为8
        "set smartindent    "智能缩进
        set expandtab		"将tab自动转化成空格
        autocmd FileType text setlocal textwidth=78     "设置每行的最大宽度
        set formatoptions+=B    "合并两行中文时,不在中间添加空格

        " 根据后缀名指定文件类型
        au BufRead,BufNewFile *.h     setlocal ft=c
        au BufRead,BufNewFile *.di    setlocal ft=d
        au BufRead,BufNewFile *.dhtml setlocal ft=htmldjango
        au BufRead,BufNewFile *.sql   setlocal ft=mysql
        au BufRead,BufNewFile *.txt   setlocal ft=txt
" }

" 插件设置 {

    " Vimwiki {
            "set nocompatible 	                "关闭兼容模式
            "filetype plugin on	                "针对不同的文件类型加载对应的插件
            "syntax on                           "开启文件类型侦测

            let g:vimwiki_w32_dir_enc='utf-8'	"设置编码
            let g:vimwiki_use_mouse=0		    "使用鼠标映射
            let g:vimwiki_use_calendar=1        "启用calendar-vim插件

            "声明可以在vimwiki里面使用的HTML标签
            let g:vimwiki_valid_html_tags = 'a,p,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'

            let blog = {}
            let blog.path          = '~/vimwiki/wiki/'
            let blog.path_html     = '~/vimwiki/html/'
            let blog.template_path = '~/vimwiki/templates/'
            let blog.template_default  = 'site'
            let blog.template_ext      = '.html'
            let blog.option_path_html  = '~/vimwiki/public'
            let blog.auto_export       = 1
            let g:vimwiki_list = [blog]
    " }

    " Vundle {

            " Vundle 设置(必须) {
                    "set nocompatible    "required
                    filetype off        "required

                    set rtp+=~/.vim/bundle/vundle/
                    call vundle#rc()

                    "让Vundle管理Vundle "required
                    Bundle 'gmarik/vundle'
            " }

            " 插件仓库 {
                    "格式1：Github上其他用户的仓库（非vim-scripts账户里的仓库，所以要加Github用户名）
                    "Bundle 'mattn/zencoding-vim'
                    "Bundle 'Lokaltog/vim-powerline'
                    "Bundle 'kien/ctrlp.vim'

                    "格式2：vim-scripts里面的仓库，直接打仓库名即可。
                    "Bundle 'FuzzyFinder'
                    Bundle 'vimwiki'
                    Bundle 'VimIM'
                    Bundle 'TagHighlight'
                    Bundle 'Command-T'
                    Bundle 'DrawIt'
                    Bundle 'Tagbar'
                    Bundle 'The-NERD-tree'
                    Bundle 'calendar.vim--Matsumoto'
                    Bundle 'surround.vim'
                    Bundle 'repeat.vim' 
                    Bundle 'a.vim'     
                    "Bundle 'prop.vim' 
                    "Bundle 'adt.vim' 
                    "Bundle 'robo'   
                    Bundle 'Auto-Pairs'
                    Bundle 'code_complete'
                    "Bundle 'word_complete.vim'
                    Bundle 'a.vim'
                    Bundle 'matchit.zip'
                    Bundle 'commentary.vim'

                    "格式3：非Github的Git仓库
                    "Bundle 'git://git.wincent.com/command-t.git'
            " }

            filetype plugin indent on   "required
    " }

    " TagBar script {
            nmap <F8> :TagbarToggle<CR>
    " }

    " NERD tree {
            map <F7> :NERDTreeToggle<CR>
    " }

    " cscope {
            set cst
            set csto=0  "优先查找cscope数据，然后查找tag文件
            "nmap <C-_>s :cs find s<C-R>=expand("<cword>")<CR><CR>
    " }

    " Ctags {
            set tags=tags;
            set tags+=~/.vim/systags
            set autochdir
    " }

    " calendar {
            let g:calendar_diary='~/vimwiki/wiki/diary'
            map <F9> :Calendar<CR>
    " }

    " adt.vim {
            "let g:adtVimAndroidPath='~/local/share/android-sdk'
    " }

    " word_complete.vim {
            ":autocmd BufEnter * call DoWordComplete()
    " }

    " man.vim {
            runtime! ftplugin/man.vim
    " }

    " a.vim {
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

    " vimim {
            "关闭云输入法
            let g:vimim_cloud = 0
            "Tab键为gi无菜单窗
            let g:vimim_map = 'tab_as_gi' 
            "Ctrl-\ 开关输入法
            let g:vimim_map = 'c-bslash'
            "彻底不安中文标点
            let g:vimim_punctuation=-1
    " }

    " Command-T {
            set wildignore=*.o,*.obj,*.png,*.jpg,*.jpeg,.git
    " }

" }

" 按键映射 {

        inoremap <F2> <ESC>u@.

        imap jj <Esc><Right>

" }
