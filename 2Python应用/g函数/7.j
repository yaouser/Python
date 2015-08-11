#访问闭包中定义的变量
#通常来讲，闭包的内部变量对于外界来讲是完全隐藏的，但是，可以通过编写访问函数
#并将其作为函数属性绑定到闭包上来实现。

def sample():
	n = 0 
	#Closure function
	def func():
		print('n=',n)

	#Accessor methods for n
	def get_n():
		return n

	def set_n(value):
		nonlocal n
		n = value

	#Attach as function attributes
	func.get_n = get_n
	func.set_n = set_n
	return func

==========================================
#use

>>>f = sample()
>>>f()
n=0
>>>f.set_n(10)
>>>f()
n=10
>>>f.get_n()
10
============================================

#闭包模拟类

import sys
class ClosureInstance:
	def __init__(self,local=None):
		if locals in None:
			locals = sys._getframe(1).f_locals
		#Update instance dictionary with callables
		self.__dict__.update((key,value) for key,value in locals.items()
			if callable(value))
	#Redirect special methods
	def __len__(self):
		return self.__dict__['__len__']()


#Example use
def Stack():
	items = []
	def push(item):
		items.append(item)
	def pop():
		return items.pop()
	def __len__():
		return len(items)
	return ClosueInstance()

=======================================
