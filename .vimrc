"----------colorscheme
"use syntax
syntax on
"use 256 colors
set t_Co=256

"----------complement file name in command line mode
set wildmenu

"----------status
set laststatus=2

"----------search
"search both upper and lower with lowercases
set smartcase
"start searching when input one character
set incsearch

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

"----------Neobundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"neocomplcache/neocomplete
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patc    h885')))
endfunction
if s:meet_neocomplete_requirements()
   NeoBundle 'Shougo/neocomplete.vim'
   NeoBundleFetch 'Shougo/neocomplcache.vim'
else
   NeoBundleFetch 'Shougo/neocomplete.vim'
   NeoBundle 'Shougo/neocomplcache.vim'
endif
if s:meet_neocomplete_requirements()
"neocomplete
else
   let g:neocomplcache_enable_at_startup = 1
   let g:neocomplcache_enable_smart_case = 1
   let g:neocomplcache_enable_camel_case_completion = 0
   let g:neocomplcache_enable_underbar_completion = 1
   let g:neocomplcache_min_syntax_length = 3
endif

"write html/css easily (like zen)
NeoBundle 'mattn/emmet-vim'

"check error
NeoBundle 'scrooloose/syntastic.git'

"colorscheme
NeoBundle 'w0ng/vim-hybrid'

"show color code's color
"[ColorHighlight]   start/update highlighting
"[ColorClear]       clear all highlights
"[ColorToggle]      toggle highlights
NeoBundle 'lilydjwg/colorizer'

"move cursor to another tag with %
NeoBundle 'tmhedberg/matchit'

"move cursor to if/endif with %
NeoBundle 'vimtaku/hl_matchit.vim.git'

"for edit html5
NeoBundle 'othree/html5.vim'

"syntax for css3
NeoBundle 'hail2u/vim-css3-syntax'

"library for vim script
NeoBundle 'vim-jp/vital.vim'

"run script
NeoBundle 'thinca/vim-quickrun'

"snippet
NeoBundle 'Shougo/neosnippet'

"snippet data
NeoBundle 'Shougo/neosnippet-snippets'

"syntax for scala
NeoBundle 'derekwyatt/vim-scala'

"syntax for swift
NeoBundle 'Keithbsmiley/swift.vim'

"syntax for haskell
NeoBundle 'dag/vim2hs'

"matrix [Matrix]
NeoBundle 'uguu-org/vim-matrix-screensaver'

"show menu when start
NeoBundle 'mhinz/vim-startify'

"highlight whitespace end of line
"[FixWhitespace]delete whitespace
NeoBundle 'bronson/vim-trailing-whitespace'

"display indent line(may invalidate some syntax)
NeoBundle 'Yggdroot/indentLine'

"snippet data
NeoBundle 'honza/vim-snippets'

"status/tab line
NeoBundle 'itchyny/lightline.vim'

"highlight search
NeoBundle 'haya14busa/incsearch.vim'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"----------plugin settings
"w0ng/vim-hybrid settings
"for iTerm
"https://gist.github.com/luan/6362811
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid

"hl_matchit settings
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft = 'html\|php\|vim\|ruby\|sh'

"html5 settings
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_a_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1

"quickrun(scala) settings
"not neccessary if quickrun with MacVim
nnoremap <silent> \r :QuickRun -cmdopt "<CR>
"output encoding
set termencoding=utf-8

"neosnippet settings
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"indentLine settings
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#333333'
let g:indentLine_char = '|'

"lightline settings
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'modified': '%{&filetype=="help"?":&modified?"+":&modifiable?":"-"}'
    \ },
    \ 'component_visible_condition': {
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
    \ },
    \ }

"incsearch settings
map /   <Plug>(incsearch-forward)
map ?   <Plug>(incsearch-backward)
map g/  <Plug>(incsearch-stay)
