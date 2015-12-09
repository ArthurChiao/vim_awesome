built-in commands
=====================

## save changes with root priviledge

This command is useful when you change a file and are saving it, but are
warned that you have no priviledge to modify it.
```shell
:w !sudo tee %
```

## code folding (代码折叠）

```shell
# set folding by indent:
:setlocal foldmethod=indent

# unfold current block
za (one more 'za' will fold it again)

# unfold all
zi
```

## search/find
1. search in text

  search all the occurrances of workd `session`, the effects is similar as
  linux command `grep`:

  ```shell
  :vimgrep session * # search in all files
  :vimgrep session **/*.c # search in all .c files

  :copen # open the window that lists all the search results
  ```
