import sys
import re
import codecs
import snowballstemmer

def usage():
    print('''usage: jsx_stemwords [-l <language>] [-i <input file>] [-o <output file>] [-c <character encoding>] [-p[2]] [-h]

The input file consists of a list of words to be stemmed, one per
line. Words should be in lower case, but (for English) A-Z letters
are mapped to their a-z equivalents anyway. If omitted, stdin is
used.

If -c is given, the argument is the character encoding of the input
and output files.  If it is omitted, the UTF-8 encoding is used.

If -p is given the output file consists of each word of the input
file followed by \"->\" followed by its stemmed equivalent.
If -p2 is given the output file is a two column layout containing
the input words in the first column and the stemmed eqivalents in
the second column.

Otherwise, the output file consists of the stemmed words, one per
line.

-h displays this help''')

def main():
    argv = sys.argv[1:]
    if len(argv) < 5:
        usage()
    else:
        pretty = 0
        input = ''
        output = ''
        encoding = 'utf_8'
        language = 'English'
        show_help = False
        while len(argv):
            arg = argv[0]
            argv = argv[1:]
            if arg == '-h':
                show_help = True
                break;
            elif arg == "-p":
                pretty = 1
            elif arg == "-p2":
                pretty = 2
            elif arg == "-l":
                if len(argv) == 0:
                    show_help = True
                    break
                language = argv[0]
                argv = argv[1:]
            elif arg == "-i":
                if len(argv) == 0:
                    show_help = True
                    break
                input = argv[0]
                argv = argv[1:]
            elif arg == "-o":
                if len(argv) == 0:
                    show_help = True
                    break
                output = argv[0]
                argv = argv[1:]
            elif arg == "-c":
                if len(argv) == 0:
                    show_help = True
                    break
                encoding = argv[0]
        if show_help or input == '' or output == '':
            usage()
        else:
            stemming(language, input, output, encoding, pretty)


def stemming(lang, input, output, encoding, pretty):
    result = []
    stemmer = snowballstemmer.stemmer(lang)
    for original in codecs.open(input, "r", encoding).readlines():
        original = original.strip()
        stemmed = stemmer.stemWord(original)
        if result:
            result.append('\n')
        if pretty == 0:
            if stemmed != "":
                result.append(stemmed)
        elif pretty == 1:
            result.append(original, " -> ", stemmed)
        elif pretty == 2:
            result.append(original)
            if len(original) < 30:
                result.append(" " * (30 - len(original)))
            else:
                result.append("\n")
                result.append(" " * 30)
            result.append(stemmed)
    outfile = codecs.open(output, "w", encoding)
    outfile.write(''.join(result) + '\n')
    outfile.close()

main()
