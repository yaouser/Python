#测试文件或目录是否存在
#使用os.path模块来测试
#使用os.path模块时要考虑到文件权限问题

>>>import os
>>>os.path.exists('/etc/passwd')
True
>>>os.path.exists('/tmp/spam')
False

#测试这个文件是什么类型

>>>#Is a regular file
>>>os.path.isfile('/etc/passwd')
True
>>>#Is a directory
>>>os.path.isdir('/etc/passwd')
False
>>>#Is a symbolic link
>>>os.path.islink('/usr/local/bin/python3')
True
>>>#Get the file linked to 
>>>os.path.realpath('/usr/local/bin/python3')
'/usr/local/bin/python3.3'

#获取元数据（比如文件大小或者修改日期）

>>>os.path.getsize('/etc/passwd')
3669
>>>os.path.getmtime('/etc/passwd')
1272478234.0
>>>import time
>>>time.ctime(os.path.getmtime('/etc/passwd'))
'Wed Apr 28 13:10:34 2010'

