#从字典中提取子集
#利用字典推导式可轻松解决。
prices = {
	'ACME':45.23,
	'AAPL':612.78,
	'IBM':205.55,
	'HPQ':37.20,
	'FB':10.75
}
#Make a dictionary of all prices over 200
p1 = { key:value for key, value in prices.items() if value > 200 }
#Make a dictionary of tech stocks
tech_names = { 'AAPL','IBM','HPQ','MSFT' }
p2 = { key:value for key,value in prices.items() if key in tech_names }

#大部分可以用字典推导式解决的问题也可以通过创建元组序列然后将它们传给dict()
#函数来完成。
p1 = dict((key,value) for key,value in prices.items() if value > 200)
p2 = { key:prices[key] for key in prices.keys() & tech_names }

