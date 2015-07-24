#与字典有关的计算问题(求大小和排序)
#zip()能够将字典的键和值反转过来。用zip()时创建了迭代器，内容只能被消费一次。
prices = {
	'ACME':45.23,
	'AAPL':612.78,
	'IBM':205.55,
	'HPQ':37.20,
	'FB':10.75
}
min_price = min(zip(prices.values(),prices.keys())
#min_price is (10.75,'FB')
max_price = max(zip(prices.values(),prices.keys()))
#max_price is (612.78,'AAPL')
prices_sorted = sorted(zip(prices.values(),prices.keys()))
#prices_sorted is [(10.75,'FB'),(37.2,'HPQ'),
#		(45.23,'ACME'),(205.55,'IBM'),
#		(612.78,'AAPL')]

#如果在字典上进行数据操作，将发现只会处理键，而不是值。
min(prices) #Returns 'AAPL'
max(prices) #Returns 'IBM'
min(prices.values()) #Returns 10.75
max(prices.values()) #Returns 612.78

#如果给min()和max()提供一个key参数，就可以实现处理 值 而返回 键。
min(prices,key=lambda k: prices[k]) #Returns 'FB'
max(prices,key=lambda k: prices[k]) #Returns 'AAPL'
min_value = prices[min(prices,key=lambda k: prices[k])] #Returns 10.75
