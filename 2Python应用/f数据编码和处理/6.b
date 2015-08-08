#读写JSON数据（JSON JavaScript Object Notation)
#json模块提供了一种很简单的方式来编码和解码JSON数据。其中两个主要函数是
#json.dumps()和json.loads()，要比其他序列化函数库pickle的借口少得多。

import json
data = {
	'name':'ACME',
	'shares':100,
	'price':542.23
}
json_str = json.dumps(data)

#将一个JSON编码的字符串转换为一个Python数据结构

data = json.loads(json_str)

#当要处理的是文件而不是字符串，可以使用json.dump()和json.load()处理

#Writing JSON data
with open('data.json','w') as f:
	json.dump(data,f)
#Reading data back
with open('data.json','r') as f:
	data = json.load(f)


