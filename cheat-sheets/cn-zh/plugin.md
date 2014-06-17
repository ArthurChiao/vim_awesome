some plugin commands
==========================

## 1. Nerdtree
Nerdtree[官方完整 doc](https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt).

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| m  | 打开 nerdtree 菜单 |
| `o` or `Enter` | 打开文件，展开目录，打开书签等 |
| `O` | 递归开展目录 |
| s  | 在新的**垂直**子窗口里打开文件 |
| i  | 在新的**水平**子窗口里打开文件 |
| t  | 在新的 tab 里打开文件 |
| gt | tab 之间切换 |
| x  | unfold 当前所在文件夹 |
| X  | 向上递归 unfold 所有文件夹 |
| R  | 从 nerdtree 根目录开始 refresh 目录内容 |
| cd | 将当前目录设为 nerdtree root |
| CD | 从 nerdtree root 开始显示目录结构 |
| I  | 是否显示隐藏文件开关 |
| f  | 是否启用文件过滤(file filter)开关 |
| F  | 是否显示文件（只显示目录） |
| B  | 是否显示书签 |
| q  | 关闭 nerdtree 窗口 |
| A  | 最大化/还原 nerdtree window |
| `'nn` (其中`'`是我的 vim 配置里的 leader 键) | 打开/关闭 nerdtree window |


## 2. Ctrlp
Visit this page to see the [full command list](https://github.com/ArthurChiao/vim_awesome/tree/master/.vim_runtime/sources_non_forked/ctrlp.vim)
from the official repository.

![ctrlp](https://camo.githubusercontent.com/0a0b4c0d24a44d381cbad420ecb285abc2aaa4cb/687474703a2f2f692e696d6775722e636f6d2f7949796e722e706e67)

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| F5 | 更新 ctrlp 文件缓存 |
| `<c-j>`  | 在 Ctlp window 中向上移动光标 |
| `<c-k>`  | 在 Ctlp window 中向下移动光标 |
| `<c-t>`  | 在新 `tab` 中打开光标下的文件 |
| `<c-v>`  | 在新 `vertical` window 中打开光标下的文件 |
| `<c-x>`  | 在新 `horizontal` window 中打开光标下的文件 |
| `<c-y>`  | 创建新文件 |
| `:<line num>` | 打开文件并跳到指定行, 例如`:15` 回车，会打开文件并跳到第 15 行 |

## 6. [Surround](https://vimawesome.com/plugin/surround-vim)

功能：用`""`, `''`, `()`, `{}`等将选择内容括起来（surround）。例如将 `1+2` 变成`(1+2)`。

以下列举一些例子，大部分来自官方文档。其中的`*`表示光标所在的位置。

### 6.1 Add Surrounds

选中内容再按 `S`: 添加 surround, e.g. `veS"`将选中的 word 用双引号引起来

1. `v` 进入 visual 模式
2. `e` 光标移动到 word 结束
3. `S` 添加 surround
4. `"` 使用双引号 surround

选中内容的方式，可以用 visual mode，也可以用其他方式，visual mode 比较直观。

| Text    | Command   | Result |
| :------ | :-------- | :----- |
| if *x>3 {               | `ysW(`     |  if ( x>3 ) {              |
| my $str = *whee!;       | `vllllS'`  |  my $str = 'whee!';        |

### 6.2 Delete Surrounds

`ds`: 删除 surround, e.g. `ds"`删除双引号`""`

| Text    | Command   | Result |
| :------ | :-------- | :----- |
| "Hello *world!"         | `ds"`      |  Hello world!              |

### 6.3 Change Surrounds

`cs`: 替换 surround, e.g. `cs"'`将双引号替换成单引号

| Text | Command | Result |
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

这里需要注意，用左括号添加 surround，在括号后面会有一个空格；用右括号不会有空格。
引号等与此类似。
