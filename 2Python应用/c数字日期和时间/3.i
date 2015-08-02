#大型数组运算
#NumPy模块提供了使用C语言的机制分配内存，也就是说，它是一个非常大的连续的并由
#同类型数据组成的内存区域，计算速度更快。为Python提供一个数组对象的特征，相比
#标准的Python列表更适合来做数学运算。

#Python lists
>>>x = [1,2,3,4]
>>>y = [5,6,7,8]
>>>x * 2
[1,2,3,4,1,2,3,4]
>>>x +10
error
>>>x + y
[1,2,3,4,5,6,7,8]

#Numpy arrays 运算作用于每个元素上
>>>import numpy as np
>>>ax = np.array([1,2,3,4])
>>>ay = np.array([5,6,7,8])
>>>ax * 2
array([2,4,6,8])
>>>ax + 10
array([11,12,13,14])
>>>ax + ay
array([6,8,10,12])
>>>ax * ay
array([5,12,21,32])

#计算多项式的值
>>>def f(x):
	return 3*x**2 - 2*x +7
>>>f(ax)
array([8,15,28,47])
#numpy还提供了作为math模块中类似函数。
>>>np.sqrt(ax)
array([1.,1.41421356,1.73205081,2.])
>>>np.cos(ax)
array([0.54030231,-0.41614684,-0.9899925,-0.65364362])

>>>grid = np.zeros(shape = (10000,10000), dtype = float)
>>>grid
array([[0.,0.,...0.,0.,0.],
	...
	...
	[0.,0.,...0.,0.,0.]])
>>>grid += 10
>>>np.sin(grid)


>>> a = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
>>> a
array([[ 1, 2, 3, 4],
[ 5, 6, 7, 8],
[ 9, 10, 11, 12]])

>>> # Select row 1
>>> a[1]
array([5, 6, 7, 8])

>>> # Select column 1
>>> a[:,1]
array([ 2, 6, 10])

>>> # Select a subregion and change it
>>> a[1:3, 1:3]
array([[ 6, 7],
        [10, 11]])
>>> a[1:3, 1:3] += 10
>>> a
array([[ 1, 2, 3, 4],
        [ 5, 16, 17, 8],
        [ 9, 20, 21, 12]])

>>> # Broadcast a row vector across an operation on all rows
>>> a + [100, 101, 102, 103]
array([[101, 103, 105, 107],
        [105, 117, 119, 111],
        [109, 121, 123, 115]])
>>> a
array([[ 1, 2, 3, 4],
        [ 5, 16, 17, 8],
        [ 9, 20, 21, 12]])

>>> # Conditional assignment on an array
>>> np.where(a < 10, a, 10)
array([[ 1, 2, 3, 4],
        [ 5, 10, 10, 8],
        [ 9, 10, 10, 10]])
