#字符串连接及合并
#如果想要合并的字符串在一个序列或可迭代对象中，将它们合并起来的最快方法就是
#使用join()方法。join()操作是字符串对象的一个方法。这样设计的部分原因是因为
#想要合并在一起的对象可能来自于各种不同的数据序列，比如列表，元组，字典，文件
#集合或生成器。这样设计只需要指定想要的分隔字符串，然后在字符串对象上使用
#join()方法将文本片段粘合在一起就可以了。
>>>parts = ['Is','Chicago','Not','Chicago?']
>>>' '.join(parts)
'Is Chicago Not Chicago?'
>>>','.join(parts)
'Is,Chicago,Not,Chicago?'
>>>''.join(parts)
'IsChicagoNotChicago?'

>>>a = 'Is Chicago'
>>>b = 'Not Chicago?'
>>>a + ' ' + b
'Is Chicago Not Chicago?'

>>>print('{} {}'.format(a,b))
Is Chicago Not Chicago?
>>>print(a + ' ' + b)
Is Chicago Not Chicago?

>>>a = 'Hello' 'World'
>>>a
'HelloWorld'

#慢
s = ''
for p in parts:
	s += p

>>>data = ['ACME',50,91.1]
>>>','.join(str(d) for d in data)
'ACME,50,91.1'

print(a + ':' + b + ':' + c)  	#Ugly
print(':'.join([a,b,c]))	#Still ugly
print(a,b,c.sep=':')		#Better


def combine(source,maxsize):
	parts = []
	size = 0
	for part in source:
		parts.append(part)
		size += len(part)
		if size > maxsize:
			yield ''.join(parts)
			parts = []
			size = 0
	yield ''.join(parts)

for part in combine(sample(),32768):
	f.write(part)
