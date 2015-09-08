#给简单脚本增加日志功能
logging模块

-----------------------------------
logging.basicConfig()
logging.critical()
logging.error()
logging.info()
logging.debug()
---------------------------------
import logging

def main():
	logging.basicConfig(filename='app.log',level=logging.ERROR)

	hostname='www.python.org'
	item='spam'
	filename='data.csv'
	mode='r'

	logging.critical('Host %s unknown',hostname)
	logging.error("Couldn't find %r",item)
	logging.warning('Feature is deprecated')
	logging.info('Opening file %r,mode=%r',filename,mode)
	logging.debug('Got here')

if __name__ == '__main__':
	main()
-----------------------------------------------------
#想将日志形成一定的格式
logging.basicConfig(filename='app.log',level=logging.WARNING,format='%(levelname)s:%(asctime)s:%(message)s')
------------------------------------------------------------------------------
import logging 
import logging.config

def main():
	#Configure the logging system logging.config.fileConfig(‘logconfig.ini’)
	#Now make a configuration file logconfig.ini that looks like this:

	[loggers] keys=root
	[handlers] keys=defaultHandler
	[formatters] keys=defaultFormatter
	[logger_root] level=INFO handlers=defaultHandler qualname=root
	[handler_defaultHandler] class=FileHandler formatter=defaultFormatter args=(‘app.log’, ‘a’)
	[formatter_defaultFormatter] format=%(levelname)s:%(name)s:%(message)s
------------------------------------------------------------------------------
