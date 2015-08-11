#减少可调用对象的参数个数
#如果需要减少某个函数的参数个数，可以使用fcunctools.partial()。partial()函数
#允许你给一个或多个设置固定的值，减少接下来被调用时的参数个数。

def spam(a,b,c,d):
	print(a,b,c,d)

>>>from functools import partial
>>>s1 = partial(spam,1) # a = 1
>>>s1(2,3,4)
1 2 3 4
>>>s1(4,5,6)
1 4 5 6
>>>s2 = partial(spam,1,2,d=42) #d = 42
>>>s2(1,2,3)
1 2 3 42
>>>s2(4,5,5)
4 5 5 42
>>>s3 = partial(spam,1,2,d=42) # a = 1,b = 2,d = 42
>>>s3(3)
1 2 3 42
>>>s3(4)
1 2 4 42
>>>s3(5)
1 2 5 42

