FROM centos:6.7

COPY CentOS-Base.repo /

RUN rm -rf /etc/yum.repos.d/* \
    && mv /CentOS-Base.repo /etc/yum.repos.d/ \
    && yum makecache \
    && yum update -y 
RUN yum install -y  unzip zip tree mlocate vim wget ccache sudo tcsh vim which \
    && yum install -y redhat-lsb make automake kernel-devel glibc-devel gcc gcc-c++ libidn-0.6.5-1.1.x86_64 gcc-gfortran flex zlib-devel boost boost-devel numactl libxml2-devel \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 

RUN wget https://github.com/openssl/openssl/releases/download/OpenSSL_1_1_1w/openssl-1.1.1w.tar.gz \
    && tar zxf openssl-1.1.1w.tar.gz \
    && cd openssl-1.1.1w \
    && ./config && make && make install \
    && cd ..

RUN wget  https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz  \
    && tar zxf v1.2.11.tar.gz \
    && cd zlib-1.2.11 \
    && ./configure && make && make install \
    && cd ../  \
    && rm -rf zxf v1.2.11.tar.gz zlib-1.2.11 openssl-1.1.1w.tar.gz openssl-1.1.1w \
    && mkdir /export/ && chmod -R 777 /export

COPY opt.tar.gz /export/

RUN cd /export && tar zxf opt.tar.gz && rm opt.tar.gz

cmd ["/bin/bash"]