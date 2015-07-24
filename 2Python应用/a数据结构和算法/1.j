#从序列中移除重复项且保持元素间顺序不变

>>>a = [1,5,2,1,9,1,5,10]
>>>list(dedupe(a))
[1,5,2,9,10]

>>>a = [{'x':1,'y':2},{'x':1,'y':3},{'x':1,'y':2},{'x':2,'y':4}]
>>>list(dedupe(a,key=lambda d: (d['x'],d['y'])))
[{'x':1,'y':2},{'x':1,'y':3},{'x':2,'y':4}]
>>>list(dedupe(a,key=lambda d: d['x']))
[{'x':1,'y':2},{'x':2,'y':4}]

>>>a
[1,5,3,1,9,1,5,10]
>>>set(a)
{1,2,10,5,9}

#如果想读一个文件，去除其中重复的文本行，可以这样处理
with open(somefile,'r') as f:
	for line in dedupe(f):
....
#dedupe()函数也模仿了内置函数sorted() min() max()对key函数的使用方式。

