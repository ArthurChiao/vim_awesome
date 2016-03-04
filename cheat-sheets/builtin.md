built-in commands
=====================

<a id='top'>**contents:**</a>

1. [Save/Quit](#save_quit)
1. [Code Folding](#code_folding)
1. [Insert/Add](#Insert_Add)
1. [Substitute/Replace](#Substitute_Replace)
1. [Search/Find](#Search_Find)
1. [Cursor movement](#Cursor_movement)
1. [Delete](#Delete)
1. [Copy/Paste](#Copy_Paste)
1. [Undo/Redo](#Undo_Redo)
1. [Vim Buffer](#buffer)
1. [Vim Session](#session)
1. [Character Related](#char_related)
1. [Misc](#misc)


<a id="save_quit"></a>
##[[↑]](#top) save, quit/close files

| Command  |  Function |
| :-------- |  :--------- |
| :w   | save |
| :w!   | force to save |
| :w <filename> | save as another file |
| :r <filename> | read text from file, append content after cursor |
| :q   | quit |
| :q!   | force to quit |
| :qa   | quit all windows/tabs/panels |
| :wqa   | save and quit all files |
| ZZ | save then quit current file |

This command is useful when you change a file and are saving it, but are
warned that you have no priviledge to modify it.
```shell
:w !sudo tee %

# the alias in current configuration is W
:W        # same as `:w !sudo tee %`
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
| C    | change remaining of current line (same as `Da`) |
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
| dk  | delete **current and last** line|
| dj  | delete the **current and next** line |
| ddp  | exchange current and next line |
| dgg   | delete all lines before current line, including current line |
| kdgg   | delete all lines before current line |
| dG  | delete all lines after current line, including current line |
| jdG  | delete all lines after current line |
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


<a id="buffer"></a>
##[[↑]](#top) Vim Buffer

`:ls` - list all the files in vim buffer, one file each buffer. This is
especially usuful in that you can see the files edited in other process by
vim, e.g, you edited `1.txt` in bash1, save and quit. Then in bash2, you
opened a new file `2.txt` with vim. By executing `:ls` in the vim, you could
see `1.txt` in the buffer, and you could edit it in this bash now.

| Command | Function |
| :------ | :-------- |
| :ls                      |  list all the files in vim buffer |
| :buffer `id/filename` |  show the specified buffer/file   |


<a id=id="explore_window"></a>
##[[↑]](#top) Explore Window

| Command | Function |
| :------ | :-------- |
| :He   |  split window Horizontally, show directory at Below window |
| :He!  |  split window Horizontally, show directory at Upper window |
| :Ve   |  split window Vertically, show directory at Right window |
| ctl+w h/j/k/l | move between windows, in left/down/up/righ direction |
| `:set scb` or `:set scrollbind` | set scroll bind, type this command in two
windows, then they will scroll synchronously |
| `:set scb!` or `:set scrollbind!` | unset scroll bind |
| vim -p file1 file 2 | open multiple files, with tabs |


<a id=id="session"></a>
##[[↑]](#top) Vim Session

* `:makesession ~/.mysession.vim` - save current vim session (all status)
* `:makesession! ~/.mysession.vim` - force to save
* `vim -S ~/.mysession.vim` - open saved session, which contains the status the
last time vim exited

<a id="quickfix"></a>
##[[↑]](#top) Quickfix

Vim has a special mode to speedup the edit-compile-edit cycle.  This is
inspired by the quickfix option of the Manx's Aztec C compiler on the Amiga.
The idea is to **save the error messages from the compiler in a file and use Vim
to jump to the errors one by one**.  You can examine each problem and fix it,
without having to remember all the error messages.

In Vim the quickfix commands are used more generally to find a list of
positions in files.  For example, |:vimgrep| finds pattern matches.  You can
use the positions in a script with the |getqflist()| function.  Thus you can
do a lot more than the edit/compile/fix cycle!

```shell
# e.g. we are editing and compiling test.cc
:make # compiling test.cc by executing makefile
:cw or :cwindow # open a subwindow in vim, list all the compiling errors in it
                # you can now see the errors and the source code simultaneously
# some commands
:cp - go to previous error place
:cn - go to next error place
:cl - list all errors
:cc - list the details of the error

# another example
grep -R test_func * # search all appearances of string `test_func` from current
                    # folder recursively
:cw # vim command, load all the appearances (line number and the line) in subwindow
```

<a id="char_related"></a>
##[[↑]](#top) Character Related

| Command | Function |
| :------ | :-------- |
| (in visual mode) u | turn all seleted characters into lower case |
| (in visual mode) U | turn all seleted characters into upper case |
| ga | show the ascii value of the current character |
| g8 | show the utf-8 value of the current character |
| gf | open the file under the current cursor |

<a dir="misc"></a>
##[[↑]](#top) Misc

`:r!date` - insert current date/time into editor

`:r` stands for **read**, `!` means to execute a shell command, `date` is a
shell command.

# References
1. [vim无插件编程技巧](http://mp.weixin.qq.com/s?__biz=MjM5NzA1MTcyMA==&mid=200211176&idx=1&sn=8ef83ebad1938fd03acd424f0c18abb3&scene=2&from=timeline&isappinstalled=0#rd)
