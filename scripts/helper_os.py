#!/usr/bin/python

import platform

if 'linux' in str(platform.system()).lower() and 'Ubuntu' in platform.dist():
	print 'Su version de OS es compatible'
	exit(0)
else:
	print 'Su version de OS no es compatible... '
	exit(1)
