#启动一个WEB浏览器

------------------------------

>>>import webbrowser
>>>webbrowser.open('http://www.python.org')
True

---------------------------------------------

>>>#Open the page in a new browser window
>>>webbrowser.open_new('http://www.python.org')
True

>>>#Open the page in a new browser tab
>>>webbrowser.open_new_tab('http://www.python.org')
True

>>>c = webbrowser.get('firefox')
>>>c.open('http://www.python.org')
True
>>>c.open_new_tab('http://docs.python.org')
True

-----------------------------------------------------------------
