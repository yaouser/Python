#在字典中将键映射到多个值上
#如果想让键映射到多个值，需要将这多个值保存到另外一个容器如列表和集合中。
#如果希望保留元素插入的顺序，就用列表。
#如果希望消除重复元素（且不在意它们的顺序），就用集合。
#为了能方便地创建这样的字典，可以利用collections模块中的defaultdict类。

#创建字典，值上绑定列表
d = {
	'a':[1,2,3],
	'b':[4,5]
}
#创建字典，值上绑定集合
e = {
	'a':{1,2,3},
	'b':{4,5}
}

from collections import defaultdict
d = defaultdict(list)
d['a'].append(1)
d['a'].append(2)
d['b'].append(4)
....
d = defaultdict(set)
d['a'].add(1)
d['a'].add(2)
d['b'].add(4)
....

#如果不使用defaultdict的话，就会麻烦一点
d = {}
for key, value in pairs:
	if key not in d:
		d[key] = []
	d[key].append(value)
#而如果使用defaultdict的话，就会清晰一点
d = defaultdict(list)
for key,value in pairs:
	d[key].append(value)
