#迭代器代替while无限循环
#iter()函数一个很少知道的特性是它接受一个可选的callable对象和一个标记（结尾）
#值作为输入参数，这个迭代器会不断调用callable对象直到返回值和标记值相等为止。
#这个特殊的方法对涉及到I/O调用的函数，如果想从套接字或文件中以数据块读取数据，
#通常需不断重复的执行read()或recv()，并在后面紧跟一个文件结尾测试来决定是否
#终止。

#用while实现的IO操作程序

CHUNKSIZE = 8192
def reader(s):
	while True:
		data = s.recv(CHUNKSIZE)
		if data == b'':
			break
		process_data(data)

#使用iter()代替
def reader2(s):
	#lambda函数参数创建一个无参的callable对象，并为recv read方法提供size
	for chunk in iter(lambda: s.recv(CHUNKSIZE),b''):
		pass
		#process_data(data)


#示例
>>>import sys
>>>f = open('/etc/passwd')
>>>for chunk in iter(lambda: f.read(10), ''):
	n = sys.stdout.write(chunk)
