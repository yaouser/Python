#从任意长度的可迭代对象中分解元素
#Python的 *表达式 可以用来解决这个问题

#去掉第一个和最后一个
def drop_first_last(grades):
	first,*middle,last = grades
	return avg(middle)

>>>record = ('Dave','dave@example.com','777-555-1212','847-555-1212')
>>>name,email,*phone_numbers = user_record
>>>name
'Dave'
>>>email
'dave@example.com'
>>>phone_numbers
['773-555-1212','847-555-1212']

>>>*trailing,current = [10,8,7,1,9,5,10,3]
>>>trailing
[10,8,7,1,9,5,10]
>>>current
3

#*式的语法在迭代一个变长的元组序列是尤其有用。
records = [
	('foo',1,2),
	('bar','hello'),
	('foo',3,4),
]
def do_foo(x,y):
	print('foo',x,y)
def do_bar(s):
	print('bar',s)
for tag,*args in records:
	if tag == 'foo':
		do_foo(*args)
	elif tag == 'bar':
		do_bar(*args)

#拆分操作
>>>line = 'nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false'
>>>uname, *fields, homedir, sh = line.split(':')
>>>uname
'nobody'
>>>homedir
'/var/empty'
>>>sh
'/usr/bin/false'

>>>record = ("ACME', 50, 123.45, (12, 18, 2012))
>>>name, *_, (*_, year) = record
>>>name
'ACME'
>>>year
2012
