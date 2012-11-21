#!/bin/bash

cd 3rdparty.old/TooN/
./configure prefix=$HOME/bin/toon_2009
make && make install

ln -s $HOME/bin/toon_2009 $HOME/bin/TooN
export CFLAGS+=" -I $HOME/bin/TooN/include/ "
export CPPFLAGS+=" -I $HOME/bin/TooN/include/ "

cd ../libcvd
export CXXFLAGS="-D_REENTRANT -fomit-frame-pointer"
./configure --without-ffmpeg --prefix=$HOME/bin/libcvd_2009 --without-v4l1buffer --with-linux=`uname -r` 

echo
echo Press enter to compile libcvd
read
make && make install

ln -s $HOME/bin/libcvd_2009 $HOME/bin/libcvd
export CFLAGS+=" -I $HOME/bin/libcvd/include/ "
export CPPFLAGS+=" -I $HOME/bin/libcvd/include/ "
export LD_LIBRARY_PATH+=" -L $HOME/bin/libcvd/lib/ "

cd ../gvars3
./configure --disable-widgets --prefix=$HOME/bin/gvars3_2009

echo
echo Press enter to compile gvars3
read
make && make install

ln -s $HOME/bin/gvars3_2009 $HOME/bin/gvars3
export CFLAGS+=" -I $HOME/bin/gvars3/include/ "
export CPPFLAGS+=" -I $HOME/bin/gvars3/include/ "
export LD_LIBRARY_PATH+=" -L $HOME/bin/gvars3/lib/ "

cd ../../
echo
echo Press enter to compile PTAM
read
#make

echo
echo Do not forget to add
echo
echo \#TooN
echo export CFLAGS+="\" -I $HOME/bin/TooN/include/ "\"
echo export CPPFLAGS+="\" -I $HOME/bin/TooN/include/ "\"
echo \#libcvd
echo export CFLAGS+="\" -I $HOME/bin/libcvd/include/ "\"
echo export CPPFLAGS+="\" -I $HOME/bin/libcvd/include/ "\"
echo export LD_LIBRARY_PATH+="\" -L $HOME/bin/libcvd/lib/ "\"
echo \#gvars3
echo export CFLAGS+="\" -I $HOME/bin/gvars3/include/ "\"
echo export CPPFLAGS+="\" -I $HOME/bin/gvars3/include/ "\"
echo export LD_LIBRARY_PATH+="\" -L $HOME/bin/gvars3/lib/ "\"
