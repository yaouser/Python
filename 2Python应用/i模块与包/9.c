#使用相对路径名导入包中子模块

===================================
例如:
mypackage/
	__init__.py
	A/
		__init__.py
		spam.py
		grok.py
	B/
		__init__.py
		bar.py

#假如mypackage.A.spam想要导入相同目录中的grok,可以这样

#mypackage/A/spam.py
from . import grok

#假如想要导入不同目录中的模块B.bar,可以这样
#注意不支持导入上层目录

#mypackage/A/spam.py
from ..B import bar

#mypackage/A/spam.py
from mypackage.A import grok #ok
from . import grok #ok
import grok #Error(not found)

#mypackage/A/spam.py
from . import grok #ok
import .grok #Error

===============================

#注意在简单的模块顶层目录的脚本和命令行中是不支持相对路径名导入模块的

%python3 mypackage/A/spam.py #Relative imports fail

#如果在命令行中加入-m选项是可以的

%python3 -m mypackage.A.spam #Relative imports work
