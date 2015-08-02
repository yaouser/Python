#字符串转换为日期

>>>from datetime import datetime
>>>text = '2012-09-20'
>>>y = datetime.strptime(text,'%Y-%m-%d')
>>>z = datetime.now()
>>>diff = z - y

#结合时区的日期操作
#对几乎涉及到时区的问题，都应该使用pytz模块。
#pytz模块主要用途是将datetime库创建的简单日期对象本地化。

>>>from datetime import datetime
>>>from pytz import timezone
>>>d = datetime(2012,12,21,9,30,0)
>>>print(d)
2012-12-21 09:30:00

#本地时间
>>>central = timezone('US/Central')
>>>loc_d = central.localize(d)
>>>print(loc_d)
2012-12-21 09:30:00-06:00
#日期被本地化就可以转换为其他时区的时间了
#Convert to Bangalore time
>>>bang_d = loc_d.astimezone(timezone('Asia/Kolkata'))
>>>print(bang_d)
2012-12-21 21:00:00+05:30

#处理本地化日期通常的策略先将所有日期转换为UTC时间，并用它来执行所有的中间
#存储和操作。这样就不用担心跟夏令时相关的问题了。

>>>print(loc_d)
2013-03-10 01:45:00-06:00
>>>utc_d = loc_d.astimezone(pytz.utc)
>>>print(utc_d)
2013-03-10 07:45:00+00:00

>>>later_utc = utc_d + timedelta(minutes=30)
>>>print(later_utc.astimezone(central))
2013-03-10 03:15:00-05:00

>>>pytz.country_timezones['IN']
['Asia/Kolkata']
