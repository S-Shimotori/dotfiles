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
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
    endfunction
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplete#close_popup()
    inoremap <expr><C-e> neocomplete#cancel_popup()
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
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

"interactive command execution
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\       'windows' : 'tools\\update-dll-mingw',
\       'cygwin' : 'make -f make_cygwin.mak',
\       'mac' : 'make',
\       'linux' : 'make',
\       'unix' : 'gmake',
\   },
\ }

"Gauche REPL
NeoBundle 'aharisu/vim_goshrepl'

"emoji(complete)
NeoBundle 'junegunn/vim-emoji'

"emoji(list)
NeoBundle 'mattn/emoji-vim'

"complete(include emoji)
"NeoBundle 'rhysd/github-complete.vim'

"git diff
NeoBundle 'airblade/vim-gitgutter'

"kotlin
NeoBundle 'udalov/kotlin-vim'

"indent
NeoBundle 'kana/vim-textobj-indent'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
