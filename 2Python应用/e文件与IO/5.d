#读写字节数据
#想要读写二进制文件，比如图片，声音文件等等。
#使用rb wb的模式open()函数来读取或写入二进制数据

#Read the entire file as a single byte string
with open('somefile.bin','rb') as f:
	data = f.read()

#Write binary data to a file
with open('somefile.bin','wb') as f:
	f.write(b'Hello World')

>>>#Text string
>>>t = 'Hello World'
>>>t[0]
'H'
>>>for c in t:
	print(c)
H
e
l
l
o

>>>#Byte string
>>>b = b'Hello World'
>>>b[0]
72
>>>for c in b:
	print(c)
72
101
108
108
111

#想从二进制模式的文件中读取或写入文本数据，必须确保要进行解码和编码操作

with open('somefile.bin','rb') as f:
	data = f.read(16)
	text = data.decode('utf-8')

with open('somefile.bin','wb') as f:
	text = 'Hello World'
	f.write(text.encode('utf-8'))


