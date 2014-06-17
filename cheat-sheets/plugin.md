some plugin commands
==========================

## 1. Nerdtree
Visit this page to see the [full command list](https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt)
from the official repository.

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| m  |  open the menu |
| `o` or `Enter` | open files, directories, bookmarks |
| `O` | **Recursivly** open the selected directory |
| s  | open a file in a vertical split window |
| i  | open a file in a horizontal split window |
| t  | open a file in new tab |
| gt | jump between tabs |
| x  | close the current node parent (unfold current folder) |
| X  | **Recursivly** close the current node parent (unfold folders) |
| R  | refresh |
| cd | change tree root to the selected node/directory |
| CD | change tree root to CWD |
| I  | toggle whether hidden files displayed |
| f  | toggle whether file filters are used |
| F  | toggle whether files are displayed |
| B  | toggle whether bookmark table displayed |
| q  | QUIT nerdtree window |
| A  | zoom in/out nerdtree window |
| `'nn` where `'` is the `<leader>` in my vim conf | open/close nerdtree window |

## 2. Ctrlp
Visit this page to see the [full command list](https://github.com/ArthurChiao/vim_awesome/tree/master/.vim_runtime/sources_non_forked/ctrlp.vim)
from the official repository.

![ctrlp](https://camo.githubusercontent.com/0a0b4c0d24a44d381cbad420ecb285abc2aaa4cb/687474703a2f2f692e696d6775722e636f6d2f7949796e722e706e67)

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| F5 | purge the cache for the current directory to get new files, remove deleted files and apply new ignore options |
| `<c-j>`  | move cursor down in Ctlp window |
| `<c-k>`  | move cursor up in Ctlp window |
| `<c-t>`  | open selected file in new `tab` |
| `<c-v>`  | open selected file in new `vertical` split window |
| `<c-x>`  | open selected file in new `horizontal` split window |
| `<c-y>`  | create a new file and its parent directories |
| `:<line num>` | open file and jump to specified line, e.g. type `:15` then `Enter`, the file will be opened and cursor will be at `15th line` |

## 3. Tarbar

`:Ta` + TAB to show all commands starts with `Ta`.

| Command | Function |
| :------ | :-------- |
| :Tagbar | toggle of tagbar |

## 4. Python Mode

`:Py` + TAB to show all commands starts with `Py`.

| Command | Function |
| :------ | :-------- |
| :PyLint | run pylint |

## 5. MRU

`<leader>j`: List most recently used files

## 6. [Surround](https://vimawesome.com/plugin/surround-vim)

Help to memorize Surround commands:

Some examples. An asterisk (*) is used to denote the cursor position.

### 6.1 Add Surrounds

Select content then strike `S`: add surround, e.g. `veS"` surround selected word with `""`

1. `v` enter visual mode
2. `e` to the end of the word
3. `S` add surround
4. `"` surround char)

Select content could use visual mode, or not.

| Text    | Command   | Result |
| :------ | :-------- | :----- |
| if *x>3 {               | `ysW(`     |  if ( x>3 ) {              |
| my $str = *whee!;       | `vllllS'`  |  my $str = 'whee!';        |

### 6.2 Delete Surrounds

`ds`: delete surround, e.g. `ds"` deletes `""`.

| Text    | Command   | Result |
| :------ | :-------- | :----- |
| "Hello *world!"         | `ds"`      |  Hello world!              |

### 6.3 Change Surrounds

`cs`: change surround, e.g. `cs"'` changes `""` to `''`.

| Text    | Command   | Result |
| :------ | :-------- | :----- |
| [123+4*56]/2            | `cs])`     |  **(123+456)/2**           |
| [123+4*56]/2            | `cs](`     |  **( 123+456 )/2**         |
| "Look ma, I'm *HTML!"   | `cs"<q>`   |  <q>Look ma, I'm HTML!</q> |
| "Hello *world!"         | `cs"'`     |  'Hello world!'            |
| "Hello *world!"         | `cs"<q>`   |  <q>Hello world!</q>       |
| (123+4*56)/2            | `cs)]`     |  [123+456]/2               |
| (123+4*56)/2            | `cs)[`     |  [ 123+456 ]/2             |
| <div>Yo!*</div>         | `cst<p>`   |  <p>Yo!</p>                |
| Hello w*orld!           | `ysiw)`    |  Hello (world)!            |
