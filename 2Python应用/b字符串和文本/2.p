#文本分词
#有一个字符串，想从左到右将它解析为标记流（stream of tokens）。
#要对字符串做分词处理，需要做的不仅仅只是匹配模式。我们还需要有某种方法来识别
#出模式的类型。

text = 'foo = 23 + 42 * 10'
tokens = [('NAME','foo'),('EQ','='),('NUM','23'),('PLUS','+'),
		('NUM','42'),('TIMES','*'),('NUM','10')]
#要完成分词处理，首先定义出所有可能的标记，包括空格。
import re
NAME = r'(?P<NAME>[a-zA-Z_][a-zA-Z_0-9]*)'
NUM = r'(?P<NUM>\d+)'
PLUS = r'(?P<PLUS>\+)'
TIMES = r'(?P<TIMES>\*)'
EQ = r'(?P<EQ>=)'
WS = r'(?P<WS>\S+)'
master_pat = re.compile('|'.join([NAME,NUM,PLUS,TIMES,EQ,WS]))
#使用模式对象的scanner()方法来完成分词操作。该方法会创建一个扫描对象，在给定的
#文本中重复调用match(),一次匹配一个模式。
>>>scanner = master_pat.scanner('foo = 42')
>>>scanner.match()

from collections import namedtuple
Token = namedtuple('Token',['type','value'])
def generate_tokens(pat,text):
	scanner = pat.scanner(text)
	for m in iter(scanner.match,None):
		yield Token(m.lastgroup,m.group())
#Produces output
#Token(type='NAME',value='foo')
.....

tokens = (tok for tok in generate_tokens(master_pat,text) if tok.type != 'WS')
for tok in tokens:
	print(tok)
