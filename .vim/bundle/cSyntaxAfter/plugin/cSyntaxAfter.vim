" File: cSyntaxAfter.vim
" Author: Sergey Vlasov <sergey@vlasov.me>
" Last Change:  2012-04-02
" Version:      0.2
""
" This plugin was initially created for codeblock_dark color theme to
" highlight operators (+ - / * = <> () and others) in C-like languages.
" Why it's needed? Well, by default vim doesn't do that. After switching
" from Code::Block to vim I got really missed it.
"
" Then the plugin grew into something bigger. I started to use it to unify
" overal syntax highlighting for C-like languages.
"
" To enable the plugin it put this into your .vimrc:
"
"    autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,h,javascript} call CSyntaxAfter()
"
" It's possible to extend the plugin tu support other C-like languages (Java, Go etc).
" For example for Object-C first check you don't have "objc" in autocmd from above.
" Then create new objc.vim file in <cSyntaxAfter_path>/after/syntax/ and add:
"
"    if exists("*CSyntaxAfter")
"       call CSyntaxAfter()
"    endif
"
" Then add new rules to syntax highligting, for example to highlight [ ] brackets
" as operator and not constant add:
"
"    syntax match _Operator display "[\[\]]"
"    hi link _Operator Operator
"

function! CSyntaxAfter()
	syntax keyword Boolean true false NULL TRUE FALSE
	syntax keyword Statement namespace stderr stdin stdout new this delete

	syntax match _Block "[{}]"
	syntax match _Bracket "[\[\]]"
	syntax match _Operator display "<\(#\)\@!"
	syntax match _Operator display "\(#\)\@<!>"
	syntax match _Operator display "[-+&|=!\/~.,;:*%&^?()]"
	syntax region _Comment start="\/\*" end="\*\/"
	syntax match _Comment "\/\/.*$"

	"hi _Block guifg=yellow1 guibg=NONE gui=none
	hi link _Block Operator
	hi link _Bracket Constant
	hi link _Operator Operator
	hi link _Comment Comment
endfunction

