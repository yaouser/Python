#给函数参数增加元信息（给参数加注解）
#函数注解只存储在函数的__annotations__属性中

def add(x:int,y:int)->int:
	return x + y

>>>add.__annotations__
{'y':<class 'int'>,'return':<class 'int'>,'x':<class 'int'>}
