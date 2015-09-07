#运行目录或压缩文件(小脚本到涉及到多个文件的程序)

========================================================================
#当你的程序增长为多个文件时,可以把那些文件放在自己的目录当中并添加一个
#__main__.py文件,例如

myapplication/
	spam.py
	bar.py
	__mian__.py

---------------------

#bar.py
class A:
        def bar(self):
                print('bar')

----------------------------

#spam.py
def spam():
        print('spam')

---------------------------

#__main__.py
import spam,bar

print("hi,I'm main.")

spam.spam()

bar.A.bar(bar)

----------------------------
#这时使用命令行来运行的时候会首先运行__main__.py文件,如

>python3 myapplication

输出

>hi,I'm main.
>spam
>bar
------------------------------
#另一种是将这些文件打包成.zip的压缩文件,同样可在命令行中运行,如
>ls
spam.py bar.py __main__.py
>zip -r myapp.zip *.py
>python3 myapp.zip
-----------------------------

#这仅仅是作为一种代码绑定
#由于目录和zip压缩文件和正常的文件不同,可以使shell脚本执行起来更容易一些
#可以像下面这样执行这个顶层的脚本

#!/usr/bin/env python3 /usr/local/bin/myapp.zip

================================================================
