built-in commands
=====================

<a id='top'>**contents:**</a>

1. [save changes with root priviledge](#save_changes_with_root_priviledge)
1. [code folding](#code_folding)
1. [Insert/Add](#Insert_Add)
1. [Substitute/Replace](#Substitute_Replace)
1. [Search/Find](#Search_Find)
1. [Cursor movement](#Cursor_movement)
1. [Delete](#Delete)
1. [Copy/Paste](#Copy_Paste)
1. [Undo/Redo](#Undo_Redo)
1. [some commands in Nerdtree](#some_cmd_in_NTree)


<a id="save_changes_with_root_priviledge"></a>

##[[↑]](#top) save changes with root priviledge

This command is useful when you change a file and are saving it, but are
warned that you have no priviledge to modify it.
```shell
:w !sudo tee %
```

<a id="code_folding"></a>

##[[↑]](#top) code folding (代码折叠）

```shell
# set folding by indent:
:setlocal foldmethod=indent

# unfold current block
za (one more 'za' will fold it again)

# unfold all
zi
```

<a id="Insert_Add"></a>

##[[↑]](#top) Insert/Add

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

<a id="Substitute_Replace"></a>

##[[↑]](#top) Substitute/Replace

Difference between `substitute` and `replace` is that `substitute` enters
`edit mode` from `command mode`, while `replace` stays in `command mode`.

| Command  |  Function |
| :-------- |  :--------- |
| s    | substitute current character (with one or more characters) |
| S    | substitute current line |
| r    | replace current character |
| R    | replace remaining of current line (start from cursor position) |
| :s/old/new/    | substitute 'new' for the first matching 'old'(on the current line) |
| :s/old/new/g    | substitute 'new' for the all matching 'old' (on the current line) |
| :%s/old/new/    | substitute 'new' for the first matching 'old' (all lines) |
| :%s/old/new/g    | substitute 'new' for the all matching 'old' (all lines) |
| :%s/old/new/gc     | substitute 'new' for the all matching 'old' (all lines and need confirm for each substitution) |

(:point_right: recommand `:%s/old/new/gc`)

<a id="Search_Find"></a>

##[[↑]](#top) Search/Find
1. search in text

  search all the occurrances of word `session`, the effects is similar as
  linux command `grep`:

  ```shell
  :vimgrep session * # search in all files
  :vimgrep session **/*.c # search in all .c files

  :copen # open the window that lists all the search results
  ```

<a id="Cursor_movement"></a>

##[[↑]](#top) Cursor movement

| Command  |  Function |
| :------- | :-------- |
| h   | move left |
| j   | move down |
| k   | move up |
| l   | move right |
| w :+1:   | jump by start of words(punctuation considered words) |
| W   | jump by words (spaces separate words) |
| e   | jump by end of words |
| E   | jump by end of words (spaces separate words) |
| b :+1:  | jump backward by words  |
| B   | jump backward by words (spaces separate words) |
| 0  :+1: | move to start of line |
| $   :+1:| move to end of line |
| ^   | move to the first non-blank character of line |
| gg  | move to start of file |
| G   | move to end of file |

<a id="Delete"></a>

##[[↑]](#top) Delete

| Command  |  Function |
| :------- | :-------- |
| x   | delete current character |
| X   | delete character before cursor|
| dw   | delete current word |
| dd   | delete current line |
| D   | delete from current character to end of line (= d$)|
| dk  | delete current and last row|
| dj  | delete the current and next line |
| ddp  | exchange the current and next line |
| kdgg   | delete all lines before current line |
| jdG  | delete all lines after current line |
| dgg   | delete all lines before current line, including current line |
| dG  | delete all lines after current line, including current line |
| J   | join line below to the current line |

<a id="Copy_Paste"></a>

##[[↑]](#top) Copy/Paste

| Command  |  Function |
| :------- | :-------- |
| Y   | copy current line |
| yw   | copy word | 
| y$   | copy from corsor to end of line |
| p    | paste after line |
| P   | paste before current line|
 
<a id="Undo_Redo"></a>

##[[↑]](#top) Undo/Redo

| Command | Function |
| :------ | :-------- |
| u  |  Undo |
| U  | Undo for current line |
| Ctrl + r | redo |

<a id="some_cmd_in_NTree"></a>

##[[↑]](#top) some commands in NERDTree
| Command | Function |
| :------ | :-------- |
| m  |  open the manu |
| s  | open a file in split format |
| t  | open a file in new tab |
| gt | jump between tabs |
| R  | refresh |
| CD | come back the first vim path |
| cd | change to new path |

