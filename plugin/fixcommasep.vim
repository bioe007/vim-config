" fixcommasep.vim
"
" Intended to enforce some of my preferred coding conventions.
"
" Perry Hargrave
" 2010-07-01
"
function! FixCommaSep(noconfirm)
    " Fix ugly comma usage, e.g. foo(a,b, c) -> foo(a, b, c)
    if a:noconfirm == 0
        " check before every fix or not?
        let confirm = 'c'
    else
        let confirm = ''
    endif
    let mylist = [
                \ '\(\S\),\(\S\):\1, \2',
                \ '\(\S\)\s\+,\(\S\):\1, \2',
                \ '\(\S\)\s\+,\s\+\(\S\):\1, \2',
                \ '\(\S\)+\(\S\):\1 + \2',
                \ '\(\S\)\s\++\(\S\):\1 + \2',
                \ '\(\S\)\s\+}:\1}',
                \ '{\s\+:{',
                \ '\(\S\)\s\+):\1)',
                \ '(\s\+:(',
                \ '\(\S\)\s\+]:\1]',
                \ '\[\s\+:[',
                \ '\(\S\+\)=\(\S\+\):\1 = \2',
                \]
    for pattern in mylist
        exe '%s:' . pattern . ':ge' . confirm
    endfor
endfunction
"fix comma spacing quickly
map fc :call FixCommaSep(0)<CR>
