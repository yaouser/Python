#解析和修改XML
#修改一个XML文档容易，但是要注意所有的修改都是针对父节点元素，将它作为一个
#列表来处理。 remove() insert() append()  element[i] element[i:j]

>>>from xml.etree.ElementTree import parse, Element
>>>doc = parse('pred.xml')
>>>root = doc.getroot()

>>>#Remove a few elements
>>>root.remove(root.find('sri'))
>>>root.remove(root.find('cr'))

>>>#Insert a new element after <nm>...</nm>
>>>root.getchildren().index(root.find('nm'))
1
>>>e = Element('spam')
>>>e.text = 'This is a test'
>>>root.insert(2,e)

>>>#Write back to a file
>>>doc.write('newpred.xml', xml_declaration = True)

