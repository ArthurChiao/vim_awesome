vim_awesome
===========

my vim configuration, based on amix's project (https://github.com/amix/vimrc).

# install
```shell
# clone configuration files
git clone https://github.com/ArthurChiao/vim_awesome.git

# move files to home directory
cd vim_awesome
mv .vimrc ~/.
mv .vim ~/.
mv .vim_runtime ~/.

# install
cd ~/.vim_runtime
sh install_vim_awesome.sh
```

# Problem Fixups
If you encountered `neocomplete` problems at vim startup, it may be that 
your vim version is under 7.4, or it is not `lua` enabled (test it with 
`:echo has("lua")`.

To fix this problem, please see the solutions provided in
https://github.com/Shougo/neocomplete.vim.git

If none of the solutions in the above link fits your case, just remove the 
`neocomplete` plugin:
```shell
rm .vim_runtime/sources_forked/neocomplete.vim -rf
```
restart the vim.
