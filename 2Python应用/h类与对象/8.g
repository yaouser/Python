#调用父类方法
#为了调用父类（超类）的一个方法，可以使用super()函数

class A:
	def spam(self):
		print('A.spam')

class B(A):
	def spam(self):
		print('B.spam')
		super().spam()  #Call parent spam()

======================================================

super()函数的一个常见用法是在__init__()方法中确保父类被正确的初始化

class A:
	def __init__(self):
		self.x = 0

class B(A):
	def __init__(self):
		super().__init)__()
		self.y = 1

==============================================

super()另一个常见用法出现在覆盖Python特殊方法的代码中

class Proxy:
	def __init__(self, obj):
		self._obj = obj

	#Delegate attribute lookup to internal obj
	def __getattr__(self, name):
		return getattr(self._obj, name)

	#Delegate attribute assignment
	def __setattr__(self,name,value):
		if name.startswith('_'):
			super().__setattr__(name,value) # Call original __setattr__
		else:
			setattr(self._obj,name,value)
