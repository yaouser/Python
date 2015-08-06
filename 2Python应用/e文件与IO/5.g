#读写压缩文件
#gzip和bz2模块可处理，两个模块都为open()函数提供了另外实现。
#这两个模块的open()函数和标准模块中的open()函数类似。

#gzip compression
import gzip
with gzip.open('somefile.gz','rt') as f:
	text = f.read()

#bz2 compression
import bz2
with bz2.open('somefile.bz2','rt') as f:
	text = f.read()

#gzip compression
import gzip
with gzip.open('somefile.gz','wt') as f:
	f.write(text)

#bz2 compression
import bz2
with bz2.open('somefile.bz2','wt') as f:
	f.write(text)
