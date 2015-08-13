#定义借口或者抽象基类
#使用abs模块可以很轻松的定义抽象基类
#抽象类的一个特点是不能直接被实例化
#抽象类的目的就是让别的类继承它并实现特定的抽象方法

from abc import ABCMeta, abstractmethod

class IStream(metaclass=ABCMeta):
	@abstractmethod
	def read(self, maxbytes=-1):
		pass

	@abstractmethod
	def write(self,data):
		pass

============

class SocketStream(IStream):
	def read(self,maxbytes=-1):
		pass

	def write(self,data):
		pass

============

抽象基类的一个主要用途是在代码中检查某些类是否为特定类型，实现了特定接口

def serialize(obj,stream):
	if not isinstance(stream,IStream):
		raise TypeError('Expected an IStream')
	pass

===========================

除了继承外，还可以通过注册方法来让某个类实现抽象基类

import io

#REgister the built-n I/O classes as supporting our interface
IStream.register(io.IOBase)

#Open a normal file and type check
f = open('foo.txt')
isinstance(f,IStream) #Returns True

================================================

@abstractmethod还能注解静态方法 类方法和properties，只需要保证这个注解紧靠
#在函数定义前即可

class A(metaclass=ABCMeta):
	@property
	@abstractmethod
	def name(self):
		pass

	@name.setter
	@abstractmethod
	def name(self,value):
		pass

	@classmethod
	@abstractmethod
	def method1(cls):
		pass

	@staticmethod
	@abstractmethod
	def method2():
		pass
