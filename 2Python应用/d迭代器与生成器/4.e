#反向迭代
#__reversed__()方法 reversed()函数

>>>a = [1,2,3,4]
>>>for x in reversed(a):
	print(x)

f = open('somefile')
for line in reversed(list(f)):
	print(line,end='')

#可以通过实现自定义类上的__reversed__()方法来实现反向迭代。
class Countdown:
	def __init__(self,start):
		self.start = start
	#iter
	def __iter__(self):
		n = self.start
		while n > 0:
			yield n
			n -= 1
	#reverse iter
	def __reversed__(self):
		n = 1
		while n <= self.start:
			yield n 
			n += 1

for rr in reversed(Countdown(30)):
	print(rr)
for rr in Countdown(30):
	print(rr)
