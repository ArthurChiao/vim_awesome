if version >= 500
    "=========================================================================
    " The beautify-chinese plugin aims at correcting common mistakes in
    " Chinese-written documents.
    "
    " 本插件用于更正中文文档中的一些错误，以及更重要地，对中文文档进行美化，
    " 以使排版更美观。例如，文档中常见的错误或可改进项包括：
    "
    " * 本该使用中文标点的地方使用了英文标点
    " * 汉字和英文/数字之间没有空格，排版效果非常拥挤
    " * 汉字和代码之间没有空格，排版效果非常拥挤
    "
    " CNChar: one Chinese (CN) character, e.g. "我"
    " ENChar: one English (EN) character, e.g. "A"
    " Digit: one digit, e.g. "6"
    "=========================================================================

    " beautify Chinese documents
    func! BeautifyChineseRun()
        " ignorecase setting will lead to 100% CPU for some time,
        " so we temprarily disable it before executing
        let prev_ignorecase=&ignorecase
        set noignorecase " case sentitive

        exe "normal mz"

        " add white space between a CNChar and an ENChar/Digit, or vise verses
        " e.g. "来看这个case" -> "来看这个 case"
        "      "check实验结果" -> "check 实验结果"
        "      "总共8台机器" -> "总共 8 台机器"
        silent! %s/\([0-9a-zA-Z]\)\([\u4e00-\u9fff]\)/\1 \2/g
        silent! %s/\([\u4e00-\u9fff]\)\([0-9a-zA-Z]\)/\1 \2/g

        " add white space between CNChar and code block
        " e.g. "函数`foo()`的作用" -> "函数 `foo()` 的作用"
        silent! %s/\([0-9a-zA-Z]\)\(`\)\([\u4e00-\u9fff]\)/\1\2 \3/g
        silent! %s/\([\u4e00-\u9fff]\)\(`\)\([0-9a-zA-Z]\)/\1 \2\3/g

        " replace EN comma "," with CN comma "，" in Chinese sentences
        " e.g. "第一个例子,首先" -> "第一个例子，首先"
        "      ",首先" -> "，首先"
        silent! %s/\([\u4e00-\u9fff]\),/\1，/g
        silent! %s/,\([\u4e00-\u9fff]\),/，\2/g

        " save changes
        write
        exe "normal `z"

        " restore ignorecase setting
        let &ignorecase=prev_ignorecase
        unlet prev_ignorecase
    endfunc


    " Insert whitespace between English words/digits and Chinese characters
    " Better for human reading
    " Note: this is a simplified version of BeautifyChineseRun()
    func! InsertWhiteSpaceGlobal()
        " ignorecase setting will lead to 100% CPU for some time,
        " so we temprarily disable it before executing
        let prev_ignorecase=&ignorecase
        set noignorecase " case sentitive

        exe "normal mz"
        %s/\([0-9a-zA-Z]\)\([\u4e00-\u9fff]\)/\1 \2/g
        %s/\([\u4e00-\u9fff]\)\([0-9a-zA-Z]\)/\1 \2/g
        %s/\([0-9a-zA-Z]\)\(`\)\([\u4e00-\u9fff]\)/\1\2 \3/g
        %s/\([\u4e00-\u9fff]\)\(`\)\([0-9a-zA-Z]\)/\1 \2\3/g
        write
        exe "normal `z"

        " restore ignorecase setting
        let &ignorecase=prev_ignorecase
        unlet prev_ignorecase
    endfunc


    " VIM commands
    command! BeautifyChineseRun :call BeautifyChineseRun()
    command! InsertWhiteSpaceGlobal :call InsertWhiteSpaceGlobal()
endif " if version >= 500
