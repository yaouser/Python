#以不区分大小写的方式对文本做查找和替换
#需要使用re模块并且对各种操作都要加上re.IGNORECASE标记。
>>>text = 'UPPER PYTHON, lower python, Mixed Python'
>>>re.findall('python', text, flags=re.IGNORECASE)
['PYTHON','python','Python']
>>>re.sub('python','snake', text, flags=re.IGNORECASE)
'UPPER snake, lower snake, Mixed snake'
>>>re.sub('python',matchcase('snake'), text, flags=re.IGNORECASE)
'UPPER SNAKE, lower snake, Mixed Snake'
