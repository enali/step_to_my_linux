"====   base set
set nocompatible
set incsearch
set ignorecase
set wildmenu
"set backspace=indent,eol,start
set autoindent smartindent
set autoread
set hidden
set encoding=utf-8
set clipboard=unnamed
set nobackup
set virtualedit=block
set scrolloff=5
set cmdheight=2
set ruler
set nu
runtime ftplugin/man.vim
let mapleader=";"
"====   scheme
colorscheme solarized
let g:solarized_termcolors=256
set background=dark
set cursorline
set cursorcolumn
"====   base nmap
nmap <leader>a 0
nmap <leader>e $
nmap <leader>q :q<cr>
nmap <leader>z :q!<cr>
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>f %
nnoremap <leader>lw <C-W>l
nnoremap <leader>hw <C-W>h
nnoremap <leader>kw <C-W>k
nnoremap <leader>jw <C-W>j
nnoremap <leader>sw <C-W>s
nnoremap <leader>vw <C-W>v
nmap <leader>sv :source ~/.vimrc<cr>
nmap <leader>ev :vsp ~/.vimrc<cr>
nmap <leader>ss :mksession!<cr> :wviminfo!<cr>
nmap <leader>rs :source<cr> :rviminfo<cr>
nmap <leader>gc :!gcc % -o %:t:r<cr>
nmap <leader>ru :!./%:t:r<cr>
nmap <leader>tn :tnext<cr>
nmap <leader>tp :tprevious<cr>
"====   programming
syntax enable
syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set foldmethod=syntax
set nofoldenable
"====   vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'yegappan/grep'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Yggdroot/indentLine'
Bundle 'mattn/emmet-vim'
"Bundle 'altercation/vim-colors-solarized'

Bundle 'vimwiki'
Bundle 'DrawIt'
Bundle 'a.vim'
filetype plugin indent on
"====   tagbar
let tagbar_left=1
nnoremap <leader>tl :TagbarToggle<cr>
let tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_type_cpp={'kinds':['d:macros:1','g:enums','t:typedefs:0:0','e:enumerators:0:0','n:namespaces','c:classes','s:structs','u:unions','f:functions',
                                \ 'm:members:0:0', 'v:global:0:0', 'x:external:0:0', 'l:local:0:0'],
                    \ 'sro' : '::', 
                    \ 'kind2scope' :{ 'g':'enum', 'n':'namespace', 'c':'class', 's':'struct', 'u':'union'},
                    \ 'scope2kind' : {'enum' : 'g', 'namespace':'n', 'class':'c', 'struct':'s', 'union':'u'} }
"====   ultisnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"====   YCM
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gg :YcmCompleter GoToDeclarationElseDeclaration<cr>
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
"====   nerdtree
nmap <leader>fl :NERDTreeToggle<cr>
nmap <leader>bl :NERDTreeFromBookmark 
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1
"====   powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
"====   a.vim
nmap <leader>ch :AV<cr>
nmap <leader>ih :IHV<cr>
"====   VimWiki
"   wiki navigate
nmap <Leader>ww <Plug>VimwikiIndex
nmap <Leader>wt <Plug>VimwikiTabIndex
nmap <Leader>wn <Plug>VimwikiUISelect
nmap <Leader>wh <Plug>Vimwiki2HTML
nmap <Leader>wb <Plug>Vimwiki2HTMLBrowse
"   diary navigate
nmap <Leader>dw <Plug>VimwikiDiaryIndex
nmap <Leader>dm <Plug>VimwikiMakeDiaryNote
nmap <Leader>dt <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>dg <Plug>VimwikiDiaryGenerateLinks
"   link navigate
nmap <Leader>lf <Plug>VimwikiFollowLink
nmap <Leader>le <Plug>VimwikiSplitLink
nmap <Leader>lv <Plug>VimwikiVSplitLink
nmap <Leader>lt <Plug>VimwikiTabnewLink
nmap <Leader>lb <Plug>VimwikiGoBackLink
nmap <Leader>ln <Plug>VimwikiNextLink
nmap <Leader>lp <Plug>VimwikiPrevLink
nmap <Leader>ld <Plug>VimwikiDeleteLink
nmap <Leader>lr <Plug>VimwikiRenameLink
nmap == <Plug>VimwikiAddHeaderLevel
nmap -- <Plug>VimwikiRemoveHeaderLevel
"====   emmet
let g:user_emmet_leader_key = '<c-y>'
let use_emmet_complete_tag = 1
