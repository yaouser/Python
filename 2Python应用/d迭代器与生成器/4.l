#不同集合上元素的迭代（就是将几个列表的迭代合在一起）
#itertools.chain()方法 适合对不同集合中所有元素执行某些操作
>>>from itertools import chain
>>>a = [1,2,3,4]
>>>b = ['x','y','z']
>>>for x in chain(a,b):
	print
1
2
3
4
x
y
z

#Various working sets of items
active_items = set()
inactive_iterms = set()

#Iterate over all items
for item in chain(active_items,inactive_items):
	#Process item
