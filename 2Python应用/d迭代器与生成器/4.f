#带有外部状态的生成器函数
#如果生成器函数需要跟你的程序其他部分打交道的话（比如暴露属性值，允许通过方法
#调用来控制等等），可能会导致你的代码异常复杂。如果是这种情况的话，可以考虑使
#用在__iter__()方法中定义你的生成器不会改变你任何的算法逻辑，在其它地方定义各
#种属性和方法来提供用户使用。

form collections import deque

class linehistory:
	def __init__(self,lines,histlen=3):
		self.lines = lines
		self.history = deque(maxlen=histlen)

	def __iter__(self):
		for lineno, line in enumerate(self.lines,1):
			self.history.append((lineno,line))
			yield line

	def clear(self):
		self.history.clear()



with open('somefile.txt') as f:
	lines = linehistory(f)
	for line in lines:
		if 'python' in line:
			for lineno, hline in lines.history:
				print('{}:{}'.format(lineno,hline),end='')
