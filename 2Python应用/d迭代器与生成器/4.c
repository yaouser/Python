#使用生成器创建新的迭代模式
#一个函数中需要有一个yield语句即可将其转换为一个生成器。和普通函数不同的是，
#生成器只能用与迭代操作。一个生成器函数主要特征是它只会回应在迭代中使用的
#next操作。

>>>def countdown(n):
	print('Starting to count from',n)
	while n > 0:
		yield n 
		n -= 1
	print('Done!')

>>>c = countdown(3)
>>>c
<generator object countdown at 0x1006a0af0>
>>>next(c)
Starting to count from 3
3
>>>next(c)
2
>>>next(c)
1
>>>next(c)
Done!

