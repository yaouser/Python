=============================================================================
#安装私有的包
#创建新的Python环境(为了不改变系统Python来自己安装第三方包)
#分发包
=============================================================================
#安装私有包
#需要系统权限 如果只是安装给自己使用的话,可以在命令行中使用--user选项
#这样会安装在本用户权限目录中的隐藏目录中~/.local/lib/python3.4/site-packages
#--user选项是为在没有权限的情况下安装第三方包 另一种是使用Python新环境

python3 setup.py install --user

or

pip install --user packagename

=============================================================================
#创建Python新环境

>pyvenv Spam
>cd Spam
>ls
bin include lib lib64 pyvenv.cfg
>Spam/bin/python3
Python 3.4.3 (default, Mar 26 2015, 22:03:40) 
[GCC 4.9.2] on linux
Type "help", "copyright", "credits" or "license" for more information. 
>>> from pprint import pprint
>>> import sys
>>> pprint(sys.path)
['',
'/usr/local/lib/python34.zip',
'/usr/local/lib/python3.4',
'/usr/local/lib/python3.4/plat-darwin',
'/usr/local/lib/python3.4/lib-dynload',
'/Users/beazley/Spam/lib/python3.4/site-packages']
>>>
-----------------------------------------------------
#这样建立的Python虚拟环境第三方包一个包都没有即系统完全分离了,如果要包含系统
#中的第三方包,可以使用--system-site-packages选项

>pyvenv --system-site-packages Spam

===========================================================================
#分发包
#自己写了一个包,想要打包分享给其他人

-----------------------------
#这个包的架构目录为

projectname/
	README.txt
	Doc/
		documentation.txt
	projectname/
		__init__.py
		foo.py
		bar.py
		utils/
			__init__.py
			spam.py
			grok.py
	examples/
		helloworld.py
		...

----------------------------------------

#为了使包有自己的版本信息,首先写一个如下的setup.py文件

#setup.py
from distutils.core import setup
setup(name='projectname',
	version='1.0',
	author='Your Name',
	author_email='you@youraddress.com',
	url='http://www.you.com/projectname',
	packages=['projectname','projectname.utils'],
)

#接下来制作一个文件MANIFEST.in,列出在你的包中需要包含的非源码文件

#MANIFEST.in
include *.txt
recursive-include examples *
recursive-include Doc *

#要确保setup.py MANIFEST.in文件在包的顶级目录里

------------------------------------------------

#一旦上述工作做完就可以制作分发包了

python3 setup.py sdist

--------------------------------------

#有用的命令还有

python3 setup.py build 		#编译
python3 setup.py install	#安装
python3 setup.py sdist		#制作分发包
python3 setup.py bdist_wininst	#制作windows下的分发包
python3 setup.py bdist_rpm

============================================================================
