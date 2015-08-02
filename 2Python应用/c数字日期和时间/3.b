#执行精确的浮点数运算
#如果想更加精确（并容忍一定的性能损耗），可以使用decimal模块。

>>>from decimal import Decimal
>>>a = Decimal('4.2')
>>>b = Decimal('2.1')
>>>a + b 
Decimal('6.3')
>>>print(a + b)
6.3
>>>(a + b) == Decimal('6.3')
True

#decimal模块允许你控制计算机的每一方面

>>>from decimal import localcontext
>>>a = Decimal('1.3')
>>>b = Decimal('1.7')
>>>print(a/b)
0.7647058823529411764705882353
>>>with localcontext() as ctx:
	ctx.prec = 3
	print(a/b)
0.765
>>>with localcontext() as ctx:
	ctx.prec = 50
	print(a/b)
0.76470588235294117647058823529411764705882352941176
