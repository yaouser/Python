#在字符串的开头或结尾处做文本匹配（例如检查文件的扩展名，URL协议类型等）

#只要使用str.startswith()和str.endswith()
>>>filename = 'spam.txt'
>>>filename.endswith('.txt')
True
>>>filename.startswith('file:')
False
>>>url = 'http://www.python.org'
>>>url.startswith('http:')
True

#如果需要同时针对过个选项检查，只需提供包含可能选项的元组即可。
>>>import os
>>>filenames = os.listdir('.')
>>>filenames
['Makefile','foo.c','bar.py','spam.c','spam.h']
>>>[name for name in filenames if name.endswith(('.c','.h'))]
['foo.c','spam.c','spam.h'
>>>any(name.endswith('.py') for name in filenames)
True

#发散 使用切片和正则 但运行不够快。
>>>filename = 'spam.txt'
>>>filename[-4:] == '.txt'
True
>>>url = 'http://www.python.org'
>>>url[:5] == 'http:' or url[:6] == 'https:' or url[:4] == 'ftp:'
True

>>>import re
>>>url = 'http://www.python.org'
>>>re.match('http:|https:|ftp:',url)

if any(name.endswith(('.c','.h')) for name in listdir(dirname)):

