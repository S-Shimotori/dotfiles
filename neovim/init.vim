syntax on

set backspace=indent,eol,start
"set backup
"set history=50
set number
set ruler
set showcmd
set wildmenu
set laststatus=2
set smartcase
set incsearch
set clipboard+=unnamed
set smarttab
set shiftwidth=4
set expandtab
set tabstop=4
set autoindent
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%,eol:$

set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
set runtimepath+=~/.config/nvim/deoplete.nvim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'itchyny/lightline.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

let g:deoplete#enable_at_startup = 1
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
set background=dark
