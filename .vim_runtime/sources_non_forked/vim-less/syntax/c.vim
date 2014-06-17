
"highlight Functions
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions guifg=#7fd02e cterm=bold ctermfg=yellow
syn match cClass "\<[a-zA-Z_][a-zA-Z_0-9]*\>::"me=e-2
hi cClass guifg=#7fd02e cterm=bold ctermfg=yellow

"hi String              term=bold cterm=bold ctermfg=1
"hi Character         term=bold cterm=bold ctermfg=1
"hi Number            term=bold cterm=bold ctermfg=1
"hi Boolean           term=bold cterm=bold ctermfg=1
"hi Float             term=bold cterm=bold ctermfg=1

"======================================================== 
" Highlight All Function 
" "======================================================== 
syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>[^()]*)("me=e-2 
syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>/s*("me=e-1 
hi cFunction gui=NONE guifg=#B5A1FF 

"======================================================== 
" Highlight All Math Operator 
"======================================================== 
" C math operators 
syn match cMathOperator display "[-+/*/%=]" 

" C pointer operators 
syn match cPointerOperator display "->/|/." 

" C logical operators - boolean results 
syn match cLogicalOperator display "[!<>]=/=" 
syn match cLogicalOperator display "==" 

" C bit operators 
syn match cBinaryOperator display "/(&/||/|/^/|<</|>>/)=/=" 
"syn match cBinaryOperator display "/~" 
"syn match cBinaryOperatorError display "/~=" 

" More C logical operators - highlight in preference to binary 
syn match cLogicalOperator display "&&/|||" 
syn match cLogicalOperatorError display "/(&&/|||/)=" 

" Math Operator 
hi cMathOperator guifg=#3EFFE2 
hi cPointerOperator guifg=#FF0000  "#3EFFE2 
hi cLogicalOperator guifg=#3EFFE2 
hi cBinaryOperator guifg=#3EFFE2 
hi cBinaryOperatorError guifg=#3EFFE2 
hi cLogicalOperator guifg=#3EFFE2 
hi cLogicalOperatorError guifg=#3EFFE2
