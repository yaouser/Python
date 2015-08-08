#将字典转换为XML
#xml.etree.ElementTree库通常用来做解析工作，它也可以创建XML文档

from xml.etree.ElementTree import Element

def dict_to_xml(tag,d):
	'''
	Turn a simple dict of key/value pairs into XML
	'''
	elem = Element(tag)
	for key,val in d.items():
		child = Element(key)
		child.text = str(val)
		elem.append(child)
	return elem

>>>s = {'name':'GOOG','shares':100,'price':490.1}
>>>e = dict_to_xml('stock',s)
>>>e
<Element 'stock' at 0x1004b64c8>

#使用xml.etree.ElementTree中的tostring()函数能将它转换成一个字节字符串

>>>from xml.etree.ElementTree import tostring
>>>tostring(e)
b'<stock><price>490.1</price><shares>100</shares><name>GOOG</name></stock>'

#使用set()方法给某个元素添加属性值

>>> e.set('_id','1234')
>>> tostring(e)
b'<stock _id="1234"><price>490.1</price><shares>100</shares><name>GOOG</name>
</stock>'
