#给字符串中的变量名做插值处理

#通过字符串format()模拟出来
>>>s = '{name} has {n} messages.'
>>>s.format(name='Guido',n=37)
'Guido has 37 messages.'

#使用format_map()和vars()联合起来使用
>>>name = 'Guido'
>>>n = 37
>>>s.format_map(vars())
'Guido has 37 messages.'

#format()和format_map()的一个缺点则是没法优雅地处理缺少某个值的情况。
