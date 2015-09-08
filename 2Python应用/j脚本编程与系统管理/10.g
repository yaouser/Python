#复制或者移动文件和目录
#模块shutil(shell util)

----------------------------------------

import shutil
shutil.copy(src,dst)		//cp src dst
shutil.copy2(src,dst)		//cp -p src dst 保存元数据
shutil.copy2(src,dst,follow_symlinks=False)
shutil.copytree(src,dst)	//cp -R src dst 复制目录树
shutil.copytree(src,dst,sysmlinks=True)
shutil.move(src,dst)		//mv src dst

-------------------------------------------------

def ignore_pyc_files(dirname,filenames):
	return [name in filenames if name.endswith('.pyc')]
shutil.copytree(src,dst,ignore=ignore_pyc_files)

-------------------------------------------------

shutil.copytree(src,dst,ignore=shutil.ignore_patterns('~','.pyc'))

----------------------------------------------------------------------

>>> filename = '/Users/guido/programs/spam.py'
>>> import os.path
>>> os.path.basename(filename)
'spam.py'
>>> os.path.dirname(filename)
'/Users/guido/programs'
>>> os.path.split(filename)
('/Users/guido/programs', 'spam.py')
>>> os.path.join('/new/dir', os.path.basename(filename))
'/new/dir/spam.py'
>>> os.path.expanduser('~/guido/programs/spam.py')
'/Users/guido/programs/spam.py'

-------------------------------------------------------------

try:
	shutil.copytree(src, dst)
except shutil.Error as e:
	for src, dst, msg in e.args[0]:
		print(dst,src,msg)

# src is source name 
# dst is destination name 
# msg is error message from exception 

--------------------------------------------------------
