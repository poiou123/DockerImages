FROM alpine:latest

ARG wtVersion=4.7.2
ARG wtBranch=4.7
ARG qtVersion=5

WORKDIR /root/
#Adicionar repositórios latest main e comunity para instalar dependências
RUN printf "#/media/cdrom/apks\nhttps://dl-cdn.alpinelinux.org/alpine/latest-stable/main\nhttps://dl-cdn.alpinelinux.org/alpine/latest-stable/community\n" > /etc/apk/repositories

RUN cat /etc/apk/repositories
#Instalar dependências
RUN apk update
RUN apk upgrade
RUN apk add git
RUN apk add g++ make cmake
RUN apk add boost-dev libssl3 libpq-dev icu-data-full

#instalat wr
RUN git clone https://github.com/emweb/wt.git
WORKDIR /root/wt
RUN git checkout tags/$wtVersion -b $wtBranch-release
RUN mkdir build
WORKDIR /root/wt/build
RUN cmake -DBUILD_EXAMPLES=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCONNECTOR_FCGI=OFF \
    -DDEBUG=OFF \
    -DENABLE_FIREBIRD=OFF \
    -DENABLE_HARU=OFF \
    -DENABLE_LIBWTTEST=OFF \
    -DENABLE_MSSQLSERVER=OFF \
    -DENABLE_MYSQL=OFF \
    -DENABLE_PANGO=OFF \
    -DENABLE_POSTGRES=ON \
    -DENABLE_QT4=OFF \
    -DENABLE_QT5=ON \
    -DQt5Core_DIR=/usr/lib/cmake/Qt$qtVersionCore\
    -DENABLE_SAML=OFF \
    -DENABLE_SQLITE=OFF \
    -DINSTALL_DOCUMENTATION=OFF \
    -DSHARED_LIBS=ON\
    -DCMAKE_INSTALL_PREFIX=/root/wtRelease \
    ..

RUN make
RUN make install
WORKDIR /root/
RUN rm -r wt

#instalar qt
RUN apk add qt$qtVersion-qtbase-dev qt$qtVersion-qtnetworkauth-dev qt$qtVersion-qtxmlpatterns-dev qt$qtVersion-qtscript-dev qt$qtVersion-qtsvg-dev qt$qtVersion-qtwebengine qt$qtVersion-assistant qt$qtVersion-qtserialport-dev qt$qtVersion-qtwebview-dev qt$qtVersion-assistant qt$qtVersion-qttools-dev

RUN LD_LIBRARY_PATH=/root/wtRelease/lib
