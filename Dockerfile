FROM triton2

#RUN apt install -y ninja-build
RUN mkdir /titan && cd /titan
RUN /vcpkg/vcpkg install fmt range-v3 curl
#RUN cmake --preset=default
#RUN cmake --build build

COPY . /titan

#RUN cd /titan && ls && cmake --preset=default --debug-output
#RUN cd /titan && ls && cmake --preset=default --debug-find
RUN cd /titan && ls && cmake --preset=default -DCMAKE_BUILD_TYPE=Debug
RUN cd /titan && ls && cmake --build build

RUN cp /usr/local/lib/x86_64-linux-gnu/libbitwuzla.so.0 /lib/x86_64-linux-gnu
RUN cp /usr/local/lib/x86_64-linux-gnu/libbitwuzla.so /lib/x86_64-linux-gnu
RUN cp /usr/local/lib/libcapstone.so.5 /lib/x86_64-linux-gnu
RUN cp /titan/intrinsics/vmprotect* /titan/build/intrinsics/

WORKDIR /titan/build
ENTRYPOINT /bin/bash

