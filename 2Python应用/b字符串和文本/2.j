#文本过滤和清理

#使用str.translate()方法。
>>>s = 'python\fis\tawesome\r\n'
>>>s
'python\x0cis\tawesome\r\n'
>>>remap = {
	ord('\t'):' ',
	ord('\f'):' ',
	ord('\r'):None  #Deleted
}
>>>a = s.translate(remap)
>>>a
'python is awesome\n'

def clean_spaces(s):
	s = s.replace('\r','')
	s = s.replace('\t',' ')
	s = s.replace('\f',' ')
return s
