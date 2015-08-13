#在类中封装属性名
#两种不同的编码约定（单下划线和双下划线）来命名私有属性，非公共名称以单下划线
#开头，当代码会涉及到子类，并且有些内部属性应该在子类中隐藏，应考虑双下划线。

class A:
	def __init__(self):
		self._internal = 0 # An internal attribute
		self.public = 1 # A public attribute

	def public_method(self):
		'''
		A public method
		'''
		pass

	def _internal_method(self):
		pass

=======================================

class B:
	def __init__(self):
		self.__private = 0 

	def __private_method(self):
		pass

	def public_method(self):
		pass
		self.__private_method()

=========================================

class C(B):
	def __init__(self):
		super().__init__()
		self.__private = 1 #Does not override B.__private

	#Does not override B.__private_method()
	def __private_method(self):
		pass
