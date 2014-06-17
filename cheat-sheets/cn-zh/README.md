vim cheet sheet
=================

1. [插件/plugin](plugin.md)

-------------------

# 其他技巧

## 1. 在 shell 和 vim 直接快速切换 (`ctl-z` 大法)

在 vim 直接按 `ctl-z` (`bg`) 会将 vim 进程移至后台，然后回到了 shell 界面。
此时可以在 shell 进行需要的操作，如编译(gcc)，搜索(find, grep)，等等。
`fg` 命令会将刚才的 vim 进程调至前台，恢复执行。

更多关于 `fg`, `bg` 的信息：

* `fg`: foreground, 将后台任务移至前台，恢复执行
* `bg`: background, 将当前任务移至后台
* `jobs`: 列出所有后台任务

```shell
$ fg % <task_id>  # 将后台任务移至前台，指定后台任务 id

$ bg % <task_id> # move task <task_id> to background
$ ctl-z          # bg 的快捷键，将当前任务移至后台
```

## 2. 给中文和英文（或数字）之间都加上一个空格

* 目的：排版更加美观
* 使用方式：在当前窗口中执行 `:call InsertWhiteSpaceGlobal()`。
* 实现：见 `vim_runtime/vimrcs/basic.vim` 中的 `func! InsertWhiteSpaceGlobal()`。
* 额外推荐 Chrome 插件：[空格之神](https://chrome.google.com/webstore/detail/%E7%82%BA%E4%BB%80%E9%BA%BC%E4%BD%A0%E5%80%91%E5%B0%B1%E6%98%AF%E4%B8%8D%E8%83%BD%E5%8A%A0%E5%80%8B%E7%A9%BA%E6%A0%BC%E5%91%A2%EF%BC%9F/paphcfdffjnbcgkokihcdjliihicmbpd?hl=zh-TW)，**“為什麼你們就是不能加個空格呢？”**。
