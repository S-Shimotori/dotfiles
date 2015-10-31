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
