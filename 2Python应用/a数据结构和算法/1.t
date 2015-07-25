#将多个映射合并为单个映射
#collections模块中的ChainMap类来合并多个字典。
#ChainMap可接受多个映射然后在逻辑上使它们表现为一个单独的映射结构。
#ChainMap是维护一个记录底层映射关系的列表，然后重定义常见字典操作来扫描列表。
#ChainMap可以使用基础的字典操作，也能够直接操作以改变原始的数据。

a = {'x':1,'z':3}
b = {'y':2,'z':4}
from collections import ChainMap
c = ChainMap(a,b)
print(c['x']) #Outputs 1 (from a)
print(c['y']) #Outputs 2 (from b)
print(c['z']) #Outpust 3 (rrom a)
>>>len(c)
3
>>>list(c.keys())
['x','y','z']
>>>list(c.values())
[1,2,3]
>>>c['z'] = 10
>>>c['w'] = 40
>>>del c['x']
>>>a
{'w':40,'z':10}

