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

## Insert/Add

basic commands:

| Command  |  Function |
| :-------- |  :--------- |
| i    | insert at current cursor  |
| I    | insert before first non-blank character of current line  |
| a    | (append) insert after current character |
| A    | (append) insert at the end of this line |
| o    | insert new line below this line |
| O    | insert new line uppper this line |

some advanced insertions, e.g, insert same context at same position of
multiple lines with help of `block selection`:

| Command  |  Function |
| :-------- |  :--------- |
| `ctl + v`  `I`   | `ctl + v` (block selection), `I` (insert before selected block)   |

## Substitute/Replace

Difference between `substitute` and `replace` is that `substitute` enters
`edit mode` from `command mode`, while `replace` stays in `command mode`.

| Command  |  Function |
| :-------- |  :--------- |
| s    | substitute current character (with one or more characters) |
| S    | substitute current line |
| r    | replace current character |
| R    | replace remaining of current line (start from cursor position) |
| R    | a |
| R    | a |
| R    | a |

## search/find
1. search in text

  search all the occurrances of workd `session`, the effects is similar as
  linux command `grep`:

  ```shell
  :vimgrep session * # search in all files
  :vimgrep session **/*.c # search in all .c files

  :copen # open the window that lists all the search results
  ```
