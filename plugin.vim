
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
NeoBundle 'keith/swift.vim'

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

"status/tab line
NeoBundle 'itchyny/lightline.vim'

"highlight search
NeoBundle 'haya14busa/incsearch.vim'

"syntax for markdown
NeoBundle 'plasticboy/vim-markdown'

"preview markdown
NeoBundle 'kannokanno/previm'

"open browser
NeoBundle 'tyru/open-browser.vim'

"for latex
NeoBundle 'vim-latex/vim-latex'

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
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

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

"previm settings
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'open -a Google\ Chrome'

"vim-latex settings
let g:Tex_AutoFolding = 0
let g:Tex_Folding = 0
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_ViewRule_ps = 'open'
let g:Tex_ViewRule_dvi = 'open'
"for external vimgrep
"set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
"for bibtex
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_dvi = 'platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
