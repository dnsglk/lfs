#!/bin/bash

# 5.20. Diffutils-3.6 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/diffutils.html

_configure --prefix=/tools
_make
_make_check
_make install
