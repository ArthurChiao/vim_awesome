set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

let g:neocomplcache_enable_at_startup = 1


try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"show the current curse coordinate
set ruler

"show matching brackets/parenthesis
set showmatch

"open NERDTree automatically when vim starts up
"if no files were specified
autocmd VimEnter * if !argc() | NERDTree | endif

"set NERDTree to ignore certain files/directories, to show a more clean source 
"code tree
"ignore all object files *.o
"ignore all dependency files *.d
let NERDTreeIgnore=['\.o$[[file]]', '\.d$[[file]]']

"set column width to be 80-character
set lines=40 columns=80
set textwidth=78
set formatoptions+=Mm
set colorcolumn=80

" support chinese characters
set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,bgk,gb231,cp926
set fileencoding=utf-8
set encoding=utf-8
set termencoding=gbk

if has("win32")
set gfn=Monaco:h10:cANSI
set gfw=NSimsun:h12

" fix GVIM "ctags not error" on windows
let Tlist_Ctags_Cmd='c:\vim\vim74\ctags.exe'

" change GUI font and size
set guifont=Courier_New:h10:cANSI
endif
