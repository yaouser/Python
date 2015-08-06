#与串行端口的数据通信
#想通过串行端口读写数据，典型场景就是和一些硬件设备打交道（比如机器人和传感器）

#尽管可以通过使用Python内置的I/O模块来完成，但对于串行通信最好的选择是使用第三
#方pySerial包。这个包它提供了对高级特性的支持（比如超时，控制流，缓冲区刷新，
#握手协议等等）。

#注意：所有涉及到串口的I/O都是二进制模式的。

import serial
ser = serial.Serial('/dev/tty.usbmodem641', #Device name varies
			baudrate=9600,
			bytesize=8,
			parity='N',
			stopbits=1)

#一旦端口打开，就可以使用read() readline() write()函数读写数据了，例如

ser.write(b'G1 X50 Y50\r\n')
resp = ser.realline()
