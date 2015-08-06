#固定大小记录的文件迭代
#在一个固定长度记录或者数据块的集合上迭代，而不是在一个文件中一行一行的迭代。
#iter()和functools.partial()
#iter()函数 给它传递一个可调用对象和一个标记值，它会创建一个迭代器。标记值
#b''就是当到达文件结尾时的返回值。
#functools.partical用来创建一个每次被调用时从文件中读取固定数目字节的可调用
#对象。

from functools import partial
RECORD_SIZE = 32
with open('somefile.data','rb') as f:
	records = iter(partial(f.read, RECORD_SIZE),b'')
	for r in records:
		...

