FROM scratch

MAINTAINER SleepGod <dingwenxuan@gmail.com>

ADD openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz /

RUN mkdir /var/lock

USER root
CMD /sbin/init
