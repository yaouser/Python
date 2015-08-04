#序列上索引值迭代
#想在迭代一个序列的同时跟踪正在被处理的元素索引。
#enumerate()函数

>>>my_list = ['a','b','c']
>>>for idx, val in enumerate(my_list):
	print(idx, val)
0 a
1 b
2 c

#为了按传统行号输出，可以传递一个开始参数
>>>my_list = ['a','b','c']
>>>for idx, val in enumerate(my_list, 1):
	print(idx, val)
1 a
2 b
3 c

#在遍历文件时想在错误消息中使用行号定位时候非常有用
def parse_data(filename):
	with open(filename,'rt') as f:
		for lineno, line in enumerate(f, 1):
			fields = line.split()
			try:
				count = int(fields[1]
			except ValueError as e:
				print('Line {}: Parse error: {}'.format(lineno,e))


#将一个文件中出现的单词映射到它出现的行号上去
word _summary = defaultdict(list)

with open('myfile.txt','r') as f:
	lines = f.readlines()

for idx, line in enumerate(lines):
	#Create a list of words in current line
	words = [w.strip().lower() for w in line.split()]
	for word in words:
		word_summary[word].append(idx)
