built-in commands
=====================

# save changes with root priviledge

This command is useful when you change a file and are saving it, but are
warned that you have no priviledge to modify it.
```shell
:w !sudo tee %
```

# code folding (代码折叠）

```shell
# set folding by indent:
:setlocal foldmethod=indent

# unfold current block
za (one more 'za' will fold it again)

# unfold all
zi
```
