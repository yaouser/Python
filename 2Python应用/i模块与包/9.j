#通过字符串名导入模块

#不使用import语句,在Python代码中使用importlib.import_module()

==============================================================

>>>import importlib
>>>math = importlib.import_module('math')
>>>math.sin(2)
0.9092974258256817
>>>mod = importlib.import_module('urllib.request')
>>>u = mod.urlopen('http://www.python.org')

=====================================================

#假如工作在包目录中,import_mudule()也能使用平台的相对导入
#但是需要额外的给一个参数

import importlib
#Same as 'from . import b'
b = importlib.import_mudule('.b',__package__)

======================================================

#这个在我们通常的生产代码中不会使用,一般在我们扩展代码时,编写了自己的初期的代
#码模块,不够完善的时候,用这种方法将代码包裹起来引入使用

==============================================================
