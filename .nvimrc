syntax on

set runtimepath+=~/.nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'w0ng/vim-hybrid'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

let g:deoplete#enable_at_startup = 1
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

