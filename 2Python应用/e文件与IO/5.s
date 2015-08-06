#序列化Python对象
#将Python对象序列化为一个字节流，一遍它保存到一个文件，存储到数据库或者通过
#网络传输它。
#对于序列化普遍的做法就是使用pickle模块。
#将一个对象转储为一个字符串，可以使用pickle.dumps()
#从字节流中回复一个对象，使用pickle.load()或pickle.loads()函数

import pickle

data = ... #Some Python object
f = open('somefile','wb')
pickle.dump(data,f)

==================================

s = pickle.dumps(data)

==================================

#Restore from a file
f = open('somefile','rb')
data = pickle.load(f)

#Restore from a string
data = pickle.loads(s)

#如果要处理多个对象，也依然有效

>>>import pickle
>>>f = open('somedata','wb')
>>>pickle.dump([1,2,3,4],f)
>>>pickle.dump('hello',f)
>>>pickle.dump({'Apple','Pear','Banana'},f)
>>>f.close()
>>>f = open('somedata','rb')
>>>pickle.load(f)
[1,2,3,4]
>>>pickel.load(f)
'hello'
>>>pickle.load(f)
{'Apple','Pear','Banana'}

