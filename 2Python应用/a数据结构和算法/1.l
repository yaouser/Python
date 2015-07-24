#找出序列中出现次数最多的元素
#collections模块中的Counter类能够找出序列中出现次数最多的元素。
#在底层实现中，Counter是一个字典，给Counter对象提供任何可哈希的对象。
#Counter可以轻松地同各种数学运算操作结合起来使用。
words = [
	'look','into','my','eyes','look','into','my','eyes',
	'the','eyes','the','eyes','the','eyes','not','around','the',
	'eyes',"don't",'look','around','the','eyes','look','into',
	'my','eyes',"you're",'under'
]
from collections import Counter
word_counts = Counter(words)
top_three = word_counts.most_common(3)
print(top_three)
#Outputs [('eyes',8),('the',5),('look',4)]
>>>word_counts['not']
1
>>>word_counts['eyes']
8
>>>morewords = ['why','are','you','not','looking','in','my','eyes']
>>>for word in morewords:
	word_counts[word] += 1
>>>word_counts['eyes']
9

另一种方式
>>>word_counts.update(morewords)


>>>a = Counter(words)
>>>b = Counter(morewords)
>>>c = a + b
>>>d = a - b

