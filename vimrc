"====   base set
set nocompatible
set incsearch hlsearch
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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
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
"set nofoldenable
"====   vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrolloff/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'yegappan/grep'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'joonty/vdebug'
Plugin 'parkr/vim-jekyll'

Plugin 'vimwiki'
Plugin 'DrawIt'
Plugin 'a.vim'
filetype plugin indent on
"====   tagbar
"o:change sort mode; v:hide non-public method; x:zoom window; q:quit
"zo/zc zO/zC:fold open/close
"space:display prototype of a tag
"c-n/p: go to next/pre top-level tag
let tagbar_left=1
nnoremap <leader>tl :TagbarToggle<cr>
let tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_autofocus = 1
let g:tagbar_indent = 4
let g:tagbar_show_linenumbers = 2
let g:tagbar_autopreview = 1
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
let g:user_emmet_leader_key = '<c-l>'
let use_emmet_complete_tag = 1
"===-   ctrlp
"c-d: change choose mode by file/path
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }
