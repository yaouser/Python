#创建可管理的属性
#自定义某个属性的一种简单方法是将它定义为一个property。

class Person:
	def __init__(self,first_name):
		self.first_name = first_name

	#Getter function
	@property
	def first_name(self):
		return self._first_name

	#Setter function
	@first_name.setter
	def first_name(self,value):
		if not isinstance(value,str):
			raise TypeError('Expected a string')
		self._first_name = value

	#Deleter function (optional)
	@first_name.delete
	def first_name(self):
		raise AttributeError("Can't delete attribute")

===============================================================

上述三个相关联的方法，这三个方法的名字都必须一样。第一个方法是一个getter函数，
它使得first_name成为一个属性。其他两个方法给first_name属性添加了setter和deleter
函数。需要强调的是只有在first_name属性被创建后，后面的两个装饰器@first_name.setter
和@first_name.deleter才能被定义。

property的一个关键特征是它看上去跟普通的attribute没什么两样，但是访问它的时候
会自动触发getter setter和deleter方法。

==============================================================

能在已存在的get和set方法基础上定义propertry


class Person:
	def __init__(self, first_name):
		self.set_first_name(first_name)

	#Getter function
	def get_first_name(self):
		return self._first_name

	#Setter function
	def set_first_name(self,value):
		if not isinstance(value,str):
			raise TypeError('Expected a string')
		self._first_name = value

	#Deleter function (optional)
	def del_first_name(self):
		raise AttributeError("Can't delete attribute")

	#Make a property from existing get/set methods
	name = property(get_first_name,set_first_name,del_first_name)
