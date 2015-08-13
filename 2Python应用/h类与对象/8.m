#利用Mixins扩展类功能
#有很多有用的方法，想使用它们来扩展其他类的功能。但是这些类并没有任何继承的
#关系。因此不能简单的将这些方法放入一个基类，然后被其他类继承。
#可能某个库提供了一些基础类，可以利用它们来构造自己的类。

class LoggedMappingMixin:
	"""
	Add logging to get/set/delete operations for debugging.
	"""
	__slots__ = () #混入类都没有实例变量，因为直接实例化混入类没有任何意义

	def __getitem__(self,key):
		print('Getting ' + str(key))
		return super().__getitem__(key)

	def __setitem__(self,key,value):
		print('Setting {} = {!r}'.format(key,value))
		return super().__setitem__(key,value)

	def __delitem__(self,key):
		print('Deleting ' + str(key))
		return super().__delitem__(key)


class SetOnceMappingMixin:
    '''
    Only allow a key to be set once.
    '''
    __slots__ = ()

    def __setitem__(self, key, value):
        if key in self:
            raise KeyError(str(key) + ' already set')
        return super().__setitem__(key, value)


class StringKeysMappingMixin:
    '''
    Restrict keys to strings only
    '''
    __slots__ = ()

    def __setitem__(self, key, value):
        if not isinstance(key, str):
            raise TypeError('keys must be strings')
        return super().__setitem__(key, value)

#这些类单独使用起来没有任何意义，事实上如果你去实例化任何一个类，除了产生异常
#外没任何作用。它们是用来通过多继承来和其他映射对象混入使用的。

#user

class LoggedDict(LoggedMappingMixin, dict):
    pass

d = LoggedDict()
d['x'] = 23
print(d['x'])
del d['x']

from collections import defaultdict

class SetOnceDefaultDict(SetOnceMappingMixin, defaultdict):
    pass


d = SetOnceDefaultDict(list)
d['x'].append(2)
d['x'].append(3)
# d['x'] = 23  # KeyError: 'x already set'

#可以看到混入类跟其他已存在的类(比如dict、defaultdict和OrderedDict)结合起来
#使用，一个接一个。 结合后就能发挥正常功效了。

#混入类也是多继承的一个主要用途
#对于混入类，有几点需要记住。首先是，混入类不能直接被实例化使用。 其次，混入
#类没有自己的状态信息，也就是说它们并没有定义 __init__() 方法，并且没有实例
#属性。 这也是为什么我们在上面明确定义了 __slots__ = () 。
