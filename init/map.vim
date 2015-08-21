"----------brakets

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

"----------close html tag
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>