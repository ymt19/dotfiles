" setting
"文字コードをUFT-8に設定
set fenc=utf-8
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


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
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
" シンタックスハイライトの有効化
syntax enable


" Tab系
" 不可視文字を可視化(タブが「>...」と表示される)
set list
set listchars=tab:>.,eol:↲
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


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

" vim-plug---------------------------------------------
call plug#begin('~/.vim/plugged')
	" coc.nvim
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" molokai(colorscheme)
	Plug 'tomasr/molokai'

	" tokyonight(colorscheme)
	"Plug 'folke/tokyonight.nvim', {'branch': 'main'}

	Plug 'airblade/vim-gitgutter'
call plug#end()

"" molokai---------------------------------------------
colorscheme molokai

syntax on
set t_Co=256
set termguicolors
set background=dark
""" コメントと選択範囲の色の変更
hi Comment ctermfg=102
hi Visual ctermbg=255

""" 行番号のみハイライト
"hi clear CursorLine
"hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE

"" tokyonight------------------------------------------
"colorscheme tokyonight-night

"" coc.nvim--------------------------------------------
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

hi CocFloating guifg=#c29976 guibg=#2c5c9c
""" 補完メニューの選択中の行の色を変更
hi CocMenuSel guifg=#cccccc guibg=#2a3d75

"" vim-gitgutter--------------------------------------
" Always show sign column
set signcolumn=yes

" By default updatetime is 4000 ms
set updatetime=100

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Default key mapping off
let g:gitgutter_map_keys = 0

" Execute after loading the color schema
" https://teratail.com/questions/29844#reply-46767
augroup vimrc_vim_gitgutter
  autocmd!
  " sign column bg color
  autocmd VimEnter,ColorScheme * highlight SignColumn guibg=bg ctermbg=bg

  " sign column color
  autocmd VimEnter,ColorScheme * highlight GitGutterAdd guifg=#000900 ctermfg=2
  autocmd VimEnter,ColorScheme * highlight GitGutterChange guifg=#bbbb00 ctermfg=3
  autocmd VimEnter,ColorScheme * highlight GitGutterDelete guifg=#ff2222 ctermfg=1
augroup END
