set tabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set number
set hlsearch
set wildmenu
set wildmode=longest:full,full
set encoding=utf-8
filetype off
set re=0

au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
syntax on

"""""""""""""""vimのキーバインド start"""""""""""""""
" bb binding.pry を追加する
nmap bb obinding.pry<Esc>

" F4/F5: コピペモード/戻す
map <F4>  :set paste <CR>:set nonu <CR>
map <F5>  :set nopaste <CR>:set nu <CR>

" Ctrl + キー: ペイン移動"
nnoremap <S-Up> <C-w>k
nnoremap <S-Down> <C-w>j
nnoremap <S-Left> <C-w>h
nnoremap <S-Right> <C-w>l
vnoremap <S-Up> k
vnoremap <S-Down> j
vnoremap <S-Left> h
vnoremap <S-Right> l

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" q で前の単語へ移動
nnoremap q b

" Ctrl + c でハイライトを消す
nnoremap <C-c> :nohlsearch<CR>

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
"""""""""""""""vimのキーバインド end"""""""""""""""

"""""""""""""""vimの設定start"""""""""""""""
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" ファイルを開いた時、あるいはバッファを切替えた時に、最後にカーソルがあった場所にカーソルを移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"""""""""""""""vimの設定end"""""""""""""""

"""""""""""""""dein.vim start""""""""""""""
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
  set nocompatible
endif

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimshell')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neocomplete')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('ujihisa/neco-look')
call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/syntastic.git')
call dein#add('scrooloose/nerdtree')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-rails')
call dein#add('vim-ruby/vim-ruby')
call dein#add('rking/ag.vim')
call dein#add('Townk/vim-autoclose')
call dein#add('AndrewRadev/switch.vim')
call dein#add('rking/ag.vim')
" call dein#add('vim-markdown')
" call dein#add('VimClojure')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
"""""""""""""""dein.vim end""""""""""""""

"""""""""""""""NERDCommenterToggle start"""""""""""""""
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
"""""""""""""""NERDCommenterToggle end"""""""""""""""

"""""""""""""""The-NERD-Commenter start"""""""""""""""
let mapleader = ","
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>
map <Leader>u :<C-u>diffupdate<CR>
"""""""""""""""The-NERD-Commenter end"""""""""""""""

"""""""""""""""ctagsの設定 start"""""""""""""""
if has('path_extra')
  set tags+=./tmp/tags;
endif
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['tmp']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
"""""""""""""""ctagsの設定 end"""""""""""""""

"""""""""""""""NERDTreeToggle start"""""""""""""""
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeHighlightCursorline=1
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif
"""""""""""""""NERDTreeToggle end"""""""""""""""

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

"""""""""""""""neocomplete Start"""""""""""""""
" NeoCompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 3
" smart case有効化。大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3
" -入力による候補番号の表示
let g:neocomplete#enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20

" Define dictionary.
let g:neocomplete#dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'coffee' : $HOME.'/.vim/dict/javascript.dict',
    \ 'vim' : $HOME.'/.vim/dict/vim.dict'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" C-nでneocomplete補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <C-r>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

" buffer開いたらneoconでcache
autocmd BufReadPost,BufEnter,BufWritePost :NeoCompleteBufferMakeCache <buffer>

" FileType毎のOmni補完を設定
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
autocmd FileType coffee     setlocal omnifunc=jscomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete
autocmd FileType ruby       setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
" C
let g:neocomplete#force_omni_input_patterns.c =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" C++
let g:neocomplete#force_omni_input_patterns.cpp =
  \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" Golang
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

"インクルード文のパターンを指定
let g:neocomplete#include_patterns = {
  \ 'ruby'       : '^\s*require',
  \ 'javascript' : '^\s*require',
  \ 'coffee'     : '^\s*require',
  \ }

"インクルード先のファイル名の解析パターン
let g:neocomplete#include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }

" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplete#include_suffixes = {
  \ 'ruby'       : '.rb',
  \ 'javascript' : '.js',
  \ 'coffee'     : '.coffee',
  \ }
"""""""""""""""neocomplete end"""""""""""""""

"""""""""""""""Unite start"""""""""""""""
"最近使ったファイル一覧
noremap <C-f> :Unite file_mru<CR>
"""""""""""""""Unite end"""""""""""""""

filetype on
filetype indent on
filetype plugin on
