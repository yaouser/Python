#通过公共键对字典列表排序
#利用operator模块中的itemgetter函数对结构数据(员工信息)进行排序是非常简单的。
rows = [
	{'fname':'Brian','lname':'Jones','uid':1003},
	{'fname':'David','lname':'Beazley','uid':1003},
	{'fname':'John','lname':'Cleese','uid':1001},
	{'fname':'Big','lname':'Jones','uid':1004}
]
from operator import itemgetter
rows_by_fname = sorted(rows, key=itemgetter('fname'))
rows_by_uid = sorted(rows, key=itemgetter('uid'))
print(rows_by_fname)
print(rows_by_uid)
#itemgetter()函数还可以接受多个键。
rows_by_lfname = sorted(rows, key=itemgetter('lname','fname'))
print(rows_by_lfname)
#有时候会用lambda表达式来取代itemgetter()的功能。
rows_by_fname = sorted(rows,key=lambda r: r['fname'])
rows_by_lfname = sorted(rows,key=lambda r: (r['lname'],r['fname']))
>>>min(rows,key=itemgetter('uid'))
>>>max(rows,key=itemgetter('uid'))

