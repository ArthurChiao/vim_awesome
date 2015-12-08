visual mode commands
======================

## enter visual mode

| Command  |  Function |
| :-------- |  :--------- |
| v                 |  start character selection |
| V or `shift + v`  |  start line selection |
| `ctl + v`         |  start block selection |
| `va"`             |  select texts between "" |
| `va[`             |  select texts between [] |
| `va{`             |  select texts between {} |
| `v%`              |  select texts until matching current punctuation (", [, {, etc), similar effetcs as `va` |

## combinations with visual mode

### code indentation in `line selection mode`

| Command  |  Function |
| :-------- |  :--------- |
| `<`  |  indent selected lines (with `shift + v`) to left by one tab |
| `>`  |  indent selected lines (with `shift + v`) to right by one tab |

### block substitution in `block selection mode`

| Command  |  Function |
| :-------- |  :--------- |
| `s`  |  substitute selected blocks (with `ctl + v`) |
| `I`  |  insert at head of the selected blocks (with `ctl + v`) |


### others
