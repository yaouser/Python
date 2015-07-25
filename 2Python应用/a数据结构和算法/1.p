#筛选序列中的元素
#使用列表推导式
>>>mylist = [1,4,-5,10,-7,2,3,-1]
>>>[n for n in mylist if n > 0]
[1,4,10,2,3]
>>>[n for n in mylist if n < 0]
[-5,-7,-1]
