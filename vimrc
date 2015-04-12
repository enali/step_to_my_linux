"==== base
set nocompatible
" 高亮搜索, 允许增量式搜索
set incsearch hlsearch
" 搜索时全小写则忽略大小写,有大写字母则大小写敏感
set ignorecase smartcase
" 命令行补全
set wildmenu
" 自动插入缩进
set smartindent
" 文件发生更改时自动读入
set autoread
" 允许未保存缓冲区时编辑新文件
set hidden
" 禁止备份文件
set nobackup
" 指定命令行高度
set cmdheight=2
" 指定显示光标的行列号
set ruler
" 指定行号和相对行号
set nu rnu
" 指定显示未完成命令
set showcmd
" 指定状态栏显示方式
set laststatus=2
" 指定长行一次右滚10字符
set sidescroll=10
" 适当折行
set linebreak
" 虚拟编辑, 允许光标定位到没实际字符的位置
"set virtualedit=all
" 显示折叠栏
"set foldcolumn=2
" 允许Ctrl-A和Ctrl-X加减字母
set nrformats+=alpha
" 允许在命令行查询Man手册
runtime ftplugin/man.vim

let mapleader=";"
let maplocalleader=","
" set wig+=
"==== base map
nnoremap <leader>z :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>lw <C-W>l
nnoremap <leader>hw <C-W>h
nnoremap <leader>kw <C-W>k
nnoremap <leader>jw <C-W>j
nnoremap <leader>sw <C-W>s
nnoremap <leader>vw <C-W>v
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>ev :vsp $MYVIMRC<cr>

"==== colorscheme
colorscheme seoul256
set background=dark
set cursorline cursorcolumn

"==== tab
syntax enable 
syntax on
" 将<tab>键扩展为空格
set expandtab
" 指定'>'缩进量
set shiftwidth=2
" 指定tab键宽度
set softtabstop=2
" 指定代码折叠的方式
set foldmethod=syntax

"==== vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
"Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-endwise'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/tabpagebuffer.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'rust-lang/rust.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'plasticboy/vim-markdown'
"Plugin 'terryma/vim-expand-region'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'LaTex-Box-Team/LaTex-Box'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'

filetype plugin indent on

"==== tagbar
" x: zoom window, q: quit
" <c-n>, <c-p>: next/prev top-level tag
" <space>: display prototype of a tag
nnoremap <silent> <space>t :TagbarToggle<cr>
let tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_width=30

"==== nerdtree
" m: open menu, I: display hide file, ?: help
nnoremap <silent> <space>f :NERDTreeToggle<cr>
let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

"==== undotree
" >, <: next/prev change
nnoremap <silent> <space>m :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1

"==== polyglot: vim-ruby
" ruby-motion: ]m, ]M, [m, [M, ]], ][, [[, []
" ruby-text-object: am/im, aM/iM
let g:ruby_indent_access_modifier_style='indent'

"==== YouCompleteMe
" Ctrl-space trigger the completion suggestions anywhere
" get a detailed diagnostic message: '<leader>d'
let g:ycm_always_populate_location_list=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
nnoremap <F5> :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>jd :YcmCompleter GoTo<cr>

"==== syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"==== eclim
let g:EclimCompletionMethod='omnifunc'

"==== ultisnips
nnoremap <leader>ue :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/enali/UltiSnips"

"==== vim-surround
" 'ds': delete surround
" 'cs': change surround
" 'ys': you surround, 'yss': operate on current line
" 'vS': visual mode, surround

"==== unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> <space>s :Unite -start-insert file_rec/async:!<cr>
nnoremap <silent> <space>l :Unite -start-insert buffer<cr>
nnoremap <silent> <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <space>y :Unite history/yank<cr>

"====   markdown
" next header         : ]],
" prev header         : [[,
" next sibling header : ][,
" prev sibling header : [],
" current header      : ]c,
" parent header       : ]u
" command: HeaderIncrese/HeaderDecrese
" Toc/Toch/Tocv/Toct  (header overview)
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

"==== tabular
nnoremap <silent> <leader>a> :Tabularize /#=><cr>

"==== vim-expand-region
"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

"==== vimproc
" ':VimProcInstall' first
nnoremap <leader>vb :VimProcBang 
nnoremap <leader>vr :VimProcRead 

"==== vimshell
let g:vimshell_popup_command="70vsplit"
let g:vimshell_interactive_interpreter_commands={"coffee":"coffee", 
      \ "python":"ipython3",
      \ "scheme":"scheme"} 
nnoremap <silent> <leader>vs :VimShellPop<cr>
nnoremap <silent> <leader>vi :VimShellInteractive<cr>

"==== wmgraphviz
" <localleader>ll :GraphvizCompile
" <localleader>lv :GraphvizShow
" <localleader>li :GraphvizInteractive
" <localleader>lt :GraphvizCompileLaTeX

"==== emmet-vim
" expand abbreviation or wrap with abbreviation: '<C-y>,'
" select tag: '<C-y>d', '<C-y>D'
" next edit point: '<C-y>n'
" prev edit point: '<C-y>N'
" remove tag: '<C-y>k'
" split/join tag: '<C-y>j'
" toggle comment: '<C-y>/'
" make anchor from url: '<C-y>a'
" make quoted text from url: '<C-y>A'
