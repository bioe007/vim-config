" vim colorscheme for 256 colors, template from gglucas (oblivion, whoever the
" original author idk) modified by
" bioe007  (aka resixiandotgmaildotcom)
"
hi clear

if version > 580
    hi clear

    if exists("syntax_on")
        syntax reset
    endif
endif

set background=dark
let g:colors_name="abeyance"

hi SpecialKey    ctermfg=244  ctermbg=NONE
hi NonText       ctermfg=239 ctermbg=16
hi Directory     ctermfg=74 ctermbg=NONE
hi ErrorMsg      ctermfg=15 ctermbg=1
hi IncSearch     cterm=reverse ctermfg=202 ctermbg=231
hi Search        ctermfg=231 ctermbg=139
hi MoreMsg       ctermfg=221 ctermbg=NONE
hi ModeMsg       cterm=bold ctermfg=221
hi LineNr        ctermfg=239 ctermbg=16
hi Question      ctermfg=121 ctermbg=NONE

hi StatusLine    ctermfg=17 ctermbg=67 cterm=bold
hi StatusLineNC  ctermfg=black ctermbg=gray cterm=NONE

hi VertSplit     cterm=NONE ctermfg=240 ctermbg=240

hi Title         ctermfg=202 ctermbg=NONE
hi Visual        ctermfg=231 ctermbg=59
hi VisualNOS     cterm=bold,underline
hi WarningMsg    ctermfg=202
hi WildMenu      ctermfg=0 ctermbg=11
hi Folded        ctermfg=146 ctermbg=NONE
hi FoldColumn    ctermfg=16 ctermbg=239
hi DiffAdd       cterm=bold ctermfg=231 ctermbg=18
hi DiffChange    cterm=bold ctermfg=231 ctermbg=64
hi DiffDelete    cterm=bold ctermfg=231 ctermbg=53
hi DiffText      cterm=bold ctermfg=231 ctermbg=64
hi SignColumn    ctermfg=14 ctermbg=242
hi SpellBad      ctermbg=9 ctermbg=NONE
hi SpellCap      ctermbg=12 ctermbg=NONE
hi SpellRare     ctermbg=13 ctermbg=NONE
hi SpellLocal    ctermbg=14 ctermbg=NONE
hi Pmenu         ctermfg=0 ctermbg=139
hi PmenuSel      ctermfg=0 ctermbg=11
hi PmenuSbar     ctermfg=0 ctermbg=248
hi PmenuThumb    cterm=reverse

hi TabLine       cterm=underline ctermfg=247 ctermbg=16
hi TabLineSel    cterm=bold ctermfg=231
hi TabLineFill   ctermfg=239 ctermbg=16

hi CursorColumn  ctermbg=16
hi CursorLine    cterm=underline ctermbg=16
hi MatchParen    ctermfg=231 ctermbg=139
hi Comment       ctermfg=250 ctermbg=NONE
hi Constant      ctermfg=166 ctermbg=NONE
hi Special       ctermfg=224 ctermbg=NONE
hi Identifier    cterm=NONE ctermfg=74 ctermbg=NONE
hi Statement     cterm=NONE ctermfg=103 ctermbg=NONE
hi Define        ctermfg=223              cterm=underline
hi PreProc       cterm=underline ctermfg=74
hi Type          ctermfg=66 ctermbg=NONE cterm=NONE
hi Underlined    cterm=underline ctermfg=81
hi Conditional   ctermfg=109 ctermbg=NONE cterm=bold
hi Ignore        ctermfg=0
hi Error         ctermfg=15 ctermbg=9
hi Todo          ctermfg=0 ctermbg=11
hi String        ctermfg=173 ctermbg=NONE
hi Number        ctermfg=214 ctermbg=NONE
hi Function      ctermfg=139 ctermbg=NONE cterm=bold
" hi Normal        ctermfg=250 ctermbg=0 cterm=NONE
hi Normal        ctermfg=144 ctermbg=0 cterm=NONE
hi Cursor        ctermfg=16 ctermbg=231

hi cInclude       ctermfg=60
"hi cDefine       ctermfg=223              cterm=bold
hi cPreProc       cterm=underline ctermfg=70 
hi cPreCondit     ctermfg=114 
hi cBlock         ctermfg=11
hi cBracket	      ctermfg=11
hi cNumbers	      ctermfg=10
hi cParen	        ctermfg=21
hi cUserCont      ctermfg=214
hi cNumbersCom	  ctermfg=214
hi cMulti	        ctermfg=214
" hi cConstant	    ctermfg=214
hi link cConstant Constant	    
hi cCppParen      ctermfg=214
hi cCppBracket    ctermfg=214
hi link cCommentStart  Comment
hi link cComment Comment
" hi cConditional  ctermfg=193
hi link cConditional Conditional

hi link luaFunction Function  
hi link luaCond cConditional  
hi link luaNumber cConstant
hi link luaString2 String


hi TagListTitle   ctermfg=37              cterm=bold
hi TagListTagName ctermfg=16 ctermbg=153  cterm=bold
hi TagListFileName ctermfg=116  ctermbg=NONE cterm=underline
hi TagListComment  ctermfg=1
