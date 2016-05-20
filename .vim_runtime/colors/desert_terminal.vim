" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desert_terminal"

highlight Normal guifg=white guibg=grey20 ctermfg=231 ctermbg=236

" highlight groups
highlight Cursor guifg=slategrey guibg=khaki ctermfg=67 ctermbg=186
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
highlight VertSplit guifg=grey50 guibg=#c2bfa5 gui=NONE ctermfg=244 ctermbg=144 cterm=NONE
highlight Folded guifg=gold guibg=grey30 ctermfg=220 ctermbg=239
highlight FoldColumn guifg=tan guibg=grey30 ctermfg=180 ctermbg=239
highlight IncSearch guifg=slategrey guibg=khaki ctermfg=67 ctermbg=186
"hi LineNr
highlight ModeMsg guifg=goldenrod ctermfg=178
highlight MoreMsg guifg=seagreen ctermfg=29
highlight NonText guifg=lightblue guibg=grey30 ctermfg=152 ctermbg=239
highlight Question guifg=springgreen ctermfg=48
highlight Search guifg=wheat guibg=peru ctermfg=223 ctermbg=172
highlight SpecialKey guifg=yellowgreen ctermfg=112
highlight StatusLine guifg=black guibg=#c2bfa5 gui=NONE ctermfg=16 ctermbg=144 cterm=NONE
highlight StatusLineNC guifg=grey50 guibg=#c2bfa5 gui=NONE ctermfg=244 ctermbg=144 cterm=NONE
highlight Title guifg=indianred ctermfg=167
highlight Visual guifg=khaki guibg=olivedrab gui=NONE ctermfg=186 ctermbg=64 cterm=NONE
"hi VisualNOS
highlight WarningMsg guifg=salmon ctermfg=210
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
highlight Comment guifg=skyblue ctermfg=117
highlight Constant guifg=#ffa0a0 ctermfg=217
highlight Identifier guifg=palegreen ctermfg=120
highlight Statement guifg=khaki ctermfg=186
highlight PreProc guifg=indianred ctermfg=167
highlight Type guifg=darkkhaki ctermfg=143
highlight Special guifg=navajowhite ctermfg=223
"hi Underlined
highlight Ignore guifg=grey40 ctermfg=241
"hi Error
highlight Todo guifg=orangered guibg=yellow2 ctermfg=202 ctermbg=226


"vim: sw=4
