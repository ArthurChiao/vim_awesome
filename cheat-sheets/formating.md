some commands for code/text formating
=====================================

1. <a name="set list/nolist">Set List</a>

  `set list` will make the **tabs/whitespaces/EoL** be visable.

  ```shell
  :set list
  :set nolist
  ```

1. <a name="indent">Indent Code Block</a>

  Visual select the code block with `V`, and indent left/right with `<` or `>`.

  Or, specify number of lines to indent:
  ```shell
  >2j # indent current line and 2 lines below, to right
  <4k # indent current line and 4 lines above, to left
  ```

# References

1. [Things About Vim](https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)
