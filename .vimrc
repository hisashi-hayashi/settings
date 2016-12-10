set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set number
set hlsearch
set wildmenu
set wildmode=longest:full,full

filetype off
if has('vim_starting')
  set nocompatible               " Be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

""""""""""""""""""""""""""""""
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'rails.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'vim-autoclose'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-markdown'
NeoBundle 'switch.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rking/ag.vim'

call neobundle#end()

let g:neocomplcache_enable_at_startup = 1
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" bb binding.pry を追加する
nmap bb obinding.pry<Esc>

" F4/F5: コピペモード/戻す
map <F4>  :set paste <CR>:set nonu <CR>
map <F5>  :set nopaste <CR>:set nu <CR>

" Ctrl + キー: ペイン移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Ctrk + z: 各ペインのウィンドウサイズをリセット

" F2/F3: 前のコンフリクト場所/次のコンフリクト場所
map <F2>  [c
map <F3>  ]c

" leaderをカンマに割り当て
let mapleader = ","
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
map <Leader>u :<C-u>diffupdate<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>

" Ctrl + c でハイライトを消す
nnoremap <C-c> :nohlsearch<CR>

" q で前の単語へ移動
nnoremap q b

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" ファイルを開いた時、あるいはバッファを切替えた時に、最後にカーソルがあった場所にカーソルを移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['tmp', '.git']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeHighlightCursorline=1

set backspace=indent,eol,start

let g:vim_markdown_folding_disabled = 1
" switch {{{
nmap + :Switch<CR>
nmap - :Switch<CR>
" " }}}

"vimgrep後自動でquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

au BufRead,BufNewFile *.md set filetype=markdown

" 対応するエンドにジャンプ
source $VIMRUNTIME/macros/matchit.vim

set re=0
filetype on
filetype indent on
filetype plugin on

au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
syntax on
