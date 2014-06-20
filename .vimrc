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

"set column width to be 80-character
set lines=40 columns=80
set textwidth=78
set formatoptions+=Mm
set colorcolumn=80
