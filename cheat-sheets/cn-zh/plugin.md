some plugin commands
==========================

## 1. Nerdtree
Nerdtree[官方完整doc](https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt).

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| m  | 打开nerdtree菜单 |
| `o` or `Enter` | 打开文件，展开目录，打开书签等 |
| `O` | 递归开展目录 |
| s  | 在新的**垂直**子窗口里打开文件 |
| i  | 在新的**水平**子窗口里打开文件 |
| t  | 在新的tab里打开文件 |
| gt | tab 之间切换 |
| x  | unfold当前所在文件夹 |
| X  | 向上递归unfold所有文件夹 |
| R  | 从nerdtree根目录开始refresh目录内容 |
| cd | 将当前目录设为nerdtree root |
| CD | 从nerdtree root开始显示目录结构 |
| I  | 是否显示隐藏文件开关 |
| f  | 是否启用文件过滤(file filter)开关 |
| F  | 是否显示文件（只显示目录） |
| B  | 是否显示书签 |
| q  | 关闭nerdtree窗口 |
| A  | 最大化/还原nerdtree window |
| `'nn` (其中`'`是我的vim配置里的leader键) | 打开/关闭nerdtree window |


## 2. Ctrlp
Visit this page to see the [full command list](https://github.com/ArthurChiao/vim_awesome/tree/master/.vim_runtime/sources_non_forked/ctrlp.vim)
from the official repository.

![ctrlp](https://camo.githubusercontent.com/0a0b4c0d24a44d381cbad420ecb285abc2aaa4cb/687474703a2f2f692e696d6775722e636f6d2f7949796e722e706e67)

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

Here are some frequently used commands:

| Command | Function |
| :------ | :-------- |
| F5 | 更新ctrlp文件缓存 |
| `<c-j>`  | 在Ctlp window中向上移动光标 |
| `<c-k>`  | 在Ctlp window中向下移动光标 |
| `<c-t>`  | 在新`tab`中打开光标下的文件 |
| `<c-v>`  | 在新`vertical` window中打开光标下的文件 |
| `<c-x>`  | 在新`horizontal` window中打开光标下的文件 |
| `<c-y>`  | 创建新文件 |
| `:<line num>` | 打开文件并跳到指定行, 例如`:15`回车，会打开文件并跳到第15行 |
