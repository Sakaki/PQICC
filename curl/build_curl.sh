#!/bin/sh

# zlibのコンパイル
cd zlib
git checkout -b work_1.2.8 v1.2.8
./configure --prefix=/env/bin/zlib
make
make install
cd ../

# opensslのコンパイル
cd openssl-1.0.2j
./Configure dist --prefix=/env/bin/openssl
make
make install
cd ../

# curlのコンパイル
cd curl-7.37.1/
./configure --prefix=/env/bin/curl --target=arm-none-linux-gnueabi --host=arm-none-linux-gnueabi --build=x86_64-pc-linux-gnu --with-ssl --with-zlib
make
make install
cd ../
