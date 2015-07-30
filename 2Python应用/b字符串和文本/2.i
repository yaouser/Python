#从字符串中去掉不需要的字符
#strip()方法可用来从字符串的开始和结尾处去掉字符。lstrip()和rstrip()可分别从
#左或从右侧开始执行去除字符的操作。默认情况下这些方法去除的是空格符。但是可以
#指定其他的字符。
>>>s = ' hellow world \n'
>>>s.strip()
'hello world'
>>>s.lstrip()
'hello world \n'
>>>s.rstrip()
' hello world'

>>>t = '-----hello====='
>>>t.lstrip('-')
'hello====='
>>>t.strip('-=')
'hello'

#去除位于字符串中间的字符
>>>s = ' hello   world    \n'
>>>s = s.strip()
>>>s
'hello     world'
>>>s.replace('   ','')
'helloworld'
>>>import re
>>>re.sub('\s+',' ',s)
'hello world'

with open(filename) as f:
lines = (line.strip() for line in f)
for line in lines:
	...
