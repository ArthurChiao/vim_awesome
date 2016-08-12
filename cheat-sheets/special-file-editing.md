Special File Editing
======================

1. Open binary file

  ```shell
  $ vim -b filename
  ```

  Display un-printable characters:

  ```shell
  :set display=uhex
  ```

  Go to the `2345th` byte: `2345go`

1. hex mode

  ```shell
  $ vim -b filename
  ```

  `xxd` program can be used to switch between binary and hex mode:

  ```shell
  :%!xxd    # show file in hex mode
  :%!xxd -r # back to original mode
  ```
