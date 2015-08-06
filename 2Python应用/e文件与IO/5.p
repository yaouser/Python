#将字节写入文本文件
#在文本模式打开的文件中写入原始的字节数据，将字节数据直接写入文件的缓冲区即可
#类似的，能够通过读取文本文件的buffer属性来读取二进制数据。

>>>import sys
>>>sys.stdout.write(b'Hello\n')
error
>>>sys.stdout.buffer.write(b'Hello\n')
Hello
5
