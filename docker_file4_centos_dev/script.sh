#!/bin/bash

sed -e "s|^mirrorlist=|#mirrorlist=|g" \
    -e "s|^#baseurl=http://mirror.centos.org/centos/\$releasever|baseurl=http://mirrors.tuna.tsinghua.edu.cn/centos-vault/6.7|g" \
    -e "s|^#baseurl=http://mirror.centos.org/\$contentdir/\$releasever|baseurl=http://mirrors.tuna.tsinghua.edu.cn/centos-vault/6.7|g" \
    -e "s|^gpgcheck=1|gpgcheck=0|g" \
    -e "s|^gpgkey=|#gpgkey=|g" \
    -i.bak \
    /etc/yum.repos.d/CentOS-*.repo

yum makecache
