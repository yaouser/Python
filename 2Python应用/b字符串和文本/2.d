#文本模式的匹配和查找
#对于简单的文本模式，使用str.replace()即可，复杂的模式，用re模块中sub()。
>>>text = 'yeah, but no, but yeah, but no, but yeah'
>>>text.replace('yeah','yep')
'yep, but no, but yep, but no, but yep'

#将日期的格式从11/27/2012改写为2012-11-27
#sub()的第一个参数是要匹配的模式，第二个参数是要替换上的模式。类似“\3”这样的
#反斜线加数字的符号代表着模式中捕获组的顺序值。
>>>text = 'Today is 11/27/2012. PyCon starts 3/13/2013.'
>>>import re
>>>re.sub(r'(\d+)/(\d+)/(\d+)',r'\3-\1-\2',text)
'Today is 2012-11-27. PyCon starts 2013-3-13.'
#如果用相同的模式执行重复替换，可以先将模式编译以获得更好的性能。
>>>import re
>>>datepat = re.compile(r'(\d+)/(\d+)/(\d+)')
>>>datepat.sub(r'\3-\1-\2',text)
'Today is 2012-11-27. PyCon starts 2013-3-13.'
#使用re.subn()来获得一共完成了多少次替换。
>>>newtext, n = datepat.subn(r'\3-\1-\2',text)
>>>n
2
