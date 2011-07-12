" apathy.vim
" a vim colorscheme for 256 colors, template from gglucas (oblivion, whoever the
" original author idk) modified by bioe007  perrydothargraveatgmail.com
"
" This colorscheme script was created using Hans Fugal's colorscheme template
" :so $VIMRUNTIME/syntax/hitest.vim

if version > 580
    hi clear

    if exists("syntax_on")
        syntax reset
    endif
endif

if exists("g:apathy_style")
    let s:apathy_style = g:apathy_style
else
    let s:apathy_style = &background
endif

set background=dark
let g:colors_name="apathy"

if s:apathy_style == "light"
    hi Normal       ctermfg=235  ctermbg=247
    hi SpecialKey   ctermfg=19
    hi Folded       ctermfg=60   ctermbg=NONE           cterm=bold
    hi NonText      ctermfg=16   ctermbg=239            cterm=NONE
    hi Directory    ctermfg=130                         cterm=bold
    hi ErrorMsg     ctermfg=124  ctermbg=NONE           cterm=bold
    hi IncSearch    ctermfg=147  ctermbg=20             cterm=NONE
    hi Search       ctermfg=231  ctermbg=139            cterm=NONE
    hi MoreMsg      ctermfg=99   ctermbg=NONE           cterm=NONE
    hi ModeMsg      ctermfg=136  ctermbg=250           cterm=NONE
    hi LineNr       ctermfg=236  ctermbg=245            cterm=NONE
    hi Question     ctermfg=11
    hi StatusLine   ctermfg=146  ctermbg=237            cterm=bold
    hi StatusLineNC ctermfg=58  ctermbg=146             cterm=bold
    hi VertSplit    ctermfg=239  ctermbg=239            cterm=none
    hi Title        ctermfg=232  ctermbg=NONE           cterm=bold
    hi VisualNOS                 ctermbg=NONE           cterm=bold,underline
    hi Visual       ctermfg=NONE    ctermbg=194            cterm=bold
    hi WarningMsg   ctermfg=88   ctermbg=NONE           cterm=bold
    hi WildMenu      ctermfg=0        ctermbg=11        cterm=NONE
    hi Folded         ctermfg=60  ctermbg=NONE cterm=NONE
    hi FoldColumn     ctermfg=247  ctermbg=238 cterm=bold
    hi DiffAdd        ctermfg=18  ctermbg=NONE cterm=bold
    hi DiffChange     ctermfg=53  ctermbg=NONE cterm=bold
    hi DiffDelete     ctermfg=124 ctermbg=NONE
    hi DiffText       ctermfg=238 ctermbg=NONE
    hi SignColumn    ctermfg=14       ctermbg=242             cterm=NONE
    hi SpellBad      ctermbg=9        ctermbg=NONE            cterm=NONE
    hi SpellCap      ctermbg=12       ctermbg=NONE            cterm=NONE
    hi SpellRare     ctermbg=13       ctermbg=NONE            cterm=NONE
    hi SpellLocal    ctermbg=14       ctermbg=NONE            cterm=NONE
    hi Pmenu          ctermfg=232 ctermbg=62
    hi PmenuSel       ctermfg=248  ctermbg=17
    hi PmenuSbar      ctermfg=15  ctermbg=237
    hi PmenuThumb                                             cterm=reverse
    hi TabLine   ctermfg=235 ctermbg=241
    hi TabLineSel   ctermfg=23 cterm=bold
    " hi TabLineFill   ctermfg=23 cterm=bold
    hi CursorColumn                 ctermbg=249 cterm=NONE
    hi CursorLine                   ctermbg=249 cterm=NONE
    hi MatchParen     ctermfg=21   ctermbg=228 cterm=BOLD
    hi Comment        ctermfg=239
    hi Constant       ctermfg=22 ctermbg=NONE
    hi Special        ctermfg=94
    hi Identifier     ctermfg=17
    hi Statement      ctermfg=237 cterm=bold
    hi Repeat         ctermfg=22
    hi Define         ctermfg=17
    hi PreProc        ctermfg=61
    hi Type           ctermfg=52
    hi Underlined     ctermfg=21
    hi Conditional    ctermfg=232 cterm=bold
    hi Ignore         ctermfg=0
    hi Error          ctermfg=124   ctermbg=NONE  cterm=bold
    hi Todo           ctermfg=18  ctermbg=227 cterm=bold
    hi String       ctermfg=23 ctermbg=NONE cterm=NONE
    hi Number        ctermfg=18      ctermbg=NONE            cterm=NONE
    hi Function       ctermfg=58 cterm=bold
    hi Cursor  ctermfg=2 ctermbg=28
    hi Operator       ctermfg=237 cterm=bold
    hi helpNormal     ctermfg=231
    hi Tag            ctermfg=230             cterm=bold
    hi TagListTitle   ctermfg=233 ctermbg=none              cterm=bold
    hi TagListTagName ctermfg=31  ctermbg=250  cterm=bold
    hi TagListFileName ctermfg=247  ctermbg=238 cterm=bold
    hi helpHyperTextJump ctermfg=23
    hi Boolean        ctermfg=124              cterm=bold
    " hi MatchParen     ctermfg=17  ctermbg=153
    " hi cBlock       ctermfg=11   ctermbg=11       cterm=NONE

elseif s:apathy_style == "mono"
    " a very subdued version
    hi Normal        ctermfg=250      ctermbg=0               cterm=NONE
    hi SpecialKey    ctermfg=244      ctermbg=NONE            cterm=NONE
    hi NonText       ctermfg=239      ctermbg=16              cterm=NONE
    hi Directory     ctermfg=74       ctermbg=NONE            cterm=NONE
    hi ErrorMsg      ctermfg=15       ctermbg=1               cterm=NONE
    hi IncSearch     ctermfg=202      ctermbg=231             cterm=reverse
    hi Search        ctermfg=231      ctermbg=139             cterm=NONE
    hi MoreMsg       ctermfg=221      ctermbg=NONE            cterm=NONE
    hi ModeMsg       ctermfg=221      ctermbg=NONE            cterm=bold
    hi LineNr        ctermfg=239      ctermbg=16              cterm=NONE
    hi Question      ctermfg=121      ctermbg=NONE            cterm=NONE
    hi StatusLine    ctermfg=17       ctermbg=67              cterm=bold
    hi StatusLineNC  ctermfg=black    ctermbg=gray            cterm=NONE
    hi VertSplit     ctermfg=240      ctermbg=240             cterm=NONE
    hi Title         ctermfg=202      ctermbg=NONE            cterm=NONE
    hi VisualNOS                      ctermbg=NONE     cterm=bold,underline
    hi Visual        ctermfg=231      ctermbg=59              cterm=NONE
    hi WarningMsg    ctermfg=202
    hi WildMenu      ctermfg=0        ctermbg=11              cterm=NONE
    hi Folded        ctermfg=144      ctermbg=NONE            cterm=NONE
    hi FoldColumn    ctermfg=16       ctermbg=239             cterm=NONE
    hi DiffAdd       ctermfg=103      ctermbg=NONE              cterm=bold
    hi DiffChange    ctermfg=231      ctermbg=64              cterm=NONE
    hi DiffDelete    ctermfg=58      ctermbg=NONE              cterm=NONE
    hi DiffText      ctermfg=231      ctermbg=64              cterm=bold
    hi SignColumn    ctermfg=14       ctermbg=242             cterm=NONE
    hi SpellBad      ctermbg=9        ctermbg=NONE            cterm=NONE
    hi SpellCap      ctermbg=12       ctermbg=NONE            cterm=NONE
    hi SpellRare     ctermbg=13       ctermbg=NONE            cterm=NONE
    hi SpellLocal    ctermbg=14       ctermbg=NONE            cterm=NONE
    hi Pmenu         ctermfg=0        ctermbg=139             cterm=NONE
    hi PmenuSel      ctermfg=0        ctermbg=11              cterm=NONE
    hi PmenuSbar     ctermfg=0        ctermbg=248             cterm=NONE
    hi PmenuThumb                                             cterm=reverse
    hi TabLine       ctermfg=251      ctermbg=239             cterm=NONE
    hi TabLineSel    ctermfg=189      ctermbg=NONE            cterm=bold
    hi TabLineFill   ctermfg=239      ctermbg=16
    hi CursorColumn                   ctermbg=16
    hi CursorLine                     ctermbg=234             cterm=NONE
    hi MatchParen    ctermfg=231      ctermbg=139
    hi Comment       ctermfg=147      ctermbg=NONE
    hi Constant      ctermfg=101      ctermbg=NONE            cterm=bold
    hi Special       ctermfg=145      ctermbg=NONE            cterm=underline
    hi Identifier    ctermfg=243       ctermbg=NONE            cterm=NONE
    hi Statement     ctermfg=103      ctermbg=NONE            cterm=NONE
    hi Repeat        ctermfg=103      ctermbg=NONE            cterm=bold
    hi Define        ctermfg=247      ctermbg=NONE            cterm=NONE
    hi PreProc       ctermfg=246       ctermbg=NONE            cterm=NONE
    hi Type          ctermfg=245       ctermbg=NONE            cterm=NONE
    hi Underlined    ctermfg=81       ctermbg=NONE            cterm=underline
    hi Conditional   ctermfg=244      ctermbg=NONE            cterm=bold
    hi Ignore        ctermfg=0
    hi Error         ctermfg=15       ctermbg=9               cterm=NONE
    hi Todo          ctermfg=11       ctermbg=90              cterm=reverse
    hi String        ctermfg=223      ctermbg=NONE            cterm=NONE
    hi Number        ctermfg=251      ctermbg=NONE            cterm=bold
    hi Function      ctermfg=146      ctermbg=NONE            cterm=NONE
    hi Cursor        ctermfg=16       ctermbg=231             cterm=NONE
    hi Operator      ctermfg=111      ctermbg=NONE            cterm=NONE
    hi cInclude     ctermfg=110   ctermbg=NONE
    hi cPreProc     ctermfg=110   cterm=underline
    hi cPreCondit   ctermfg=110  ctermbg=NONE       cterm=NONE
    " hi cBlock       ctermfg=11   ctermbg=NONE       cterm=NONE
    hi cBracket     ctermfg=131   ctermbg=NONE       cterm=NONE
    hi cNumbers     ctermfg=10   ctermbg=NONE       cterm=NONE
    hi cParen       ctermfg=29   ctermbg=NONE       cterm=NONE
    hi cUserCont    ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cNumbersCom  ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cMulti       ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cCppParen    ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cCppBracket  ctermfg=214  ctermbg=NONE       cterm=NONE
    hi TagListTitle     ctermfg=37                 cterm=NONE
    hi TagListTagName   ctermfg=16   ctermbg=153   cterm=bold
    hi TagListFileName  ctermfg=116  ctermbg=NONE  cterm=underline
    hi TagListComment   ctermfg=1    ctermbg=NONE  cterm=NONE

else
    " default 'dark' case
    hi Normal        ctermfg=250      ctermbg=0               cterm=NONE
    hi SpecialKey    ctermfg=244      ctermbg=NONE            cterm=NONE
    hi NonText       ctermfg=239      ctermbg=16              cterm=NONE
    hi Directory     ctermfg=74       ctermbg=NONE            cterm=NONE
    hi ErrorMsg      ctermfg=15       ctermbg=1               cterm=NONE
    hi IncSearch     ctermfg=202      ctermbg=231             cterm=reverse
    hi Search        ctermfg=231      ctermbg=139             cterm=NONE
    hi MoreMsg       ctermfg=221      ctermbg=NONE            cterm=NONE
    hi ModeMsg       ctermfg=221      ctermbg=NONE            cterm=bold
    hi LineNr        ctermfg=239      ctermbg=16              cterm=NONE
    hi Question      ctermfg=121      ctermbg=NONE            cterm=NONE
    hi StatusLine    ctermfg=17       ctermbg=67              cterm=bold
    hi StatusLineNC  ctermfg=black    ctermbg=gray            cterm=NONE
    hi VertSplit     ctermfg=240      ctermbg=240             cterm=NONE
    hi Title         ctermfg=202      ctermbg=NONE            cterm=NONE
    hi VisualNOS                      ctermbg=NONE     cterm=bold,underline
    hi Visual        ctermfg=231      ctermbg=59              cterm=NONE
    hi WarningMsg    ctermfg=202
    hi WildMenu      ctermfg=0        ctermbg=11              cterm=NONE
    hi Folded        ctermfg=146      ctermbg=NONE            cterm=NONE
    hi FoldColumn    ctermfg=16       ctermbg=239             cterm=NONE
    hi DiffAdd       ctermfg=231      ctermbg=18              cterm=bold
    hi DiffChange    ctermfg=231      ctermbg=64              cterm=bold
    hi DiffDelete    ctermfg=231      ctermbg=53              cterm=bold
    hi DiffText      ctermfg=231      ctermbg=64              cterm=bold
    hi SignColumn    ctermfg=14       ctermbg=242             cterm=NONE
    hi SpellBad      ctermbg=9        ctermbg=NONE            cterm=NONE
    hi SpellCap      ctermbg=12       ctermbg=NONE            cterm=NONE
    hi SpellRare     ctermbg=13       ctermbg=NONE            cterm=NONE
    hi SpellLocal    ctermbg=14       ctermbg=NONE            cterm=NONE
    hi Pmenu         ctermfg=0        ctermbg=139             cterm=NONE
    hi PmenuSel      ctermfg=0        ctermbg=11              cterm=NONE
    hi PmenuSbar     ctermfg=0        ctermbg=248             cterm=NONE
    hi PmenuThumb                                             cterm=reverse
    hi TabLine       ctermfg=251      ctermbg=239             cterm=NONE
    hi TabLineSel    ctermfg=189      ctermbg=NONE            cterm=bold
    hi TabLineFill   ctermfg=239      ctermbg=16
    hi CursorColumn                   ctermbg=16
    hi CursorLine                     ctermbg=234 cterm=NONE
    hi MatchParen    ctermfg=231      ctermbg=139
    hi Comment       ctermfg=144      ctermbg=NONE
    hi Constant      ctermfg=180      ctermbg=NONE
    hi Special       ctermfg=224      ctermbg=NONE
    hi Identifier    ctermfg=74       ctermbg=NONE            cterm=NONE
    hi Statement     ctermfg=103      ctermbg=NONE            cterm=NONE
    hi Repeat        ctermfg=103      ctermbg=NONE            cterm=bold
    hi Define        ctermfg=223      ctermbg=NONE            cterm=NONE
    hi PreProc       ctermfg=74       ctermbg=NONE            cterm=NONE
    hi Type          ctermfg=66       ctermbg=NONE            cterm=NONE
    hi Underlined    ctermfg=81       ctermbg=NONE            cterm=underline
    hi Conditional   ctermfg=109      ctermbg=NONE            cterm=bold
    hi Ignore        ctermfg=0
    hi Error         ctermfg=15       ctermbg=9               cterm=NONE
    hi Todo          ctermfg=11       ctermbg=90              cterm=reverse
    hi String        ctermfg=173      ctermbg=NONE            cterm=NONE
    hi Number        ctermfg=182      ctermbg=NONE            cterm=NONE
    hi Function      ctermfg=139      ctermbg=NONE            cterm=bold
    hi Cursor        ctermfg=16       ctermbg=231             cterm=NONE
    hi Operator      ctermfg=111      ctermbg=NONE            cterm=NONE
    hi cInclude     ctermfg=60   ctermbg=NONE
    hi cPreProc     ctermfg=70   cterm=underline
    hi cPreCondit   ctermfg=114  ctermbg=NONE       cterm=NONE
    " hi cBlock       ctermfg=11   ctermbg=NONE       cterm=NONE
    hi cBracket     ctermfg=146   ctermbg=NONE       cterm=NONE
    hi cNumbers     ctermfg=10   ctermbg=NONE       cterm=NONE
    hi cParen       ctermfg=29   ctermbg=NONE       cterm=NONE
    hi cUserCont    ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cNumbersCom  ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cMulti       ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cCppParen    ctermfg=214  ctermbg=NONE       cterm=NONE
    hi cCppBracket  ctermfg=214  ctermbg=NONE       cterm=NONE
    hi TagListTitle     ctermfg=37                 cterm=NONE
    hi TagListTagName   ctermfg=16   ctermbg=153   cterm=bold
    hi TagListFileName  ctermfg=116  ctermbg=NONE  cterm=underline
    hi TagListComment   ctermfg=1    ctermbg=NONE  cterm=NONE

endif

hi link cComment      Comment
hi link cCommentStart Comment
hi link cConstant     Constant
hi link cConditional  Conditional
hi link cDefine Define
hi link cPreCondit cPreProc
hi link cPreProc PreProc

hi link luaFunction   Function
hi link luaCond       Conditional
hi link luaNumber     Constant
hi link luaString2    String
"
hi link pythonEscape Constant
hi link pythonRawEscape	Constant

hi link SpecialComment Comment
hi link Character  Constant
hi link SpecialChar Constant
hi link Number    Constant
hi link Float    Number
hi link Keyword    Statement
hi link Exception  Statement
hi link StorageClass  Type
hi link Structure  Type
hi link Delimiter  Special
hi link luaTableBlock Type
hi link Debug    Special
hi link CursorIM Cursor
hi link VertSplit StatusLineNC

hi link diffRemoved DiffDelete
hi link diffOldFile DiffDelete
hi link diffNewFile DiffAdd
hi link diffChanged DiffChange
hi link diffSubname Function
hi link diffLine Underlined

"experimetnal
hi link DefinedName cBracket
