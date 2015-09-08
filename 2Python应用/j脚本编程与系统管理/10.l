#读取配置文件
configparser模块

------------------------------
#config.ini
[installation] 
library=%(prefix)s/lib 
include=%(prefix)s/include 
bin=%(prefix)s/bin 
prefix=/usr/local
[debug] 
log_errors=true 
show_warnings=False
[server] 
port:8080 
nworkers:32
pid-file=/tmp/spam.pid
root=/www/root
------------------------------------

>>>from configparser import ConfigParser
>>>cfg = ConfigParser()
>>>cfg.read('config.ini')
['config.ini']
>>>cfg.sections()
['installation','debug','server']
>>>cfg.get('installation','library')
'/usr/local/lib'
>>>cfg.getbootlean('debug','log_errors')
True
>>>cfg.getint('server','port')
8080
>>>cfg.getint('server','nworkers')
32
----------------set config file-------------------------
>>> cfg.set('server','port','9000')
>>> cfg.set('debug','log_errors','False')
>>> import sys
>>> cfg.write(sys.stdout)
[installation]
library = %(prefix)s/lib
include = %(prefix)s/include
bin = %(prefix)s/bin
prefix = /usr/local

[debug]
log_errors = False
show_warnings = False

[server]
port = 9000
nworkers = 32
pid-file = /tmp/spam.pid
root = /www/root
------------------------------------------------------
