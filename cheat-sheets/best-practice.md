Best Practices
===============

1. replace/delete in part of a file, using relative addressing

  delete any lines containing string "foo" from current line through the
  next 21 lines:

  ```shell
  :.,+21g/foo/d
  ```

  from here to the end of the file, delete any lines that DON'T contain the
  string "bar":

  ```shell
  :.,$v/bar/d
  ```

  some explanations:

  * `.`   - current line
  * `+21` - use relative prefix (`+/-`) 
  * `g` (in `:.,+21g/foo/d`)  - globally (the area/text you specifed) applying
  * `v`   - reVerse matching

  more related:

  * `$`   - last line

  --------

  for every line containing "foo", substitute all "bar" with "zzz":

  ```shell
  :% g/foo/s/bar/zzz/g
  ```

1. visual selection

  | Command | Action | Comments |
  |:--------|:-------|:--------|
  | `viB` or `vi{` | select contents inside current **curly braces** | real useful for C/C++ code |
  | `vi"` and `vi'` | select contents inside current `""` and `''` | |

# References
1. [What Is Your Most Productive Shortcut With Vim](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim)
