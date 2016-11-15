" vimrc
" perry hargrave
"
"
set backspace=indent,eol,start
set nocompatible   " let vim be vim, not vi
set history=550    " have 550 lines of command-line (etc) history:
set undolevels=200 " number of commands
set hidden         " dont require saving to switch buffers
set nowrap         " dont wrap long lines
set shiftwidth=4   " use indents of 4 spaces,
set tabstop=4      " and have them copied down lines:
set shiftround     " round indent to multiple of sw
set expandtab      " use spaces instead of tabs
set autoindent     " copy indent from prev line or syn
set cindent
set smarttab       " smartly handle the tab/space thing
set completeopt=longest,menuone
let mapleader = ","

let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:scratch_height = 16

runtime macros/matchit.vim

" set wcm=<TAB>
"  OS dependent options
if has("unix")
    " trailing backslash stores entire file path in backupdir
    let g:my_vimrc = $HOME . "/.vim/vimrc"
    let g:my_vimdir = $HOME . "/.vim"
    let g:my_guifont = "Terminus\\ 12"

    set shell=/bin/zsh

    set tags=./tags,./TAGS,tags,TAGS,/usr/tags
    let my_ctags_cmd = '/usr/bin/ctags'
else
    " windows
    let g:my_vimrc = $HOME . "/_vimrc"
    let g:my_vimdir = $HOME . "/_vim"
    let g:my_guifont = "Lucida_Console:h11:cANSI"


    let &tags="X:/sandbox/tags,./tags,./TAGS,tags,TAGS"
    let my_ctags_cmd = g:my_vimdir . '/bin/ctags.exe'
    let g:tagbar_ctags_bin = my_ctags_cmd
endif

" activate pathogen
" runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
call pathogen#helptags()


let &runtimepath=my_vimdir . "," . &runtimepath
let &backupdir=my_vimdir.'/var/backups//'
let &directory=my_vimdir.'/var/swap//'
let g:scratch_file = my_vimdir . '/var/scratch'

" xolox/vim-notes
let g:notes_directories=['~/Notes/']
let g:notes_suffix=".txt"
let g:notes_indexfile=my_vimdir.'/var/notes_indexfile'
let g:notes_tagsindex=my_vimdir.'/var/notes_tagsindex'

augroup skelLoad
    " skeleton files
    au!
    let g:author = "Perry Hargrave"
    function! s:template_keywords()
        " replace filename, author and date in templates
        %s/\$\<FILENAME\>/\=expand('%:t')/e
        %s/\$\<DATE\>/\=strftime("%Y-%m-%d")/e
        if exists("g:author")
            %s/\$\<AUTHOR\>/\=expand(g:author)/
        endif
        set foldlevel=1
        $
    endfunction

    exe "au BufNewFile *.c,*.cpp,*.h 0r" my_vimdir."/templates/skeleton.c"
    exe "au BufNewFile  *.lua 0r" my_vimdir."/templates/skeleton.lua"
    exe "au BufNewFile  *.py 0r" my_vimdir."/templates/skeleton.py"
    exe "au BufNewFile  *.html 0r" my_vimdir."/templates/skeleton.html"
    au BufNewFile *.[ch],*.lua,*.py call s:template_keywords()
augroup END

let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 10

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "passive",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

""" Appearance
set nonumber       " dont show line numbers
set vb t_vb=       " no flash
set showmatch      " show matches for parens/brackets
set cmdheight=1    " command line one line high
set winminheight=0 " let windows shrink to filenames only
set showmode       " display the current mode
set showcmd        " and partially-typed commands in the status line:
set scrolloff=5    " keep cursor +/- 5 lines in window
set ruler          " cursor pos always shown
set shortmess+=aI
set background=dark
set cursorline
let &showbreak = '> '

""" Status line
function! StatuslineTrailingSpaceWarning()
    "return '[\s]' if trailing white space is detected
    if !exists("b:statusline_trailing_space_warning")
        let b:statusline_trailing_space_warning = search('\s\+$', 'nw')

        if b:statusline_trailing_space_warning == 0
            let b:statusline_trailing_space_warning = ''
        else
            let b:statusline_trailing_space_warning =
                        \'[\s' . b:statusline_trailing_space_warning . ']'
        endif
    endif

    return b:statusline_trailing_space_warning
endfunction

function! StripTrailingSpace()
    "remove all trailing whitespace from buffer
    if search('\s\+$', 'nw') != 0
        norm! mZ
        exe '%s:\s\+$::'
        unlet! b:statusline_trailing_space_warning
        call StatuslineTrailingSpaceWarning()
        norm! 'Z
    endif
endfunction

function! StatuslineTabWarning()
    "set the b:statusline_tab_warning string
    "return '[&et]' if &et is set wrong
    "return '[mixed-indenting]' if spaces and tabs are used to indent
    "return an empty string if everything is fine
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixindent]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

function! StatuslineLongLineWarning()
    " Warning for "long lines" where "long" is either &tw or 80.
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()
        let b:statusline_long_line_warning = ""

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[". b:long_line . "]"
        endif
    endif
    return b:statusline_long_line_warning
endfunction

function! s:LongLines()
    "return a list containing the lengths of the long lines in this buffer
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    if exists("b:long_line")
        unlet b:long_line
    endif

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            if !exists("b:long_line")
                "push the first line as the next bad line
                let b:long_line = i
            endif
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

" controls the output of longline functions
let g:SL_LongLine_Verbose=1

" statusline content/format
"   %#<some syn group># changes color, %* restores nl hilight
set statusline=
set statusline+=%<%-.22f\     " filename

set statusline+=%#TagListTagName#%{tagbar#currenttag('[%<%-.20s]','')}%*

" display a warning if fileformat isnt unix
set statusline+=%#error#%{&ff!='unix'?'['.&ff.']':''}%*

" display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#%{&ro?'':StatuslineTabWarning()}%*

" show git branch
set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" warning '\s' if trailing spaces found
set statusline+=%#error#%{&ro?'':StatuslineTrailingSpaceWarning()}
set statusline+=%*

" warning if 'long' line is found
set statusline+=%#error#%{&ro?'':StatuslineLongLineWarning()}
set statusline+=%*

"show modified, or RO
set statusline+=%#SignColumn#%{&mod?'[+]':''}
set statusline+=%{&ro?'[RO]':''}
set statusline+=%#DiffText#%w%*
set statusline+=%=                          "left/right separator
set statusline+=%-12.(\[%l,\ %c%V\]%)%*
set statusline+=%P\ #%n
set laststatus=2

if !exists("slau_loaded")
    "Autocommands for statusline
    let slau_loaded = 1
    augroup sbars
        au!
        au cursorholdi,cursorhold,bufwritepost * unlet!
                    \ b:statusline_trailing_space_warning
        au cursorhold,bufwritepost * unlet! b:statusline_tab_warning
        au cursorholdi,cursorhold,bufwritepost * unlet!
                    \ b:statusline_long_line_warning
    augroup END
endif

if has("gui_running")
    set mousehide    " Hide the mouse when typing text
    set guioptions=
    set guioptions+=c
    exe "set guifont=" . g:my_guifont
    let g:my_colors = 'zenburn'
elseif &t_Co == 256
    let g:my_colors = 'zenburn'
else
    let g:my_colors = 'desert'
endif

exe ":colorscheme" g:my_colors

" first list the available options and complete the longest common part
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe
set sessionoptions=blank,buffers,curdir,folds,help,winsize,tabpages
set viminfo=/30,'1000,r/media,r/.gvfs,r/.ssh,f0,h,\"100,%

if has('mouse')
    set mouse=a
endif

if !exists("syntax_on")
    syntax on
endif

function! HighlightDefinedNames()
    " Clear any existing defined names
    syn clear DefinedName
    " Run through the whole file
    for l in getline('1','$')
    	" Look for #define
    	if l =~ '^\s*#\s*define\s\+'
            let name = substitute(l,'^\s*#define\s\+\(\k\+\).*$', '\1', 'I')
            exe 'syn keyword DefinedName ' . name
        elseif l =~# "\<\w\+\.[A-Z_]\+[0-9A-Z_]\+\>"
            let name = substitute(l,
                \'\(\<\w\+\.[A-Z]\+[0-9A-Z_]\+\>\)', '\1', 'I')
            exe 'syn keyword DefinedName ' . name
        elseif l =~# "^\s*\<[A-Z_]\+[0-9A-Z_]\+\>\s*"
            let name = substitute(l,
            \ '.*\(\<[A-Z]\+[0-9A-Z_]*\>\).*$', '\1', 'I')
            exe 'syn keyword DefinedName ' . name
    	endif
    endfor
    " syn match DefinedName "\<\w\+\.[A-Z_]\+[0-9A-Z_]\+\>"
    " syn match DefinedName "^\s*\<[A-Z_]\+[0-9A-Z_]\+\>\s*"
endfunction

function! HiPyDocStrings()
    syn match  pythonBlock ":$" nextgroup=pythonDocString skipempty skipwhite
    syn region pythonDocString matchgroup=Normal start=+[uU]\='+ end=+'+
                \ skip=+\\\\\|\\'+ contains=pythonEscape,@Spell contained
    syn region pythonDocString matchgroup=Normal start=+[uU]\="+ end=+"+
                \ skip=+\\\\\|\\"+ contains=pythonEscape,@Spell contained
    syn region pythonDocString matchgroup=Normal start=+[uU]\="""+ end=+"""+
                \ contains=pythonEscape,@Spell contained
    syn region pythonDocString matchgroup=Normal start=+[uU]\='''+ end=+'''+
                \ contains=pythonEscape,@Spell contained
    hi def link pythonDocString Comment
endfunction

function! MyCSettings()
    set fo+=ro fdm=syntax tw=80 iskeyword+=35 nowrap
    " syn match matchName /\(#define\)\@<= .*\(\\$\)\=\_.*/
    call ReIAB("#include")
    call ReIAB("#define")
    call LoadTypesHilights()
endfunction

function! MyPythonSettings()
    set fo+=ro fdm=indent tw=80 iskeyword+=35 nowrap
    call HiPyDocStrings()
    iab __i def __init__(self, *args, **kwargs):
    iab ar* *args, **kwargs):
endfunction

" load the types.vim highlighting file, if it exists
function! LoadTypesHilights()
    let fname = expand('<afile>:p:h') . '/types.vim'
    if filereadable(fname)
        exe 'so ' . fname
    endif
endfunction

augroup ftypes
    au!
    filetype on
    filetype plugin on
    filetype plugin indent on

    au FileType * set fo-=l et ts=8 sw=4 sts=4
    au FileType,bufwritepost,cursorhold c,cpp,python,lua,basic call
                                                \ HighlightDefinedNames()
    au BufRead,BufNewFile *.lua.in set ft=lua
    au FileType make set noet sw=8 ts=8 fdm=indent tw=80
    au FileType basic,lua,python,vim,zsh,sh,java
                \ set formatoptions+=ro fdm=indent tw=80
    au FileType c,cpp call MyCSettings()

    au BufRead,BufNewFile *.txt set ft=text tw=72
    au BufRead,BufNewFile *.md set ft=markdown sw=2 tw=72
    au FileType text set tw=0 linebreak wrap

    " git TAG descriptions are recognized as 'conf' files.. :S
    au BufRead,BufNewFile .git/TAG* set ft=gitcommit
    au FileType gitcommit call setpos('.', [0, 1, 1, 0])
    au FileType gitcommit,mail set tw=72 nofoldenable

    let c_comment_strings    = 1 " strings inside C comments
    let perl_fold            = 1
    let lua_fold             = 1
    let lua_version          = 5
    let lua_subversion       = 1
    let python_fold          = 1
    let python_highlight_all = 1
    let g:is_bash            = 1
    let g:sh_fold_enabled    = 7 " allow all folds in bash
augroup END

" search & replace
set ignorecase " make searches case-insensitive,
set smartcase  " unless they contain upper-case letters:
set incsearch  " show the `best match so far'
set hlsearch   " set highlighted search on

" bindings
map <f12> :Lodgeit<CR>
exe 'map <Leader>b :buffer '
map <silent> <Leader>r :help qrcard<CR><C-W>L:vertical res 60<CR>
map <silent> <Leader>s :call StripTrailingSpace()<CR>
nnoremap <C-l> :nohlsearch<CR><C-l>
map <Leader>x :ToggleScratch<CR>
map <Leader>cc <plug>NERDCommenterToggle

" Quickly focus on a single file, then be able to return
nmap <Leader>% :tabedit %<CR>
nmap <Leader>c :tabclose<CR>

" if forget to `sudo vim` a file
cmap w!! w !sudo tee % >/dev/null

" completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Load my TODO list and unfold it
map <Leader>p :exe "tabe " . $HOME . '/TODO'<CR>zi

",v ,V edit/reload vimrc
map <Leader>v :exe "sp" g:my_vimrc<CR>
map <silent> <Leader>V :exe "source" g:my_vimrc<CR>
            \:filetype detect<CR>
            \:exe ":echo 'vimrc reloaded'"<CR>

function! MyGoToLongLine()
    " Helper function moves to the next long line in buffer
    if exists("b:long_line")
        call cursor(b:long_line, (&tw ? &tw : 80))
        " unfold, then move cursor line to top of window and move back a word
        norm! zv
        norm! zt
        norm! b
    else
        echo "No long lines found"
    endif
endfunction
map <silent> <Leader>l :call MyGoToLongLine()<CR>

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" windows
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
map <C-m> <C-W>+
map <C-n> <C-W>-
map <silent> <Leader>t :TagbarToggle<CR>
map <F8> :exe "! " my_ctags_cmd
            \" -R --c++-kinds=+p --fields=+iaS --extra=+q "<CR>
nnoremap <Leader>, k:call
            \ search('^'. matchstr(getline(line('.')+1), '\(\s*\)')
            \ .'\S', 'b')<CR>^
nnoremap <Leader>. :call
            \ search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^

" insert time
map <Leader>D "=strftime("%Y-%m-%d")<CR>P"

" abbreviations
iab teh the
iab seperate separate
iab tihs this
iab adn and
iab <expr> ddate strftime("%Y-%m-%d")
