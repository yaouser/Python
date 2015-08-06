#字符串的I/O操作
#使用操作类文件对象的程序来操作文本或二进制字符串
#io.StringIO()用于文本数据 io.BytesIO()用于操作二进制数据

>>>s = io.StringIO()
>>>s.write('Hello World\n')
12
>>>print('This is a test', file=s)
15
>>>#Get all of the data written so far
>>>s.getvalue()
'Hello World\nThis is a test\n'

>>>#Wrap a file interface around an existing string
>>>s = io.StringIO('Hello\nWorld\n')
>>>s.read(4)
'Hell'
>>>s.read()
'o\nWorld\n'

>>>s = io.BytesIO()
>>>s.write(b'binary data')
>>>s.getvalue()
b'binary data'
