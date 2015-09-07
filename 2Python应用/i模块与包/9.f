#重新加载模块

imp.reload()
#当我们在开发代码和debug代码的时候经常会需要重新加载代码,一般在生产环境中是不
#会使用重新加载模块的

===================================================

>>>import spam
>>>import imp
>>>imp.reload(spam)
<module 'spam' from './spam.py'>

====================================================

#但是在使用了像from import的语句时,reload()不会更新原有定义的数据

#例如

#spam.py
def bar():
	print('bar')

def groK():
	print('grok')

-------------------------

>>>import spam
>>>from spam import grok
>>>spam.bar()
bar
>>>grok()
grok

-------------------------
#修改定义
def grok():
	print('New grok')
-------------------------

>>>import imp
>>>imp.reload(spam)
<module 'spam' from './spam.py'>
>>>spam.bar()
bar
>>>grok() #old output
grok
>>>spam.grok() #new output
New grok
========================================================
