#同时对数据做转换和换算
#有一种非常优雅的方式能将数据换算和转换结合在一起 在函数中使用生成器表达式。

nums = [1,2,3,4,5]
s = sum(x*x for x in nums)

#Determine if any .py files exist in a directory
import os
files = os.listdir('dirname')
if any(name.endswith('.py') for name in files):
	print('There be python!')
else:
	print('Sorry,no python.')

#Output a tuple as CSV
s = ('ACME',50,123.45)
print(','.join(str(x) for x in s))

#Data reduction across fields of a data structure
portfolio = [
	{'name':'GOOG','shares':50},
	{'name':'YHOO','shares':75},
	{'name':'AOL','shares':20},
	{'name':'SCOX','shares':65}
]
min_shares = min(s['shares'] for s in portfolio)
