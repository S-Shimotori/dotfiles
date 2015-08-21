"----------colorscheme
"use syntax
syntax on
"use 256 colors
set t_Co=256

"----------filetype
let g:filetype_m = 'objc'

"----------complement file name in command line mode
set wildmenu

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
"move cursor between brakets automatically
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap `` ``<Left>
"delete braket when delete another one with backspace key
function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1
    let str = getline(".")
    let parentLList = ["(", "[", "{", "\'", "\"","<","`"]
    let parentRList = [")", "]", "}", "\'", "\"",">","`"]
    let cnt = 0
    let output = ""
    if pos == strlen(str)
        return "\b"
    endif
    for c in parentLList
        if str[pos-1] == c && str[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction
inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>
"insert another braket after line break
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

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

"----------close html tag
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>
