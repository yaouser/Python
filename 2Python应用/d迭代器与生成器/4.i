#排列组合的迭代
#迭代遍历一个集合中元素的所有可能的排列或组合
#itertools.permutations() 它接受一个集合并产生一个元组序列，每个元组集合中所有
#元素的一个可能排列组成。
#itertools.combinations()可得到输出集合中元素的所有的组合。
#itertools.combinations_with_replacement()允许同一个元素被选择多次。

>>>items = ['a','b','c']
>>>from itertools import permutations
>>>for p in permutations(items):
	print(p)

('a', 'c', 'b')
('b', 'a', 'c')
('b', 'c', 'a')
('c', 'a', 'b')
('c', 'b', 'a')

>>> for p in permutations(items, 2):
	print(p)

('a', 'b')
('a', 'c')
('b', 'a')
('b', 'c')
('c', 'a')
('c', 'b')



>>> from itertools import combinations
>>> for c in combinations(items, 3):
...     print(c)
...
('a', 'b', 'c')

>>> for c in combinations(items, 2):
...     print(c)
...
('a', 'b')
('a', 'c')
('b', 'c')

>>> for c in combinations(items, 1):
...     print(c)
...
('a',)
('b',)
('c',)



>>> for c in combinations_with_replacement(items, 3):
...     print(c)
...
('a', 'a', 'a')
('a', 'a', 'b')
('a', 'a', 'c')
('a', 'b', 'b')
('a', 'b', 'c')
('a', 'c', 'c')
('b', 'b', 'b')
('b', 'b', 'c')
('b', 'c', 'c')
('c', 'c', 'c')
