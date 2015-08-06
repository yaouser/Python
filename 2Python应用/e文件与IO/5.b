#打印输出至文件中
#将print()函数的输出重定向到一个文件中去。
#在print()函数中指定file关键字参数，但需要注意的就是文件必须是以文本模式打开。
#如果文件是二进制模式的话，打印就会出错。

with open('somefile.txt','rt') as f:
	print('Hello World!',file=f)
