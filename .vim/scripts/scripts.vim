"===================vim 插件管理==================================================
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
                Bundle 'kien/ctrlp.vim'
                Bundle 'tacahiroy/ctrlp-funky'
                "Bundle 'charz/multi-cscope-db'
                Bundle 'fholgado/minibufexpl.vim'
                Bundle 'ervandew/supertab'
                Bundle 'Yggdroot/indentLine'
                Bundle 'Lokaltog/vim-powerline'
                "Bundle 'vim-scripts/Java-Syntax-and-Folding'
                Bundle 'altercation/vim-colors-solarized'
                Bundle 'tomasr/molokai'
                Bundle 'jrosiek/vim-mark'
                Bundle 'asins/vimcdoc'
                Bundle 'Lokaltog/vim-easymotion'
                Bundle 'asins/vim-colors'

                "格式2：vim-scripts里面的仓库，直接打仓库名即可。
                "Bundle 'FuzzyFinder'
                Bundle 'vimwiki'
                "Bundle 'vimcn/vimwiki.cnx'
                Bundle 'VimIM'
                Bundle 'TagHighlight'
                Bundle 'Command-T'
                Bundle 'Tagbar'
                Bundle 'The-NERD-tree'
                Bundle 'calendar.vim--Matsumoto'
                Bundle 'surround.vim'
                Bundle 'repeat.vim' 
                "Bundle 'prop.vim' 
                "Bundle 'adt.vim' 
                Bundle 'Auto-Pairs'
                Bundle 'code_complete'
                Bundle 'a.vim'
                "Bundle 'vimcn/a.vim.cnx'
                Bundle 'matchit.zip'
                Bundle 'commentary.vim'
                Bundle 'bufexplorer.zip'
                Bundle 'MatchTag'

                Bundle 'cSyntaxAfter'
                "Bundle 'vimcn/cSyntaxAfter.cnx'
                "Bundle 'Mark--Ingo-Karkat'
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

" "ctrlp.vim" {
        let g:ctrlp_map = '<leader>ff'
        let g:ctrlp_cmd = 'CtrlP'
        map <leader>fp :CtrlPMRU<CR>
        if g:islinux
            set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        else
            set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
        endif
        let g:ctrlp_working_path_mode = 'ra'
        "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|rvm|exe|so|dll)$'
        let g:ctrlp_custom_ignore = {
            \'dir': '\v[\/]\.(git|hg|svn|cache|Trash)',
            \'file': '\v\.(log|jpg|png|jpeg|exe|so|dll|pyc|swf|psd|db)$'
            \}
        let g:ctrlp_working_path_mode=0
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1
        "set runtimepath^=~/.vim/bundle/ctrlp.vim 
        "使用方法
        "<c-f>, <c-b>切换模式
        "<c-d> 在只搜索文件名和搜索路径名之间切换
        "<c-r> 切换到regexp模式
        "<c-j>, <c-k> 或者方向键切换结果列表
        "<c-t>, <c-v>, <c-x> 在新的Tab页或竖向分割界面打开文件
        "<c-n>, <c-p> 选择下一个/上一个弹出的字符串提示
        "<c-y> 创建一个新文件
        "<c-z> 标记/反标记多个文件并使用<c-o>打开文件
" }
"
" "ctrlp-funky" { "ctrlp 插件的辅助插件"
        "  必须先安装ctrlp
        let g:ctrlp_extensions = ['funky']
        let g:ctrlp_funky_syntax_highlight = 1
        nnoremap <leader>fu :CtrlPFunky<cr>
        nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<cr>
" }

" "eclm 设置" {
        nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
        nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
        nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
" }

"  "Nerdtree" {
        map <F7> :NERDTreeToggle<CR>
        let NERDChristmasTree=1
        let NERDTreeHighlightCursorline=1
        let NERDTreeIgnore=[ '.pyc$', '.pyo$', '.obj$', '.o$', '.so$', '.egg$', '^.git$', '^.svn$', '^.hg$', '.out$' ]
        let g:netrw_home='~/bak'
        let NERDTreeShowLineNumbers=0
        let NERDTreeShowBookmarks=1
"  }

" "minibufexpl.vim" {
        let g:miniBufExplMapWindowNavVim=1
        let g:miniBufExplMapWindowNavArrows=1
        let g:miniBufExplMapCTabSwitchBufs=1
        let g:miniBufExplModSelTarget=1
        let g:miniBufExplCycleArround=1
        map <s-h> :MBEbn<cr>
        map <s-j> :MBEbp<cr>
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

" "supertab" {
        let g:SuperTabRetainCompletionType=2
        let g:SuperTabDefaultCompletionType="<C-X><C-O>"
" }

" "ZoomWin插件配置" {  "用于分割窗口的最大化与还原"
        " 常规模式下使用快捷键<c-w>o 在最大化与还原间切换
        " 使用时有错误 
" }

" "vim-scripts/Java-Syntax-and-Folding" { "用于java语法和目录高亮"
        " 使用时有错误 
" }

" "vim-colors-solarized" { "主题solarized"
        "colorscheme solarized
        if g:islinux
            let g:solarized_termcolors=256
        endif
        let g:solarized_termtrans=1
        let g:solarized_contrast='normal'
        let g:solarized_visibility='normal'
" }

" "molokai" { "主题 molokai"
        colorscheme molokai
        let g:molokai_original = 1
" }
"
" "asins/vimcdoc" { "插件的中文帮助文档"
" }
"
" "Lokaltog/vim-easymotion" {  "快速查找"
        "将<leader>映射为f
        let g:EasyMotion_leader_key='f'
" }

" "MatchTag" { " HTML标签高亮配对
" }
