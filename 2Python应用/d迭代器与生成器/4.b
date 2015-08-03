#代理迭代
#构建一个自定义容器对象，里面包含有列表，元组或其他可迭代对象。直接在新容器
#对象上执行迭代操作。实际上只需要定义一个__iter__()方法就可以。
#Python的迭代器协议需要__iter__()方法返回一个实现了__next__()方法的迭代器对象

class Node:
	def __init__(self,value):
		self._value = value
		self._children = []

	def __repr__(self):
		return 'Node({!r})'.format(self._value)


	def add_child(self,node):
		self._children.append(node)

	def __iter__(self):
		return iter(self._children)

if __name__ == '__main__':
	root = Node(0)
	child1 = Node(1)
	child2 = Node(2)
	root.add_child(child1)
	root.add_child(child2)

	for ch in root:
		print(ch)
