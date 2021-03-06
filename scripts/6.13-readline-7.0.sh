#!/bin/bash 

# 6.13. Readline-7.0
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/readline.html

sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

_configure --prefix=/usr    \
           --disable-static \
           --docdir=/usr/share/doc/readline-7.0

_make SHLIB_LIBS="-L/tools/lib -lncursesw"
_make SHLIB_LIBS="-L/tools/lib -lncurses" install

mv -v /usr/lib/lib{readline,history}.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-7.0
