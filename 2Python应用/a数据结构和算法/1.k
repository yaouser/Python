#对切片命名
>>>items = [0,1,2,3,4,5,6]
>>>a = slice(2,4)
>>>items[2:4]
[2,3]
>>>items[a]
[2,3]
>>>items[a] = [10,11]
>>>items
[0,1,10,11,4,5,6]
>>>del items[a]
>>>items
[0,1,4,5,6]

>>>a = slice
>>>a.start
10
>>>a.stop
50
>>>a.step
2
