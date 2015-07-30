#定义实现最短匹配的正则表达式
>>>str_pat = re.compile(r'\"(.*)\"')
>>>text1 = 'Computer says "no."'
>>>str_pat.findall(text1)
['no.']
>>>text2 = 'Computer says "no." Phone says "yes."'
>>>str_pat.findall(text2)
['no." Phone says "yes.']
#这里出现了在编写含有句点（.）字符的正则表达式时出现的问题。
#只要在模式中的*操作符后加上?修饰符就可以，这样不会以贪心方式进行，最短匹配。
>>>str_pat = re.compile(r'\"(.*?)\"')
>>>str_pat.findall(text2)
['no.','yes.']
