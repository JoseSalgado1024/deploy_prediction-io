#!/usr/bin/python

import platform

if 'linux' in str(platform.system()).lower() and 'Ubuntu' in platform.dist():
	exit(0)
else:
	exit(1)
