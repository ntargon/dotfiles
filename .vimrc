"自動補完
highlight Normal ctermbg=none
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
    exec "imap " . k . " " . k . "<C-N><C-P>"
    endfor

    imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"setting
set fileformats=unix,dos,mac
"文字コードをUFT-8に設定
"set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボード有効化
set clipboard=unnamedplus,autoselect


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
"set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
"set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"カーソルの相対位置を保持してスクリーンを一行スクロール
nnoremap <C-j> gj<C-e>
nnoremap <C-k> gk<C-y> 



" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)

"set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
"ファイル全体から見たカーソルの位置表示
"set ryker
"シンタックスハイライト
syntax on
"オートインデント
set autoindent


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 矢印キーを無効にする
" 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"highlight Normal ctermbg=none

"ノーマルモードで 
nnoremap ; :
noremap <Space> <Nop>
noremap <Space>h  ^
noremap <Space>l  $
nnoremap <CR> i<CR><ESC>
nnoremap <TAB> i<TAB><ESC>
"tab・画面分割関係
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


"ノーマルモードへ jj
inoremap jj <ESC>
"インサートモードで右端へ
"inoremap ll <ESC>$a
"折り畳み
"set foldmethod=indent

"Nerd tree
"map <C-n> <plug>NERDTreeTabsToggle<CR>

"vim-commentary用
autocmd FileType phits setlocal commentstring=#\ %s

"-----------------------------------------------
"dein
"-----------------------------------------------

if &compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
  
  " for phits
  autocmd BufRead,BufNewFile *.inp setfiletype phits
  
  " for tex
  autocmd BufRead,BufNewFile *.tex setfiletype tex
augroup END


"dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.vim/dein')

"dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.vim/dein')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"-----------------------------------------------
