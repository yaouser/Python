#带额外状态信息的回调函数
#代码中需要依赖到回调函数的使用（比如事件处理器，等待后台任务完成后的回调等）
#并且还需要回调函数拥有额外的状态值，一边在它的内部使用到。
#这些出现在很多函数库和框架中的回调函数，特别是跟异步处理有关。

def apply_async(func,args,*,callback):
	#Compute the result
	result = func(*args)

	#Invoke the callback with the result
	callback(result)

===================================================
这段代码可以做更高级的处理，包括线程，进程和定时器
===================================================

>>>def print_result(result):
	print('Got:',result)

>>>def add(x,y):
	return x + y

>>>apply_async(add,(2,3),callback=print_result)
Got:5
>>>apply_async(add,('hello','world'),callback=print_result)
Got:helloworld

===========================================================

#1 为了让回调函数访问外部信息，一种方法是使用一个绑定方法来代替一个简单函数。

class ResultHandler:

	def __init__(self):
		self.sequence = 0 

	def handler(slef,result):
		self.sequence += 1
		print('[{}] Got:{}'.format(self.sequence,result))

#use
>>>r = ResultHandler()
>>>apply_async(add,(2,3),callback=r.handler)
[1]Got:5
>>>apply_async(add,('hello','world'),callback=r.handler)
[2]Got:helloworld

===============================================================

#2 可以使用一个闭包捕获状态值

def make_handler():
	sequence = 0
	def handler(result):
		nonlocal sequence
		sequence += 1
		print('[{}]Got:{}'.format(sequence,result))
	return handler

#use
>>>handler = make_handler()
>>>apply_async(add,(2,3),callback=handler)
[1]Got:5
>>>apply_async(add,('hello','world'),callback=handler)
[2]Got:helloworld

===============================================================

#3 使用协程来完成

def make_handler():
	sequence = 0
	while True:
		result = yield
		sequence += 1
		print('[{}]Got:{}'.format(sequence,result))

#use 需要使用它的send()方法作为回调函数

>>>handler = make_handler()
>>>next(handler) #Advance to the yield
>>>apply_async(add,(2,3),callback=handler.send)
[1]Got:5
>>>apply_async(add,('hello','world'),callback=handler.send)
[2]Got:helloworld

