#利用Shell通配符做字符串匹配
#当工作在UNIX Shell下时，想使用常见的通配符模式（*.py Dat[0-9]*.csv）
#fnmatch模块提供了两个函数fnmatch()和fnmatchcase()
#fnmatch()区分大小写 fnmatchcase()不去分大小写
#如果实际上想编写匹配文件名的代码，那应该使用glob模块来实现
>>>from fnmatch import fnmatch.fnmatchcase
>>>fnmatch('foo.txt','*.txt')
True
>>>fnmatchcase('foo.txt','*.TXT')
False
>>>fnmatch('foo.txt','?oo.txt')
True
>>>fnmatch('Dat45.csv','Dat[0-9]*')
True
>>>names = ['Dat1.csv','Dat2.csv','config.ini','foo.py']
>>>[name for name in if fnmatch(name,'Dat*.csv')]
['Dat1.csv','Dat2.csv']
