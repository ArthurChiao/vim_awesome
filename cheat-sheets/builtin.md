built-in commands
=====================

<a id='top'>**contents:**</a>

1. [Save/Quit](#save_quit)
1. [Code Folding](#code_folding)
1. [Insert/Add](#insert_add)
1. [Substitute/Replace](#substitute_replace)
1. [Search/Find](#search_find)
1. [Cursor Moving](#cursor_moving)
1. [Screen Scrool](#screen_scroll)
1. [Delete](#delete)
1. [Copy/Paste](#copy_paste)
1. [Undo/Redo](#Undo_Redo)
1. [Vim Buffer](#buffer)
1. [Vim Session](#session)
1. [Vim Diff](#vimdiff)
1. [Split Window](#split_window)
1. [Character Related](#char_related)
1. [Misc](#misc)


<a id="save_quit"></a>
##[[↑]](#top) Open, Save, Quit/Close files

1. Basic

 | Command  |  Action |
 | :-------- |  :--------- |
 | vim -R `<file>` | open file in READ ONLY mode |
 | vim -p `<file1> <file2>` | open multiple files, in differrent tabs |
 | :w   | save |
 | :w!   | force to save |
 | :q   | quit |
 | :q!   | force to quit, discard any unsaved changes |
 | :qa   | quit all windows/tabs/panels |
 | :wqa   | save and quit all files |

 This command is useful when you changed a file and are saving it, but are
 warned that you have no priviledge to modify it. It saves the changes with
 root previleages:
 ```shell
 :w !sudo tee %

 # the alias in current configuration is W
 :W        # same as `:w !sudo tee %`
 ```

1. Advanced

 | Command  |  Action |
 | :-------- |  :--------- |
 | `:w <filename>` | save as another file |
 | `:r <filename>` | read text from file, append content after cursor |
 | ZZ | save and quit current file |
 | :e | reload current file from disk, short for `:edit` |
 | :e! | reload current file from disk, discard current changes |

<a id="code_folding"></a>

##[[↑]](#top) Code Folding

1. Basic

  ```shell
  # set folding by indent:
  :setlocal foldmethod=indent
  ```

  | Command | Action |
  | :-------- |  :--------- |
  | `zf` | create folding on visual selected block |
  | `za` | toggle to unfold/fold current folding |
  | `zc` | close a fold at the cursor |
  | `zR` | open all folds in file |
  | `zM` | closes all open folds in file |

  This is a folding command list picked up
  from [stackoverflow](http://stackoverflow.com/questions/23579058/vim-python-mode-folding):

  | Command | Action |
  | :-------- |  :--------- |
  | zf`<num>`j | creates a fold from the cursor down `num` lines, e.g. `zf3j` |
  | zf/string | creates a fold from the cursor to string  |
  | `zj` | moves the cursor to the next fold |
  | `zk` | moves the cursor to the previous fold |
  | zo | opens a fold at the cursor |
  | zO | opens all folds at the cursor |
  | `zd` | deletes the fold at the cursor |
  | `zE` | deletes all folds |
  | [z | move to start of open fold |
  | ]z | move to end of open fold |

  by the way, I also found that `h` or `l` will unfold the code when cursor
  is at one folding, so my frequently used keys are

  * `h` or `l` or `za`: unfold current folding
  * `zc` or `za`: fold/re-fold
  * `zR` and `zM`: open/close all folds in current file

  If you'd like to create new fold manually, first set `foldmethod` to `manual`:
  ```shell
  # set foldmethod to manul in vim
  :set foldmethod=manual

  # select text/code and create fold with `zf`
  zf
  ```
  otherwise, you will get error like this:

  > E350: Cannot create fold with current 'foldmethod'

1. Advanced

  | Command | Action |
  | :-------- |  :--------- |
  | zm | increases the foldlevel by one |
  | zr | decreases the foldlevel by one |
  | z+ | page down |
  | z. | redraw window, put current line in the middle of the screen |

<a id="insert_add"></a>

##[[↑]](#top) Insert/Add

1. Basic

  | Command  |  Action |
  | :-------- |  :--------- |
  | i    | insert at current cursor  |
  | I    | insert before first non-blank character of current line  |
  | a    | (append) insert after current character |
  | A    | (append) insert at the end of this line |
  | o    | insert new line below this line |
  | O    | insert new line uppper this line |
  | `ctl-c` | exit insert mode, same affect as stroking `ESC` |

1. Advanced

  Some advanced insertions, e.g, insert same context at same position of
  multiple lines with help of `block selection`:

  | Command  |  Action |
  | :-------- |  :--------- |
  | `ctl + v`  `I`   | `ctl + v` (block selection), `I` (insert before selected block)   |
  | :read `<file>` | read the specified file, insert content into current file |
  | `:$read <file>` | append file to the end of current file |
  | `:0read <file>` | pre-append file to the beginning of current file |
  | `:<N1>,<N2>write` <file> | write text between line `<N1>` and `<N2>` to file, e.g. `:10,200w a.txt` |
  | `:.,$write <file>` | write text from current line to the end to file |
  | `:.write <file>` | write text of current line to file, e.g. `:.w a.txt` |
  | `:.write >> <file>` | append text of current line to file, e.g. `:.w >> a.txt` |
  | `:.,$write! <file>` | force to write it |

1. Read/Write Advanced

  | Command  |  Action |
  | :-------- |  :--------- |
  | `:read !<shell_command>` | execute shell command `<shell_command>>`, paste the result after cursor, e.g `:r !ls -ahl`, `:r !tree` |
  | `:0read !<shell_command>` | insert context before beginning of current file |


<a id="substitute_replace"></a>
##[[↑]](#top) Substitute/Replace

1. Basic

  Difference between `substitute` and `replace` is that `substitute` enters
  `edit mode` from `command mode`, while `replace` stays in `command mode`.

  | Command  |  Action |
  | :-------- |  :--------- |
  | s    | substitute current character (with one or more characters) |
  | S    | substitute current line |
  | r    | replace current character |
  | R    | replace remaining of current line (start from cursor position) |
  | C    | change remaining of current line (same as `Da`) |
  | `i ctl-u` | change contents before cursor of current line |
  | :s/old/new/    | substitute 'new' for the first matching 'old'(in current line) |
  | :s/old/new/g    | substitute 'new' for the all matching 'old' (in current line) |
  | :%s/old/new/    | substitute 'new' for the first matching 'old' (in current file) |
  | :%s/old/new/g    | substitute 'new' for the all matching 'old' (in current file) |
  | :%s/old/new/gc     | substitute 'new' for the all matching 'old' (in current file, and need confirmation for each substitution) |

  (:point_right: recommand `:%s/old/new/gc`)

1. Advanced

  Following one-strike commands are same effects with their two-strike counterparts:

  | Command   | Same As Command  | Action |
  | :-------- | :--------------- | :--------- |
  | x | dl | delete one char (forward) |
  | X | dh | delete one char (backward) |
  | D | d$ | delete remaing of current line |
  | C | c$ | change remaining of current line |
  | s | cl | substitute/change one char |
  | S | cc | substitute entire line |

<a id="search_find"></a>

##[[↑]](#top) Search/Find
1. Special Characters

  | Command  |  Action |
  | :-------- |  :--------- |
  | `:/the`  | search strings containing `the` in current file |
  | `:/the\>`  | search strings end with `the` in current file |
  | `:/\<the`  | search strings start with `the` in current file |

1. search in text

  search all the occurrances of word `session`, the effect is similar as
  linux command `grep`:

  ```shell
  :vimgrep session **/*   # search in all files
  :vimgrep session **/*.c # search in all .c files

  :copen # open the window that lists all the search results
  ```

<a id="cursor_moving"></a>

##[[↑]](#top) Cursor Moving

1. Basic

  | Command  |  Action |
  | :------- | :-------- |
  | h   | move left |
  | j   | move down |
  | k   | move up |
  | l   | move right |
  | gg  | move to start of file |
  | G   | move to end of file |
  | w :+1:   | move forward one `word` (punctuation considered words) |
  | W   | move forward one `WORD` (spaces separated words) |
  | b :+1:  | move backward one word  |
  | B   | move backward one WORD (spaces separated words) |
  | e   | move to end of `word` |
  | E   | move to end of `WORD` (spaces separated words) |
  | `<N>%` | jump to the N% part of current file, eg. `20%` |

1. Advanced

  | Command  |  Action |
  | :------- | :-------- |
  | 0  :+1: | move to column zero (precisely, start of line) |
  | `|`  :+1: | move to column zero |
  | `-` | move to first non-whitespace of previous line |
  | `+` | move to first non-whitespace of next line |
  | $   :+1:| move to end of line |
  | ^   | move to the first non-blank character of line |
  | H   | HOME cursor, goto first line on screen |
  | L   | goto LAST line on screen |
  | M   | goto MIDDLE line on screen |

  Moving/jumping by sentences, paragraphs,

  | Command  |  Action |
  | :------- | :-------- |
  | `(` :+1:  | move to previous sentence |
  | `)` :+1:  | move to next sentence |
  | `[` | move to previous "{...}" section |
  | `]` | move to next "{...}" section |
  | `{` | move to previous blank-line separated section |
  | `}` | move to next blank-line separated section |


  see [this list for a full vi builtin key bindings](http://hea-www.harvard.edu/~fine/Tech/vi.html).

  **Highly recommended!**

1. **Powerful but seldomly knowns**

  `f/F` `t/T` jumps to the specified character in current line, in
  forward/backward direction.

  `;` and `,` repeat the last jumping, each in
  forward and backward directions.

  | Command  |  Action |
  | :------- | :-------- |
  | `f<CHAR>`  | find `CHAR` after cursor in current line, e.g. `fa`: jump to first `a` in current line, `3fa` jumps to the 3rd `a` |
  | `F<CHAR>`  | find `CHAR` before cursor in current line |
  | ; | repeat last `f`, `F`, `t`, `T` command, e.g, `fa;;` is equal to `3fa`, `fa;,` is equal to `2fa` |
  | `t<CHAR>`  | similar with `f<CHAR>` but the cursor will be located before `CHAR` |
  | `T<CHAR>`  | search backward |
  | g; | go the last changed/edited position |

  Combining with other operations, e.g.

  * `df"`: **deleting util next `"` char**
  * `cfl`: **changing/subtituting content util next `l` char**

  Amazing! A whole new world emerges!

<a id="screen_scroll"></a>
##[[↑]](#top) Screen Scroll

1. Basic

  | Command  |  Action |
  | :------- | :-------- |
  | `ctl-u` | half page up |
  | `ctl-d` | half page down |

1. Advanced (**Cool!**)

  | Command  |  Action |
  | :------- | :-------- |
  | `ctl-e` | one line up (Extra), same effect as `ctl-l` + `j` |
  | `ctl-y` | one line down , same effect as `ctl-h` + `k`|

  `ctl-e` and `ctl-y` move the screen content one line up/down, while
  keeping the cursor still in its position.

<a id="delete"></a>
##[[↑]](#top) Delete

1. Basic

  | Command  |  Action |
  | :------- | :-------- |
  | x   | delete current character |
  | X   | delete character before cursor|
  | dw   | delete current word |
  | dd   | delete current line |
  | D   | delete from current character to end of line (= d$)|
  | dk  | delete **current and above** line|
  | dj  | delete the **current and next** line |
  | ddp  | exchange current and next line (`dd` + `p`) |
  | dgg   | delete all lines before current line, including current line |
  | dG  | delete all lines after current line, including current line |
  | J   | join line below to the current line |

1. Advanced

  | Command  |  Action |
  | :------- | :-------- |
  | daw | **delete a (the) word** under cursor, while `dw`/`db` only delete the right/left part of the word if cursor is at internal of a word |
  | diw | same as `daw`, but white spaces will not be deleted |

  If change `d` to `c`, the effect will be changing the word:

  | caw | **change a (the) word** under cursor |
  | ciw | same as `caw`, but white spaces will be skipped |


<a id="copy_paste"></a>

##[[↑]](#top) Copy/Paste

1. Basic

  `c` has been occupied in vim which stands for **Change**, so copy in vim
  is denoted as `y`, short for **Yanking**.

  | Command  |  Action |
  | :------- | :-------- |
  | `yy` or `Y`   | copy current line |
  | yw   | copy word, include white spaces after word |
  | ye   | copy word, do not including white spaces |
  | y$   | copy from corsor to end of line |
  | p    | paste after line/cursor |
  | P   | paste before current line/cursor |

  For pasting, if you are pasting lines, `p` and `P` will paste them before or
  after the current **line**; if you are pasting part of line (e.g. selected
  with `v` and copied with `y`), then the content will be pasted before or
  after the current **cursor**.

<a id="Undo_Redo"></a>

##[[↑]](#top) Undo/Redo

1. Basic

  | Command | Action |
  | :------ | :-------- |
  | u  |  Undo |
  | U  | Undo for current line |
  | Ctl + r | redo |


<a id="buffer"></a>
##[[↑]](#top) Vim Buffer

  `:ls` - list all the files in vim buffer, one file each buffer. This is
  especially usuful in that you can see the files edited in other process by
  vim, e.g, you edited `1.txt` in bash1, save and quit. Then in bash2, you
  opened a new file `2.txt` with vim. By executing `:ls` in the vim, you could
  see `1.txt` in the buffer, and you could edit it in this bash now.

1. Basic

  | Command | Action |
  | :------ | :-------- |
  | :ls                      |  list all the files in vim buffer |
  | :buffer `id/filename` |  show the specified buffer/file   |


<a id=id="explore_window"></a>
##[[↑]](#top) Explore Window

1. Advanced

  | Command | Action |
  | :------ | :-------- |
  | :Hexplore   |  split window Horizontally, show directory at Below window |
  | :Hexplore!  |  split window Horizontally, show directory at Upper window |
  | :Vexplore   |  split window Vertically, show directory at Right window |
  | ctl+w h/j/k/l | move between windows, in left/down/up/righ direction |
  | `:set scb` or `:set scrollbind` | set scroll bind, type this command in two windows, then they will scroll synchronously |
  | `:set scb!` or `:set scrollbind!` | unset scroll bind |
  | vim -p file1 file2 | open multiple files, with tabs |


<a id="session"></a>
##[[↑]](#top) Vim Session

  * `:mksession ~/.mysession.vim` - save current vim session (all status)
  * `:mksession! ~/.mysession.vim` - force to save
  * `vim -S ~/.mysession.vim` - open saved session, which contains the status the last time vim exited

<a id="quickfix"></a>
##[[↑]](#top) Quickfix

1. Basic

  Vim has a special mode to speedup the edit-compile-edit cycle.  This is
  inspired by the quickfix option of the Manx's Aztec C compiler on the Amiga.
  The idea is to **save the error messages from the compiler in a file and use Vim
  to jump to the errors one by one**.  You can examine each problem and fix it,
  without having to remember all the error messages.

  In Vim the quickfix commands are used more generally to find a list of
  positions in files.  For example, `:vimgrep` finds pattern matches.  You can
  use the positions in a script with the `getqflist()` function.  Thus you can
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
<a id="vimdiff"></a>
##[[↑]](#top) Vim Diff

1. Basic

  Show difference of `<file`> and `<file2>`, in 2 vertical split windows:

  ```
  $ vimdiff <file1> <file2>
  ```

1. Advanced

  Open a new file in horizontally/vertically window, diff with current file:
  ```
  $ vim <file1>

  :diffsplit <file2>          # compare file2 with file1, in horizontally split window
  :vertical diffsplit <file2> # compare file2 with file1, in vertically split window
  ```

  Update diff window (e.g. after changing the content of one file):

  ```
  :diffupdate
  ```

<a id="split_window"></a>
##[[↑]](#top) Split Window

1. Basic

  | Command | Action |
  | :------ | :-------- |
  | `:sp` or `:split` | split a new window, horizontally |
  | `:vsp` or `:vsplit` | split a new window, vertically |
  | `:only` | close all other windows |

  Switch between windows:

  | Command | Action |
  | :------ | :-------- |
  | `ctl-w h` | jump to the left window |
  | `ctl-w l` | jump to the right window |
  | `ctl-w k` | jump to the up window |
  | `ctl-w j` | jump to the bottom window |
  | `ctl-w t` | jump to the **up most** window |
  | `ctl-w b` | jump to the **bottom most** window |

1. Advanced

  A number could be prefixed before split command to specify the new window
  height/width:

  | Command | Action |
  | :------ | :-------- |
  | `:30sp` or `:30split` | split a new window, horizontally, 30 lines in height |
  | `:30vsp` or `:30vsplit` | split a new window, vertically, 30 lines in width |

  Change window height:

  | Command | Action |
  | :------ | :-------- |
  | `ctl-w +` | increase windows height |
  | `ctl-w -` | decrease windows height |
  | `ctl-w _` | increase windows height to maximum |
  | `<N> ctl-w +` | increase windows height by `<N>` lines |
  | `<N>ctl-w _` | increase windows height to `<N>` lines |

1. More Advanced

  | Command | Action |
  | :------ | :-------- |
  | `ctl-w H` | move current window to the left most window, full height |
  | `ctl-w L` | move current window to the right most window, full height |
  | `ctl-w K` | move current window to the up most window, full width |
  | `ctl-w J` | move current window to the bottom most window, full width |

1. Tab Basic

  | Command | Action |
  | :------ | :-------- |
  | `:tabnew <file>` | open file in new tab |
  | `gt` | go to next tab |
  | `gT` | go to previous tab |
  | `:tabonly` | close all other tabs |

<a id="char_related"></a>
##[[↑]](#top) Character Related

1. Basic

  | Command | Action |
  | :------ | :-------- |
  | (in visual mode) u | turn all seleted characters into lower case |
  | (in visual mode) U | turn all seleted characters into upper case |
  | ga | show the ascii value of the current character |
  | g8 | show the utf-8 value of the current character |
  | gf | open the file under the current cursor |

<a dir="misc"></a>
##[[↑]](#top) Misc

1. Basic

  `:r!date` - insert current date/time into editor

  `:r` stands for **read**, `!` means to execute a shell command, `date` is a shell command.

-----------

从windows往vim (通过putty登录) 粘贴代码时，格式乱掉的解决办法: 在粘贴之前打开
vim `paste`:
```shell
:set paste # turn on vim paste

i # enter inserting mode
  # paste your content to vim (e.g. shift + RightClick in putty)

:set nopaste # turn off vim paste
```

# References
1. [vim无插件编程技巧](http://mp.weixin.qq.com/s?__biz=MjM5NzA1MTcyMA==&mid=200211176&idx=1&sn=8ef83ebad1938fd03acd424f0c18abb3&scene=2&from=timeline&isappinstalled=0#rd)

1. [vi Complete Key Binding List](http://hea-www.harvard.edu/~fine/Tech/vi.html)

  Highly recommended!

1. [VIM User Manual 1.9.0](http://vimdoc.sourceforge.net/vimum.html)

  There are also [Chinese version](http://vimcdoc.sourceforge.net/).
