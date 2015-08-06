#内存映射的二进制文件（访问它的内容或者原地做些修改）
#使用mmap模块来内存映射文件

import os
import mmap

def memory_map(filename,access=mmap.ACCESS_WRITE):
	size = os.path.getsize(filename)
	fd = os.open(filename,os.O_RDWR)
	return mmap.mmap(fd,size,access=access)

>>>size = 1000000
>>>with open('data','wb') as f:
	f.seek(size-1)
	f.write(b'\x00')

m = memory_map(filename,mmap.ACCESS_READ)

m= memory_map(filename,mmap.ACCESS_COPY)
