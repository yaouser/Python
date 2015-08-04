#迭代器切片
#itertools.islice()适用于迭代器和生成器上做切片操作。
#islice()迭代器是不可逆的这个事实。所以如果需要之后再次访问这个迭代器的话，就
#需要先将它里面的数据放入一个列表中。

>>>def count(n):
	while True:
		yield n
		n += 1
>>>c = count(0)
>>>c[10:20]
error

>>>import itertools
>>>for x in itertools.islice(c,10,20):
	print(x)



