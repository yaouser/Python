#在两个字典中寻找相同点
#要找出两个字典的相同之处，只需通过keys()和items()方法执行常见的集合操作。
#字典的键是支持集合操作的，比如求并集 交集 差集。
a = {
	'x':1,
	'y':2,
	'z':3
}
b = {
	'w':10,
	'x':11,
	'y':2
}
#Find keys in common
a.keys() & b.keys() #{'x','y'}
#Find keys in a that are not in b
a.keys() - b.keys() #{'z'}
#Find(key,value)pairs in commmon
a.items() & b.items() # {('y',2)}
#Make a new dictionary with certain keys removed
c = {key:a[key] for key in a.keys() - {'z','w'}
#c is {'x':1,'y':2}
