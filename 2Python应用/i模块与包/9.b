#精确控制模块被全部导入的内容

===============================
#通过在自己模块中定义__all__一个变量,这个变量列出被导入的名字

#somemodule.py

def spam():
	pass

def grok():
	pass

blah = 42
#Only export 'spam' and 'grok'
__all__ = ['spam','grok']

====================================

#尽管可以使用import *可以将全部的函数导入,但是如果函数非常多却有许多函数用不
#到的话,使用__all__就非常的方便

#一旦定义了__all__了一个空的列表的话,没有任何东西被导出
#一旦在__all__中出现了未定义的名字就会引起错误
