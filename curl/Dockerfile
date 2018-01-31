FROM ubuntu:16.04
LABEL miantainer="Sakaki <https://github.com/Sakaki>"

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y lib32z1 wget git build-essential
RUN mkdir /env
WORKDIR /env
RUN wget https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 \
    && tar xf arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
RUN git clone git://github.com/madler/zlib.git
RUN wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz \
    && tar xf openssl-1.0.2j.tar.gz
RUN wget http://curl.haxx.se/download/curl-7.37.1.tar.gz \
    && tar xf curl-7.37.1.tar.gz
RUN mkdir -p bin/zlib bin/openssl bin/curl
ADD build_curl.sh /env/build_curl.sh
RUN chmod +x /env/build_curl.sh

ENV PATH $PATH:/env/arm-2010q1/bin
ENV CC arm-none-linux-gnueabi-gcc
ENV AR arm-none-linux-gnueabi-ar
ENV RANLIB arm-none-linux-gnueabi-ranlib
ENV AS arm-none-linux-gnueabi-as
ENV LD arm-none-linux-gnueabi-ld
ENV NM arm-none-linux-gnueabi-nm
ENV LIBS "-lssl -lcrypto"
ENV CPPFLAGS "-I/env/bin/openssl/include -I/env/bin/zlib/include"
ENV LDFLAGS "-L/env/bin/openssl/lib -L/env/bin/zlib/lib"

CMD ["./build_curl.sh"]
