#创建大量对象时节省内存方法
#对于用来当成简单的数据结构而言，可以通过给类添加__solots__属性来极大的减少所
#占的内存，使用solots不好的地方就是我们不能再给实例添加新的属性了，只能使用在
#__slots__中定义的那些属性名。
#定义了slots后的类不再支持一些普通类特性了，比如多继承。大多数情况下，你应该
#只在那些经常别使用到的用作数据结构的类上定义slots（比如在程序中需要创建某个类
#的几百万个实例对象）

class Date:
	__slots__ = ['year','month','day']
	def __init__(self,year,month,day):
		self.year = year
		self.month = month
		self.day = day
