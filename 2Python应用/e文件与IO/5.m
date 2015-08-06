#获取文件夹中的文件列表
#使用os.listdir()函数来获取某个目录中的文件列表

import os
names = os.listdir('somedir')

#结果返回file subdir symblink等等，如果需要过滤数据，可以使用os.path的列表推导

import os.path
#Get all regular files
names = [name for name in os.listdir('somedir')
	if os.path.isfile(os.path.join('somedir',name))]
#Get all dirs
dirnames = [name for name in os.listdir('somedir')
	if os.path.isdir(os.path.join('somedir',name))]

#字符串的startswith()和endswith()方法对于过滤一个目录的内容

pyfiles = [name for name in os.listdir('somedir')
	if name.endswith('.py')]

#对于文件名的匹配，考虑使用glob或fnmatch模块

import glob
pyfiles = glob.glob('somedir/*.py')

from fnmatch import fnmatch
pyfiles = [name for name in os.listdir('somedir')
	if fnmatch(name,'*.py')]

#使用os.path模块中的函数或者os.stat()函数来收集数据

#Example of getting a directory listing

import os 
import os.path
import glob

pyfiles = glob.glob('*.py')

#Get file sizes and modification dates

name_sz_date = [(name,os.path.getsize(name),os.path.getmtime(name))
		for name in pyfiles]
for name,size,mtime in name_sz_date:
	print(name,size,mtime)

#Alternative:Get file metadata

file_metadata = [(name,os.stat(name)) for name in pyfiles]
for name,meta in file_metadata:
	print(name,meta.st_seze,meta.st_mtime)
