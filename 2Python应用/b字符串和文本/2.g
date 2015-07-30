#编写多行模式的正则表达式
#用正则表达式对一段文本块做匹配，希望在进行匹配是能够跨越多行。
#这个问题一般出现在希望使用句点（.）来匹配任意字符，但是忘记句点并不能匹配换
#行符。

#我们把匹配C语言风格的注释作为一个例子。
>>>comment = re.compile(r'/\*(.*?)\*/')
>>>text1 = '/* this is a comment */'
>>>text2 = '''/* this is a 
...		multiline comment */
...'''
>>>comment.findall(text1)
['this is a comment ']
>>>comment.findall(text2)
[]
#可以添加对换行符的支持。
>>>comment = re.compile(r'/\*((?:.\n*?)\*/')
>>>comment.findall(text2)
[' this is a\n    	multiline comment ']
#(?:.|\n)指定了一个非捕获组（即，这个组是做匹配但不捕获结果，也不会分配组号。

#re.compile()可接受re.DOTALL。这使得正则表达式中的句点（.)可以匹配所有的字符
#也包括换行符。
>>>comment = re.compile(r'/\**.*?)\*/',re.DOTALL)
>>>comment.findall(text2)
[' this is a\n		multiline comment ']
