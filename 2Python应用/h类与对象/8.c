#让对象支持上下文管理协议（with语句）
#为了让一个对象兼容with语句，需要实现__enter__()和__exit__()方法。
#当出现with语句的时候，对象的__enter__()方法被触发，它返回的值（如果有的话）会
#被赋值给as声明的变量，然后，with语句块里面的代码开始执行，最后，__exit__()方
#法被触发进行清理工作

#create a network link

from socket import socket,AF_INET,SOCK_STREAM

class LazyConnection:
	def __init__(self,address,family=AF_INET,type=SOCK_STREAM):
		self.address = address
		self.family = family
		self.type = type
		self.sock = None

	def __enter__(self):
		if self.sock is not None:
			raise RuntimeError('Already connected')
		self.sock = socket(self.family,self.type)
		self.sock.connect(self.address)
		return self.sock

	def __exit__(self,exc_ty,exc_val,tb):
		self.sock.close()
		self.sock = None

=========================================================

#上面一次只能允许一个socket连接，如果正在使用一个socket的时候又重复使用with
#语句，就会异常。

#solve

from socket import socket, AF_INET, SOCK_STREAM

class LazyConnection:
    def __init__(self, address, family=AF_INET, type=SOCK_STREAM):
        self.address = address
        self.family = family
        self.type = type
        self.connections = []

    def __enter__(self):
        sock = socket(self.family, self.type)
        sock.connect(self.address)
        self.connections.append(sock)
        return sock

    def __exit__(self, exc_ty, exc_val, tb):
        self.connections.pop().close()

# Example use
from functools import partial

conn = LazyConnection(('www.python.org', 80))
with conn as s1:
    pass
        with conn as s2:
        pass
        # s1 and s2 are independent sockets
