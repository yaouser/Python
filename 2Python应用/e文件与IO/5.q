#创建临时文件和文件夹
#tempfile模块 为了创建一个匿名的临时文件，可以使用tempfile.TemporaryFile
#NamedTemporaryFile()有文件名，可以床底给其他代码。
#为了创建一个临时目录，可以使用temfile.TemporaryDirectory()

from tempfile import TemporaryFile

with TemporaryFile('w+t') as f:
	#Read/write to the file
	f.write('Hello World\n')
	f.write('Testing\n')
	
	#Seek back to beginning and read the data
	f.seek(0)
	data = f.read()


f = TemporaryFile('w+t')
f.close()


with TemporaryFile('w+t',encoding='utf-8',errors='ignore') as f:
	...


from tempfile import NamedTemporaryFile
with NamedTemporaryFile('w+t') as f:
	print('filename is:',f.name)
	...

#如果不想将文件删掉可以传递一个关键字参数delte=False即可

with NamedTemporaryFile('w+t',delete=False) as f:
	print('filename is:',f.name)

#创建一个临时的目录

from tempfile import TemporaryDirectory

with TemporaryDirectory() as dirname:
	print('dirname is:',dirname)
