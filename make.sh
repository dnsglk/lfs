#!/bin/bash

function _make() {
    make ${MAKE_THREAD_NUM} $@
}


# coreutils 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/coreutils.html

./configure --prefix=/tools --enable-install-program=hostname
_make 
_make RUN_EXPENSIVE_TESTS=yes check
_make install
