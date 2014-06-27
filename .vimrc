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

"set echofunc path
"call pathogen#incubate("after")
