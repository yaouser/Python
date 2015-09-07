#将模块分割成多个文件

============================
#例如有这样的文件,想将其分割开来

#mymodule.py
class A:
	def spam(self):
		print('A.spam')

class B(A):
	def bar(self):
		print('B.bar')

===================================
#分割成这样的目录

mymodule/
	__init__.py
	a.py
	b.py

--------------------

#a.py
class A:
	def spam(self):
		print('A.spam')

#b.py
from .a import A
class B(A):
	def bar(self):
		print('B.bar')

#__init__.py
from .a import A
from .b import B

======================================

#虽然通过这样可以工作,但是记忆太多的目录也是一种负担

from mymodule.a import A
from mymodule.b import B

#这样就可以了

from mymodule import A, B

#注意是通过建立目录和__init_.py文件将分散的文件粘和在一起了

================================================================

#这里有一个稍微变化的__init__.py文件,上面的__init__.py文件将所有的都一次性的
#导入了,但是,对于一个庞大的模块,导入我们所需的组件就足够了
#这个__init__.py会很好的工作的

#__init__.py
def A():
	from .a import A
	return A()

def B():
	from .b import B
	return B()
