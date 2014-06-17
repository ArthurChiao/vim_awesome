if exists("*CSyntaxAfter")
	call CSyntaxAfter()
endif

syntax match _Operator display "[\[\]]"
hi link _Operator Operator

syntax match Statement "@property\|@synthesize"
syntax keyword Statement NO YES
