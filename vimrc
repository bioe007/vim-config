" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
if has("unix")
    " NOTE: YCM is a PITA on windows...
    Plug 'valloric/youcompleteme'
    Plug 'SirVer/ultisnips'
endif
Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'adelarsq/vim-matchit'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

call plug#end()

set backspace=indent,eol,start
set encoding=utf-8
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
let NERDSpaceDelims=1  " spaces after comment char

if has("unix")
    " trailing backslash stores entire file path in backupdir
    let g:my_vimrc = $HOME . "/.vim/vimrc"
    let g:my_vimdir = $HOME . "/.vim"
    let g:my_guifont = "Hack\\ 11"
else
    " windows
    let g:my_vimdir = $HOME . "/vimfiles"
    let g:my_vimrc = $HOME . "/vimfiles/vimrc"
    let g:my_guifont = "Hack:h11:cANSI"
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

" Keep working directories clutter-free
let &runtimepath=my_vimdir . "," . &runtimepath
let &backupdir=my_vimdir.'/var/backups//'
let &directory=my_vimdir.'/var/swap//'

" first list the available options and complete the longest common part
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe
set sessionoptions=blank,buffers,curdir,folds,help,winsize,tabpages
set viminfo=/30,'1000,r/media,r/.gvfs,r/.ssh,f0,h,\"100,%

" search & replace
set ignorecase " make searches case-insensitive,
set smartcase  " unless they contain upper-case letters:
set incsearch  " show the `best match so far'
set hlsearch   " set highlighted search on

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
" trying to fix gofmt folding
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" KEYS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <Leader>s :call StripTrailingSpace()<CR>
map <silent> <Leader>t :TagbarToggle<CR>
nnoremap <C-l> :nohlsearch<CR><C-l>
exe 'map <Leader>b :buffer '

" Fixes conflict with YCM and UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

",v ,V edit/reload vimrc
map <Leader>v :exe "sp" g:my_vimrc<CR>
map <silent> <Leader>V :exe "source" g:my_vimrc<CR>
            \:filetype detect<CR>
            \:exe ":echo 'vimrc reloaded'"<CR>

" if forget to `sudo vim` a file
cmap w!! w !sudo tee % >/dev/null

" Windows
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
map <C-m> <C-W>+
map <C-n> <C-W>-

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" I hate long lines
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

" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyCSettings()
    set fo+=ro fdm=syntax tw=80 iskeyword+=35 nowrap
    " syn match matchName /\(#define\)\@<= .*\(\\$\)\=\_.*/
    call ReIAB("#include")
    call ReIAB("#define")
    " call LoadTypesHilights()
endfunction

function! MyPythonSettings()
    set fo+=ro fdm=indent tw=80 iskeyword+=35 nowrap
    " call HiPyDocStrings()
    iab __i def __init__(self, *args, **kwargs):
    iab ar* *args, **kwargs):
endfunction

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

function! MyGoSettings()
    " autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    setlocal et fo+=ro fdm=syntax tw=79 iskeyword+=35 nowrap noet ts=4 sw=4
    autocmd FileType go noremap <leader>m  :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go noremap <leader>r  :GoRun<CR>
endfunction

augroup ftypes
    au!
    filetype on
    filetype plugin on
    filetype plugin indent on

    au FileType * set fo-=l et ts=8 sw=4 sts=4
    au BufRead,BufNewFile *.lua.in set ft=lua
    au FileType make set noet sw=8 ts=8 fdm=indent tw=80
    au FileType basic,lua,python,vim,zsh,sh,java,go
                \ set formatoptions+=ro fdm=indent tw=80
    au FileType c,cpp call MyCSettings()
    au FileType python call MyPythonSettings()
    au FileType go call MyGoSettings()
    au BufRead,BufNewFile *.go call MyGoSettings()

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

" Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1


function! StripTrailingSpace()
    "remove all trailing whitespace from buffer
    if search('\s\+$', 'nw') != 0
        norm! mZ
        exe '%s:\s\+$::'
        norm! 'Z
    endif
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

" Golang
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
