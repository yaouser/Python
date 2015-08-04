#跳过可迭代对象的开始部分
#itertools.dropwhile()函数 它会返回一个迭代器对象，丢弃原有序列中直到函数返回
#True之前的所有元素，然后返回后面所有元素。

>>>with open('/etc/passwd') as f:
	for line in f:
		print(line,end='')

#跳过开始部分的注释行
>>>from itertools import dropwhile
>>>with open('/etc/passwd') as f:
	for line in dropwhile(lambda line: line.startswith('#'), f):
		print(line,end='')

>>>with open('/etc/passwd') as f:
	lines = (line for line in f if not line.startswith('#'))
	for line in lines:
		print(line,end='')

#如果已经明确知道了要跳过的元素的个数的话，可以使用itertools.islice()来代替。
>>>from itertools import islice
>>>items = ['a','b','c',1,4,10,15]
>>>for x in islice(items,3,None):
	print(x)
