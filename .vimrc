" filetypeの自動検出をしないようになる(最初に書いておいて最後で検出する)
filetype off

"""""""""""""""""""""""""
" pluginのセットアップ
"""""""""""""""""""""""""
if has('vim_starting')  "vim起動時のみ実行したい部分
    "runtimepath内の特定のファイルが順繰り読み込まれる
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

"neobundle.vimの初期化
"expand()を通さないとチルダが展開されずに文字列として解釈される
"callは戻り値を無視して定義した関数を読み込む
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" :NeoBundleコマンドはプラグインをneobundle.vimに登録する
" :NeoBundleコマンドだけではinstallされないので:NeoBundleInstallする

" ファイルオープンを便利に(unite走査ができるようになる)
NeoBundle 'Shougo/unite.vim'
" 非同期処理ができるようになる
NeoBundle 'Shougo/vimproc'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" solarizedを使うため
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

" Required:
filetype plugin indent on

"""""""""""""""""""""""""
" vim-indent-guidesの設定
"""""""""""""""""""""""""
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=32
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=23
" ガイドの幅
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""
" 各種オプションの設定
"""""""""""""""""""""""""
" 行番号を表示する
set number
" 改行前に前の行のインデントを継続する
set autoindent
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" プログラム入力時にインデントを自動で入力する
set smartindent
" 行を強調表示
set cursorline

" 以下三つを設定しないとindentを色分けできない
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" タブ入力を複数の空白入力に置き換える
set expandtab

" Unite.vim
" タブ一覧(:Unite tab)
nnoremap sT :<C-u>Unite tab<CR>
" 現在のタブで開いたバッファ一覧(:Unite buffer_tab)
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" バッファ一覧(:Unite buffer)
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 最後に残ったウィンドウがNERDTreeのみのときはvimを閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=0


""""""""""""""""""""""""""""""
" 画面分割・タブ
""""""""""""""""""""""""""""""
nnoremap s <Nop>
" 水平分割(default:split)
nnoremap ss :<C-u>sp<CR>
" 垂直分割(default:vsplit)
nnoremap sv :<C-u>vs<CR>

" 分割ウィンドウ間を移動
" 左に移動(default:<C-w>h)
nnoremap sh <C-w>h
" 下に移動(default:<C-w>j)
nnoremap sj <C-w>j
" 上に移動(default:<C-w>k)
nnoremap sk <C-w>k
" 右に移動(default:<C-w>l)
nnoremap sl <C-w>l
" 次に移動(default:<C-w>w)
nnoremap sw <C-w>w

" 幅を増やす
nnoremap s> <C-w>>
" 幅を減らす
nnoremap s< <C-w><

" 分割ウィンドウそのものを移動
" 左に移動(default:<C-w>H)
nnoremap sH <C-w>H
" 下に移動(default:<C-w>J)
nnoremap sJ <C-w>J
" 上に移動(default:<C-w>K)
nnoremap sK <C-w>K
" 右に移動(default:<C-w>L)
nnoremap sL <C-w>L
" 回転(default:<C-w>r)
nnoremap sr <C-w>r

" タブ
" 新規タブ(default:tabnew)
nnoremap st :<C-u>tabnew<CR>
" 次のタブに切り替え(default:gt)
nnoremap sn gt
" 前のタブに切り替え(default:gT)
nnoremap sp gT

" 閉じる
" ウィンドウを閉じる(default:q)
nnoremap sq :<C-u>q<CR>
" バッファを閉じる(default:bd)
nnoremap sQ :<C-u>bd<CR>

""""""""""""""""""""""""""""""
" color scheme
""""""""""""""""""""""""""""""
" 構文ごとに文字色を変化させる
"syntax on
" color schemaの設定
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
syntax enable
let g:solarized_termcolors=256
set t_Co=256
colorscheme solarized
set background=dark
" set background=light

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
" 合わなかったのでやめた
""""""""""""""""""""""""""""""
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


" 検索ハイライト
set hlsearch

" ESC二回押しでハイライトをやめる
nnoremap <ESC><ESC> :nohlsearch<CR>

"""""""""""""""""""""""""
" localのセットアップ
"""""""""""""""""""""""""
" ローカルな設定を分けるためにvim_localを読み込む
" $HOME/.localsetting/vimrc_localが読み込まれる
if filereadable(expand('$HOME/.localsetting/vimrc_local'))
    source $HOME/.localsetting/vimrc_local
endif

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
