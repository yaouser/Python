#定义有默认参数的函数
#直接在函数定义中给参数指定一个默认值
#如果默认参数是一个可修改的容器比如一个列表，集合或者字典，可以使用None

def spam(a,b=42):
	print(a,b)

spam(1) #a=1,b=42
spam(1,2)#a=1,b=2

#Using a list as a default value
def spam(a,b=None):
	if b is None:
		b = []
