#同时迭代多个序列
#使用zip()函数 zip(a,b)会生成一个可放回元组(x,y)的迭代器，其中x来自a,来自b
#zip()会创建一个迭代器来作为结果返回，如果将结对的值存储在列表中，要使用list()

>>>xpts = [1,5,4,2,10,7]
>>>ypts = [101,78,37,15,62,99]
>>>for x,y in zip(xpts,ypts):
	print(x,y)
1 101
5 78
4 37
2 15
10 62
7 99

>>>a = [1,2,3]
>>>b = [10,11,12]
>>>c = ['x','y','z']
>>>for i in zip(a,b,c):
	print(i)

>>>a = [1,2,3]
>>>b = ['w','x','y','z']
>>>for i in zip(a,b):
	print(i)
(1,'w')
(2,'x')
(3,'y')

#itertools.zip_longest()
>>>from itertoools import zip_longest
>>>for i in zip_longest(a,b):
	print(i)
(1,'w')
(2,'x')
(3,'y')
(None,'z')

>>>for i in zip_longest(a,b,fillvalue=0):
	print(i)
(1,'w')
(2,'x')
(3,'y')
(0,'z')

