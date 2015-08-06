#读取二进制数据到可变缓冲区中
#readinto()方法用来为预先分配内存的数组填充数据
#memoryview()可以通过复制的方式对以存在的缓冲区执行切片操作，甚至修改它的内容

record_size = 32 #Size of each record(adjust value)
buf = bytearrray(record_size)
with open('somefile','rb') as f:
	while True:
		n = f.readinto(buf)
		if n < record_size:
			break
		#Use the contents of buf

>>>buf 
bytearray(b'Hello World')
>>>m1 = memoryview(buf)
>>>m2 = m1[-5:]
>>>m2
<memory at 0x100681390>
>>>m2[:] = b'WORLD'
>>>buf
bytearray(b'Hello WORLD')

