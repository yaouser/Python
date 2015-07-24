#找到最大或最小的N个元素

#heapq模块中有两个函数 nlargest()和nsmallest()，这两个函数可接受一个参数key。
#以上的两个函数是适用于所要找的元素数量相对较小。
#在堆中查找一个元素的复杂度为O(logN),N代表堆的大小。
import heapq
nums = [1,8,2,23,7,-4,18,23,42,37,2]
print(heapq,.nlargest(3,nums)) #Prints [42,37,23]
print(heapq.nsmallest(3,nums)) #Prints [-4,1,2]

portfolio = [
	{'name':'IBM','shares':100,'price':91.1},
	{'name':'FB','shares':200,'price':21.09},
	{'name':'HPQ','shares':35,'price':31,75},
	{'name':'YHOO','shares':45,'price':16.35},
	{'name':'ACME','shares':75,'price':115.65}
]
cheap = heapq.nsmallest(3,portfolio,key=lambda s: s['price'])
expensive = heapq.nlargest(3,portfolio,key=lambda s: s['price'])

