vim cheet sheet
=================

This is a cheat sheet of the bind keys. It includes both vim built-in keys
as well as some custom keys for the various plugins.

Also see [here](cn-zh/) for the Chinease edition [中文版](cn-zh/), note the
Chinese version may not be updated as frequently as this English version.

------------

1. [basic builtin commands](builtin.md)
1. [visual mode](visual-mode.md)
1. [plugin](plugin.md)
1. [code/text formating](formating.md)
1. [vim custome settings](setting.md)
1. [syntax highlight](syntax-highlight.md)

-------------------

## other helpful skills

1. switch between shell and vim (`ctl-z` + `fg`)

  If you are doing some code editing, debugging and testing work, i mean,
  edit files with vim -> exit vim -> test and run -> edit files again -> exit
  vim -> test and run -> ... you don't have to open and close vim again and again.

  `fg` (`ctl-z`) and `bg` will save you.

  some shell commands:
  ```shell
  jobs # shell command, list all background tasks

  fg             # move last background task to frontground (restore executing)
  fg % <task_id> # move background task <task_id> to frontground

  bg             # move task to background
  bg % <task_id> # move task <task_id> to background
  ctl-z          # move current task to background
  ```

  so the process can be simplified to: after finishing editing, press `ctrl-z`
  to put vim process into background, now you are in shell, do your testing,
  and use `fg` to call back your vim again.
