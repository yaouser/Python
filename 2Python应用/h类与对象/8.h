#子类中扩展property
#在子类中扩展一个property时，因为一个property其实是getter setter和deleter方法
#的集合，而不是单个方法，如果扩展一个property的时候，需先确定是否重新定义所有
#的方法还是之修改其中某一个，如果只想重定义其中一个方法，那只使用@property本
#身是不够的。

================================

第一了一个property

class Person:
	def __init__(self,name):
		self.name = name 

	#Getter function
	@property
	def name(self):
		return self._name

	#Setter function
	@name.setter
	def name(self,value):
		if not isinstance(value, str):
			raise TypeError('Expected a string')
		self._name = value

	#Deleter function
	@name.deleter
	def name(self):
		raise AttributeError("Can't delete attribute")

===============================================================

继承自Person并扩展了name属性的功能

class SubPerson(Person):
	@property
	def name(self):
		print('Getting name')
		return super().name

	@name.setter
	def name(self,value):
		print('Setting name to', value)
		super(SubPerson, SubPerson).name.__set__(self, value)

	@name.deleter
	def name(self):
		print('Deleting name')
		super(SbuPerson, SubPerson).name.__deleter__(self)

===================================================================

如果只扩展property的某一个方法

class SubPerson(Person):
	@Person.name.getter
	def name(self):
		print('Getting name')
		return super().name

或者，只想修改setter方法

class SubPerson(Person):
	@Person.name.setter
	def name(self,value):
		print('Setting name to',value)
		super(SubPerson,SubPerson).name.__set__(self,value)

=====================================================================
