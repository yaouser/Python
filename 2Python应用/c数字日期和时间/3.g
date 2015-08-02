#无穷大与nan
#正无穷 负无穷 nan(非数字)

>>>a = float('inf')
>>>b = float('-inf')
>>>c = float('nan')
>>>a
inf
>>>b
-inf
>>>c
nan

#为了测试这些值的存在，使用math.isinf() math.isnan()
>>>math.isinf(a)
True
>>>math.isnan(c)
True

#无穷大数在执行数学计算时会传播
>>>a = float('inf')
>>>a + 45
inf
>>>a * 10
inf
>>>10 / a
0.0

>>>a = float('inf')
>>>a/a
nan
>>>b = float('-inf')
>>>a + b 
nan

>>>c = float('nan')
>>>c + 23
nan
>>>c / 2
nan
>>>c * 2
nan
>>>math.sqrt(c)
nan


