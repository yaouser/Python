#分数运算
#fractions模块可以被用来执行包含分数的数学运算。
>>>from fractions import Fraction
>>>a = Fraction(5,4)
>>>b = Fraction(7,16)
>>>print(a + b) 
27/16
>>>print(a * b)
35/64

>>>c = a * b
>>>c.numerator
35
>>>c.denominator
64

#converting to a float
>>>float(c)
0.546875

#limiting the denominator of a value
>>>print(c.limit_denominator(8))
4/7

#converting a float to a fraction
>>>x = 3.75
>>>y = Fraction(*x.as_integer_ration())
>>>y
Fraction(15,4)
