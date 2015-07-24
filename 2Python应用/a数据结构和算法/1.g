#让字典保持有序
#要控制字典中元素的顺序，可以使用collections模块中的OrderedDict类。OrderedDict
#内部维护了一个双向链表，当对字典做迭代时，它会严格按照元素初始添加的顺序进行。
#由于双向链表，OrderedDict的大小是普通字典的两倍多，因此会带来内存开销。
#OrderedDict在JSON和CVS中有应用，可以精准的控制各自段的顺序。
from collections import OrderedDict
d = OrderedDict()
d['foo'] = 1
d['bar'] = 2
d['spam'] = 3
d['grok'] = 4
#Outputs "foo 1","bar 2","spam 3","grok 4"
>>>for key in d:
	print(key,d[key])
>>>import json
>>>json.dumps(d)
'{"foo":1,"bar":2,"spam":3,"grok":4}'



