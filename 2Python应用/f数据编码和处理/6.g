#与关系型数据库的交互
#Python标准库中是sqlite3模块。如果使用的是一个不同的数据库（mysql，postgresql
#或者ODBC），需要安装相应的第三方模块。
stocks = [
	('GOOG',100,490.1),
	('AAPL',50,545.75),
	('FB',150,7.45),
	('HPQ',75,33.2),
]

#连接到数据库 使用connect()函数

>>>import sqlite3
>>>db = sqlite3.connect('database.db')

#下面需要创建一个游标 一旦有了游标就可以执行SQL查询语句了

>>>c = db.cursor()
>>>c.execute('create table portfolio (symbol text, shares integer,price real)')
<sqlite3.Cursor object at 0x10067a730>
>>>db.commit()

#向数据库中插入多条记录

>>> c.executemany('insert into portfolio values (?,?,?)', stocks)
<sqlite3.Cursor object at 0x10067a730>
>>> db.commit()

#执行某个查询

>>> for row in db.execute('select * from portfolio'):
...     print(row)
...
('GOOG', 100, 490.1)
('AAPL', 50, 545.75)
('FB', 150, 7.45)
('HPQ', 75, 33.2)

#想接受用户输入作为参数来执行查询操作 必须使用占位符?来进行引用参数

>>> min_price = 100
>>> for row in db.execute('select * from portfolio where price >= ?',
                          (min_price,)):
...     print(row)
...
('GOOG', 100, 490.1)
('AAPL', 50, 545.75)

