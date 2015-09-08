#运行时弹出密码输入提示
Python3的getpass模块

====================================

import getpass

user = getpass.getuser()
passwd = getpass.getpass()

if svc_login(user, passwd): # You must write svc_login()
        print('Yay!')
else:
        print('Boo!')

-----------------------------------

#svc_login()函数需要自己编写来处理获得的密码
#系统不会提示要输入用户,是程序根据当前登录的用户自己获得的

===============================================================
