#文件不存在才能写入
#想要一个文件中写入数据，但是前提是必须是这个文件在文件系统上不存在，即不允许
#覆盖已存在的文件内容。
#在open()函数中使用x模式来代替w模式 wt xt wb xb

>>>with open('somefile','wt') as f:
	f.write('Hello\n')
>>>with open('somefile','xt') as f:
	f.write('Hello\n')
error
