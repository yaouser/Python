#创建新的类或实例属性
#如果想创建一个全新的实例属性，可以通过一个描述器类的形式来定义它的功能
#一个描述器就是一个实现了三个核心的属性访问操作（get set delete)的类，分别为
#__get__() __set__() __delete__() 这三个特殊的方法。
#为了使用一个描述器，需将这个描述器的实例作为类属性放到类的定义中。

========================================================

描述器的作用是提供类型检查

class Integer:
	def __init__(self,name):
		self.name = name

	def __get__(self,instance, cls):
		if instance is None:
			return self
		else:
			return instance.__dict__[self.name]

	def __set__(self,instance,value):
		if not isinstance(value,int):
			raise TypeError('Expected an int')
		instance.__dict__[self.name] = value

	def __delete__(self,instance):
		del instance.__dict__[self.name]
