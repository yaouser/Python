#使用其他分隔符或行终止符打印
#可以在print()函数中使用sep和end关键字参数

>>>print('ACME',50,91.5)
ACME 50 91.5
>>>print('ACME',50,91.5,sep=',')
ACME,50,91.5
>>>pirnt('ACME',50,91,5,sep=',',end='!!\n')
ACME,50,91.5!!

#使用end参数可以输出中禁止换行

>>>for i in range(5):
	print(i)
0
1
2
3
4
>>>for i in range(5):
	print(i,end=' ')
0 1 2 3 4 >>>

#str.join()必须是字符串

>>>print(','.join('ACME','50','91.5'))
ACME,50,91.5

>>>row = ('ACME',50,91.5)
>>>print(','.join(row))
error
>>>print(','.join(str(x) for x in row))
ACME,50,91.5

