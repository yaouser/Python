#执行外部命令并获取它的输出
subprocess.check_output()

--------------------------------------

import subprocess 
out_bytes = subprocess.check_output(['ls','-la'])
out_text =out_bytes.decode('utf-8')
print(out_text)

------------------------------------------------

#捕获异常
try:
	out_bytes = subprocess.check_output(['cmd','arg1','arg2'])
except subprocess.CalledProcessError as e:
	out_bytes = e.output

------------------------------------

#默认check_output()错误不会输出到标准输出,如果要的话就要使用stderr参数
out_bytes = subprocess.check_output(['cmd','arg1','arg2'],stderr=subprocess.STDOUT)

#可以使用超时参数
try:
	out_bytes = subprocess.check_output(['cmd','arg1','arg2'],timeout=5)
except subprocess.TimeoutExpired as e:
	...

-----------------------------------------------------

#在SHELL的交互中执行命令
out_bytes = subprocess.check_output('grep python | wc > out',shell=True)

----------------------------------------------------------------------------

import subprocess

# Some text to send 
text = b''' hello world this is a test goodbye'''

# Launch a command with pipes 
p = subprocess.Popen([‘wc’],stdout = subprocess.PIPE, stdin = subprocess.PIPE)

# Send the data and get the output stdout
stderr = p.communicate(text)

# To interpret as text, decode 
out = stdout.decode(‘utf-8’) 
err = stderr.decode(‘utf-8’)

-----------------------------------------------------------------------------
