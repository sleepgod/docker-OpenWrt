FROM scratch

MAINTAINER SleepGod <dingwenxuan@gmail.com>

ADD openwrt-x86-generic-Generic-rootfs.tar.gz /

RUN mkdir /var/lock

USER root
CMD /sbin/init
