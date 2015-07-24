#保存最后N个元素

#下面对一系列文本行做简单的文本匹配操作，当发现有匹配时就输出当前匹配行以及
#最后检查过的N行文本。yield返回的是迭代器。
from collections import deque
def search(lines,pattern,history=5):
	previous_lines = deque(maxlen=history)
	for line in lines:
		yield line,previous_lines
	previous_lines.append(line)
#Example use on a file
if __name__ == '__main__':
	with open('somefile.txt') as f:
		for line, prevlines in search(f,'python',5):
			for pline in prevlines:
				print(pline,end='')
			print(line,end='')
			print('-'*20)


#deque(maxlen=N)创建了一个固定长度的队列。当有新纪录加入而队列已满时会自动
#移除最老的那条记录。如果不指定队列的大小，也就得到了一个无界限的队列。
#从队列两端添加或弹出元素的复杂度为O(1)，而列表的复杂度为O(N)。
>>>q = deque(maxlen=3)
>>>q.append(1)
>>>q.append(2)
>>>q.append(3)
>>>q
deque([1,2,3],maxlen=3)
>>>q.append(4)
>>>q
deque([2,3,4],maxlen=3)
>>>q.append(5)
>>>q
deque([3,4,5],maxlen=3)

>>>q = deque()
>>>q.append(1)
>>>q.append(2)
>>>q.append(3)
>>>q
deque([1,2,3])
>>>q.appendleft(4)
>>>q
deque([4,1,2,3])
>>>q.pop()
3
>>>q
deque([4,1,3])
>>>q.popleft()
4
