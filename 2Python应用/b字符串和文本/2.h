#将Unicode文本统一表示为规范形式
#可以通过unicodedata模块来完成。
#normalize()的第一个参数指定了字符穿应该完成规范表示。NFC表示字符应该是全组成
#的。NFD表示应该使用组合字符，每个字符应该是能完全分解开的。
#Python还支持NFKCHENFKD，它们为处理特定类型的字符增加了额外的兼容功能。

>>>s1 = 'Spicy Jalape\u00f1o'
>>>s2 = 'Spicy Jalapen\u0303o'
>>>import unicodedata
>>>t1 = unicodedata.normalize('NFC',s1)
>>>t2 = unicodedata.normalize('NFC',s2)
>>>t1 == t2
True
>>>print(ascii(t1))
'Spicy Jalape\xflo'

>>>t3 = unicodedata.normalize('NFD',s1)
>>>t4 = unicodedata.normalize('NFD',s2)
>>>t3 == t4
True
>>>print(ascii(t3))
'Spicy Jalapen\u0303o'
