some commands for code/text formating
=====================================

Index:

1. [Set List](#set_list)
1. [Indent](#indent)
1. [Bracket Matching](#bracket_matching)
1. [gq: format text block](#gq)

--------------

1. <a name="set_list">Set List</a>

    `set list` will make the **tabs/whitespaces/EoL** be visable.

    ```shell
    :set list
    :set nolist
    ```

1. <a name="indent">Indent Code Block</a>

    Visual select the code block with `V`, and indent left/right with `<` or `>`.

    Or, specify number of lines to indent:
    ```shell
    :set shiftwidth=4 # set indent size

    >>  # indent current line to right
    <<  # indent current line to left

    2>> # indent 2 lines (current line and 1 lines below) to right
    4<< # indent 4 lines (current line and 3 lines below) to left

    >2j # indent current line and 2 lines below, to right
    <4k # indent current line and 4 lines above, to left
    ```

1. <a name="bracket_matching">Bracket Matching</a>

    `%` will jump to the matching brackets, eg. `(` or `[` or `{` `}`.

    If the character under cursor is not a bracket char,
    it will find the first one in forward direction.

1. <a name="gq">`gq` - Format Text Block</a>

    How to re-format text file to 75-chracter width:

    ```shell
    # 1. set target width
    :set textwidth=75

    # 2. visual select content of entire file
    ggVG

    # 3. re-format
    gq
    ```

    Try it, fascinating!



# References

1. [Things About Vim](https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)
