#解析简单的XML数据
#可以使用xml.etree.ElementTree模块从简单的XML文档中提取数据
#xml.etree.ElementTree.parse()函数解析整个XML文档并将其转换成一个文档对象。
#然后，就能使用find() iterfind() findtext()等方法来搜索特定的XML元素。
#ElementTress模块中的每个元素有一些重要的属性和方法，在解析的时候很有用。
#tag属性包含了标签的名字，text属性包含内部文本，get()方法能获取属性值。
#对于更高级的应用程序，可以考虑使用lxml。
from urllib.request import urlopen
from xml.etree.ElementTree import parse

#Download the RSS feed and parse it
u = urlopen('http://planet.python.org/rss20.xml')
doc = parse(u)

#Extract and output tags of interest
for item in doc.iterfind('channel/item'):
	title = item.findtext('title')
	date = item.findtext('pubData')
	link = item.findtext('link')

	print(title)
	print(date)
	print(link)
	print()


>>> doc
<xml.etree.ElementTree.ElementTree object at 0x101339510>
>>> e = doc.find('channel/title')
>>> e
<Element 'title' at 0x10135b310>
>>> e.tag
'title'
>>> e.text
'Planet Python'
>>> e.get('some_attribute')
