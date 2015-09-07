#将文件夹加入到sys.path

#不在sys.path变量中的目录python代码不能够被导入

=====================================================

#有两种方法,一种是将新目录添加到sys.path中
#通过使用PYTHONPATH环境变量即可
#这种方法可以在程序启动时或者一个shell脚本中设置这个环境变量

>env PYTHONPATH=/some/dir:/other/dir python3
Python 3.4.3 (default, Mar 26 2015, 22:03:40) 
[GCC 4.9.2] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>import sys
>>>sys.path
['', '/some/dir', '/other/dir', ...]

===========================================

#另一种方法是创建一个a.pth文件,这个文件中包含我们需要导入的临时目录
#并且文件需要放在python的site-packages目录,这样python解释器才会加载临时目录
#解释器会将我们列出的目录加进sys.path中

#myapplication.pth
/some/dir
/other/dir

====================================================

#尽管如下方法也能奏效,但是一旦改变了目录就不行了,这给我们维护代码带来了困难

import sys
sys.path.insert(0,'/some/dir')
sys.path.insert(0,'/other/dir')

#可以使用模块的变量__file__来是这种方式稍微好一点

import sys
from os.path import abspath,join,dirname
sys.path.insert(0,abspath(dirname('__file__'),'src'))

#注意src目录,在相同目录先添加一个src目录来作为代码执行插入步骤

==================================================================
