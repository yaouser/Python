#字节到大整数的打包与解包
#大整数和字节之间的转化操作并不常见，在一些领域，比如密码学或者网络。
#x.from_bytes() x.to_bytes() struct模块 
>>>data = b'\x00\x124\/\x00x\xab\x00\xcd\xef\x01\x00#\x004'
>>>len(data)
16
>>>int.from_bytes(data,'little')
69120565665751139577663547927094891008
>>>int.from_bytes(data,'big')
94522842520747284487117727783387188

>>> x = 94522842520747284487117727783387188
>>> x.to_bytes(16, 'big')
b'\x00\x124V\x00x\x90\xab\x00\xcd\xef\x01\x00#\x004'
>>> x.to_bytes(16, 'little')
b'4\x00#\x00\x01\xef\xcd\x00\xab\x90x\x00V4\x12\x00'

#利用struct模块来解压对于整数的大小是有限制的，复原结果如下

>>> data
b'\x00\x124V\x00x\x90\xab\x00\xcd\xef\x01\x00#\x004'
>>> import struct
>>> hi, lo = struct.unpack('>QQ', data)
>>> (hi << 64) + lo
94522842520747284487117727783387188

#字节顺序（little或big）仅仅指定了构建整数时的字节的低位高位排列方式
>>>x = 0x01020304
>>>x.to_bytes(4,'big')
b'\x01\x02\x03\x04'
>>>x.to_bytes(4,'little')
b'\x04\x03\x02\x01'


