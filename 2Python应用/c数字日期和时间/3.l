#基本的日期与时间转换
#datetime模块

>>>from datetime import timedelta
>>>a = timedelta(days=2, hours=6)
>>>b = timedelta(hours=4.5)
>>>c = a + b
>>>c.days
2
>>>c.seconds
37800
>>>c.seconds / 3600
10.5
>>>c.total_seconds() / 3600 
58.5

>>>from datetime import datetime
>>>a = datetime(2012,9,23)
>>>print(a + timedelta(days=10))
2012-10-03 00:00:00
>>>b = datetime(2012,12,21)
>>>d = b - a
>>>d.days
89
>>>now = datetime.today()
>>>print(now)
2012-12-21 14:54:43.094063
>>>print(now + timedelta(minutes=10))
2012-12-21 15:04:43.094063
