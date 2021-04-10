FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.04.10-0640/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=2f393d6100b84934484c8c022c7df2acf1bc81952e3f30763ffe7a1642958156
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
