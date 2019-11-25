FROM ubuntu:18.04
CMD sudo apt-get update &&\
    sudo apt-get install autoconf &&\
    sudo apt-get install g++ &&\
    sudo apt-get install gcc &&\
    sudo apt-get install bison &&\
    sudo apt-get install flex &&\
    sudo apt-get install libarchive-zip-perl &&\ 
    sudo apt-get install libcups2-dev &&\
    sudo apt-get install libpam0g-dev &&\
    sudo apt-get install gperf &&\
    sudo apt-get install libfreetype6-dev &&\
    sudo apt-get install install libxaw7-dev &&\
    sudo apt-get install libfontconfig1-dev &&\
    sudo apt-get install libxrandr-dev patch &&\
    sudo apt-get install libgconf2-dev &&\
    sudo apt-get install libgnomevfs2-dev &&\
    sudo apt-get install ant &&\
    sudo apt-get install libgtk2.0-dev &&\ 
    sudo apt-get install junit &&\
    sudo apt-get install junit4 &&\
    sudo apt-get install libidl-dev &&\ 
    sudo apt-get install liborbit2-dev
RUN mkdir -p /home/openoffice 
WORKDIR /home/openoffice
ADD . ./openoffice
RUN cd openoffice/main 
RUN autoconf 
RUN ./configure --with-dmake-url=https://sourceforge.net/projects/oooextras.mirror/files/dmake-4.12.tar.bz2 --with-epm-url=https://sourceforge.net/projects/oooextras.mirror/files/epm-3.7.tar.gz
RUN ./bootstrap 
RUN source *.set.sh 
RUN cd instsetoo_native 
RUN build --all
