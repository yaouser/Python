#在类中定义多个构造器
#为了实现多个构造器，需要使用到类方法
#类方法的一个主要用途就是定义多个构造器。它接受一个class作为第一个参数。
#这个类被用来创建并返回最终的实例。

import time

class Date:
	"""方法一：使用类方法"""
	#Primary constructor
	def __init__(self,year,month,day):
		self.year = year
		self.month = month
		self.day = day
	
	#Alternate constructor
	@classmethod
	def today(cls):
		t = time.localtime()
		return cls(t.tm_year,t.tm_mon,t.tm_mday)

#use

a = Date(2012,12,21) #Primary
b = Date.today() #Alternate

