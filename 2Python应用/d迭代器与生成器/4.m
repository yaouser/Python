#创建数据处理管道
#类似Unix管道 有个大量的数据需要处理不能将它们一次性放入内存中
#以管道方式处理数据 可以解决 解析 读取实时数据 定时轮询 日志
#yield语句作为数据的生产者而for循环语句作为数据的消费者，当将这些生成器连在
#一起后，每个yield会将一个单独的数据元素产地给迭代处理管道的下一阶段。

#示例 处理日志文件

#日志目录
foo/
	access-log-012007.gz
	access-log-022007.gz
	access-log-032007.gz
	...
	access-log-012008
bar/
	access-log-092007.bz1
	...
	access-log-022008

#假设每个日志文件包含这样的数据
124.115.6.12 - - [10/Jul/2012:00:18:50 -0500] "GET /robots.txt ..." 200 71
210.212.209.67 - - [10/Jul/2012:00:18:51 -0500] "GET /ply/ ..." 200 11875
210.212.209.67 - - [10/Jul/2012:00:18:51 -0500] "GET /favicon.ico ..." 404 369
61.135.216.105 - - [10/Jul/2012:00:20:04 -0500] "GET /blog/atom.xml ..." 304 -
...

#定义多个执行特定任务独立任务的简单生成器函数组成的容器

import os
import fnmatch
import gzip
import bz2
import re

def gen_find(filepat,top):
	'''
	Find all filenames in a directory tree that match al shell
	'''
	for path, dirlist, filelist in os.walk(top):
		for name in fnmatch.filter(filelist, filepat):
			yield os.path.join(path.name)

def gen_opener(filenames):
	'''
	Open a sequence of filenames one at a time producing a file object.
	The file is closed immediately when proceeding to the next iteration.
	'''
	for filename in filenames:
		if filename.endswith('.gz'):
			f = gzip.open(filename, 'rt')
		elif filename.endswith('.bz2'):
			f = bz2.open(filename, 'rt')
		else:
			f = open(filename, 'rt')
		yield f 
		f.close()

def gen_concatenate(iterators):
	'''
	Chain a sequence of iterators together into a single sequence.
	'''
	for it in iterators:
		yield from it

def gen_grep(pattern,lines):
	'''
	Look for a pattern in a sequence of lines
	pat = re.compile(pattern)
	for line in lines:
		if pat.search(line):
			yield line

#将这些函数连起来创建一个处理管道

lognames = gen_find('access-log*','www')
files = gen_opener(lognames)
lines = gen_concatenate(files)
pylines = gen_grep('(?i)python',lines)
for line in pylines:
	print(line)

#如果将扩展管道，可以在生成器表达式中包装数据

lognames = gen_find('access-log*','www')
files = gen_opener(lognames)
lines = gen_concatenate(files)
pylines = gen_grep('(?i)python',lines)
bytecolumn = (line.rsplit(None,1)[1] for line in pylines)
bytes = (int(x) for x in bytecolumn if x != '-')
print('Total', sum(bytes))
