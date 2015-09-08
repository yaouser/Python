#创建和解压压缩文件
shutil.unpack_archive()
shutil.make_archive()
shutil.get_archive_formats()

----------------------------------------------

>>>import shutil
>>>shutil.unpack_archive('Python-3.3.0.tgz')

>>>shutil.make_archive('py33','zip','Python-3.3.0')
'/Users/beazley/Downloads/py33.zip

#获得支持的压缩格式
>>>shutil.get_archive_formats()
[('bztar', "bzip2'ed tar-file"), ('gztar', "gzip'ed tar-file"),
 ('tar', 'uncompressed tar file'), ('zip', 'ZIP file')]

-------------------------------------------------------------------
