#将名称映射到序列的元素中
#相比普通的元组，collections.namedtuple()命名元组。
#collections.namedtuple()是一个工厂方法，它返回的是Python中标准元组类型的子类
#我们提供相应的字段，它就返回一个可实例化的类，为你已经定义好的字段传入值等。
>>>from collections import namedtuple
>>>Subscriber = namedtuple('Subscriber',['addr','joined'])
>>>sub = Subscriber('jonesy@example.com','2012-10-19')
>>>sub
Subscriber(addr='jonesy@example.com',joined='2012-10-19')
>>>sub.addr
'jonesy@example.com'
>>>sub.joined
'2012-10-19'
>>>len(sub)
2
>>>addr,joined = sub
>>>addr
'jonesy@example.com'
>>>joined
'2012-10-19'

