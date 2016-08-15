vim setting commands
===================

1. show settings

  ```shell
  :set all # show all vim settings
  :set     # show the settings you have specifically changed

  :set <option>? # show current value of <option>, e.g. :set list?

  :scriptnames # list all configure files that have been loaded
  ```

1. show absolute/relative line number

  ```shell
  :set number # show line number
  :set relativenumber # show absolute number of current line, and relative
                      # numbers for other lines, easy to jump up/down with <N>j/k
                      # COOL!
  ```

1. List all key bindings

  To show all the key bindins of the current configuration:

  ```shell
  :map

     '2           @/def<Space>
     '1           @/class<Space>
  n  'b          *@:call pymode#breakpoint#operate(line('.'))<CR>
  v  'r          *@:PymodeRun<CR>
  n  'r          *@:PymodeRun<CR>
  o  C           *@:<C-U>call pymode#motion#select('^\s*class\s', 0)<CR>
  F            @:set foldmethod=indent<CR>
  v  K           *@:<C-U>call pymode#doc#show(@*)<CR>
  n  K           *@:call pymode#doc#find()<CR>
  ```

  `n`: normal mode.
