vim cheet sheet
=================

1. [插件/plugin](plugin.md)

-------------------

## 其他技巧

1. 在shell和vim直接快速切换 (`ctl-z`大法)

  在vim直接按`ctl-z` (`bg`) 会将vim进程移至后台，然后回到了shell界面。
  此时可以在shell进行需要的操作，如编译(gcc)，搜索(find, grep)，等等。
  `fg`命令会将刚才的vim进程调至前台，恢复执行。

  更多关于`fg`, `bg`的信息：

  * `fg`: fore ground, 将后台任务移至前台，恢复执行
  * `bg`: back ground, 将当前任务移至后台
  * `jobs`: 列出所有后台任务

  ```shell
  fg % <task_id>  # 将后台任务移至前台，指定后台任务id

  bg % <task_id> # move task <task_id> to background
  ctl-z          # bg的快捷键，将当前任务移至后台
  ```
