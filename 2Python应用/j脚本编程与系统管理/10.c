#解析命令行选项
sys.argv 可以接受命令行的参数
Python3内建的argparse模块可以用于命令行解析
Python3中的getopt模块也是专门处理命令行参数的

======================================================================

argparse模块
-------------------------
import argparse
parser = argparse.ArgumentParser()
parser.add_argument()
...
...
parser.parser_args()
print()
...
...
------------------------------
#example search.py
import argparse

parser = argparse.ArgumentParser(description='Search some files')

parser.add_argument(dest='filenames',metavar='filename',nargs='*')
parser.add_argument('-p','-pat',metavar='pattern',required=True,dest='patterns',action='append',help='text pattern to search for')
parser.add_argument('-v',dest='verbose',action='store_true',help='verbose mode')
parser.add_argument('-o',dest='outfile',action='store',help='output file')
parser.add_argument('-speed',dest='speed',action='store',choices={'slow','fast'},default='slow',help='search speed')

args = parser.parse_args()

print(args.filenames)
print(args.patterns)
print(args.verbose)
print(args.outfile)
print(args.speed)

----------------------./search.py----./search.py -v--------------------

usage: search.py [-h] -p pattern [-v] [-o OUTFILE] [-speed {fast,slow}]
                 [filename [filename ...]]

--------------------------./search.py -h-------------------------------

usage: search.py [-h] -p pattern [-v] [-o OUTFILE] [-speed {slow,fast}]
                 [filename [filename ...]]

Search some files

positional arguments:
  filename

optional arguments:
  -h, --help            show this help message and exit
  -p pattern, -pat pattern
                        text pattern to search for
  -v                    verbose mode
  -o OUTFILE            output file
  -speed {slow,fast}    search speed

=============================================================================
