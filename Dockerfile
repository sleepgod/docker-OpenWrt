FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.04.17-0709/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=ee7da77112a70860d8970be8374d6ceeddfcdaf61320ebc1755fb4db2cde6d15
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
