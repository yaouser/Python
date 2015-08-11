#将单方法的类转换为函数
#一个除__init__()方法外只定义了一个方法的类，可以将其转换成一个函数。
#大部分情况下，拥有一个单方法类的原因是需要存储某些额外的状态来给方法使用。
#使用一个内部函数或者闭包的方案会优雅一些。一个闭包就是一个函数，只不过在函数
#内部带上了一个额外的变量环境。闭包关键特点就是它会记住自己被定义时的环境。

from urllib.request import urlopen

class UrlTemplate:
	def __init__(self,template):
		self.template = template

	def open(self,**kwargs):
		return urlopen(self.template.format_map(kwargs))

=================================================================

def urltemplate(template):
	def opener(**kwargs):
		return urlopen(template.format_map(kwargs))
	return opener

#opener()函数记住了template参数的值，并在接下来的调用中使用它。
