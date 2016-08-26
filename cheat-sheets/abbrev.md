Abbreviations
==============

List all abbreviations with `:iabbrev`.

All abbreviations start with `x` character.

Or see the detailed abbreviations in `.vim_runtime/vimrc/extended.vim`,
**General Abbreviations** section.

| Command | Action | Comments |
|:------- |:-------|:---------|
| `xdate` | insert current datetime, format `16-08-26 11:03:13`| |
| `xc` | insert the simplest c program | **try it** |
| `xccl` | insert line `/**************************/` | 76-character wide |
| `xpdb` | insert `import pdb; pdb.set_trace()` | |

Usage: in insert mode, when you type an abbrev, such as `xdate`, followed by
either a whitespace, `ESC`, or `Enter` keystoke, the word will be replaced by
its full text (in this case, a datetime string) you specified in the
configuration files.

To delete an abbreviation, use `:unabbreviate`. E.g. `:unabbreviate xpdb`.

TRY THEM!

