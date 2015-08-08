#编码和解码十六进制数
#binascii base64

#b2a_hex() a2b_hex()

>>>#Initial byte string
>>>s = b'hello'
>>>#Encode as hex
>>>import binascii
>>>h = binascii.b2a_hex(s)
>>>h
b'68656c6c6f'
>>>#Decode back to bytes
>>>binascii.a2b_hex(h)
b'hello'

#b64encode() b64decode()

>>>import base64
>>>h = base64.b16encode(s)
>>>h
b'68656c6c6f'
>>>base64.b16decode(f)
b'hello'
