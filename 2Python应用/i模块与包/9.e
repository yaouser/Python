#利用命名空间导入目录分散的代码(插件 框架扩展)

#名称空间包特征
#有很多的不同人维护的分散的一堆代码,每一部分都像包一样被组织在一个目录中
#需要将所有部分在一个通用前缀包下将其组合在一起

===============================================
#来展示一下,例如有如下

foo-package/
	spam/
		blah.py

bar-package/
	spam/
		grok.py

#注意在每一个目录中都没有__init__.py文件

#通过添加foo-package和bar-package到Python模块路径中来解决实现
#名称空间包特征

>>>import sys
>>>sys.path.extend(['foo-package','bar-package'])
>>>import spam.blah
>>>import spam.grok

=================================

#名称空间包特征被设计在一个通用名字空间下来合并不同的代码目录
#对于一个大型的框架,它允许框架的一部分来分别的下载安装第三方的加载项,它也允许
#人们为这样的框架开发插件

#通用名字空间的顶层目录没有__init__.py文件

>>>import spam
>>>spam.__path__
_NamespacePath(['foo-package/spam','bar-package/spam'])

-------------------------------------------------------

#假如你有自己的目录如下(我们只用写custom.py文件就能开发插件)

my-package/
	spam/
		custom.py

>>>import spam.custom
>>>import spam.grok
>>>import spam.blah
=======================================================================
