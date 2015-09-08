#获取终端的大小

os.get_terminal_size()
---------------------------

>>>import os
>>>sz = os.get_terminal_size()
>>>sz
os.terminal_size(columns=80,lines=24)
>>>sz.columns
80
>>>sz.lines
24

--------------------------------
