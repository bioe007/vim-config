" file: reabbreviate.vim
"
" auth: Perry Hargrave
" date: 2010-07-02
"
" Recursively abbreviate, so you don't have to remember where to break a word to
" get the abbreviation. This is a bit autocompletish, e.g.
"
" call ReIAB("#include")
"
" -- later --
"
"  #i     --> #include
"  #in    --> #include
"  #inc   --> #include
"  #incl  --> #include
"  #inclu --> #include
"
"  These are, of course, subject to the nomral insert mode abbreviation rules.
"
function! ReIAB(word, ...)
    " Recursively define abbreviations
    if exists("a:word") == 0
        return
    endif

    if exists("a:1")
        let tgt = a:1
    else
        let tgt = a:word
    endif

    for i in range(2, strlen(a:word) - 1)
        let abbrev = strpart(a:word, 0, i)
        exe "ia" l:abbrev l:tgt
    endfor
endfunction

call ReIAB("Perry", "Perry Hargrave")
