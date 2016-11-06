"----------colorscheme
"use syntax
syntax on
"use 256 colors
set t_Co=256

"----------filetype
":h filetype-overrule
let g:filetype_m = 'objc'

"----------complement file name in command line mode
set wildmenu

"----------spell check
set spell
set spelllang=en,cjk

"----------line
augroup MyAutoGroup
    autocmd!
augroup END
set wrap
set linebreak
set showbreak=+\
if (v:version == 704 && has("patch338")) || v:version >= 705
    set breakindent
    autocmd MyAutoGroup BufEnter * set breakindentopt=min:20,shift:0
endif

"----------emoji complete
"set completefunc=emoji#complete

"----------status
set laststatus=2

"----------search
"search both upper and lower with lowercases
set smartcase
"start searching when input one character
set incsearch

"----------yank or cut text and set *register
set clipboard+=unnamed

"----------enable to delete with backspace key
set backspace=indent,eol,start

"----------indent
"insert spaces
set smarttab
"how many spaces insert
set shiftwidth=4
"enable to insert spaces with tab key when insert mode
set expandtab
"1 tab = tabstop value size
set tabstop=4
"input same indent automatically after line break
set autoindent

"----------show line number
"show line number
set number
"show where cursor is
set ruler

"----------brakets
"emphasize another braket
set showmatch

"----------visualize tab,trail,extends,precedes,nbsp,eol,ZenkakuSpace
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%,eol:$

function! UltraDoubleSpace()
	highlight UltraDoubleSpace cterm=reverse ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
	augroup UltraDoubleSpace
		autocmd!
		autocmd ColorScheme * call UltraDoubleSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('UltraDoubleSpace', '　')
	augroup END
	call UltraDoubleSpace()
endif
