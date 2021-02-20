FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.02.20-0640/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=8f10d868cee48225e6289c0212d318a4423a9c69ca916ba4d98462ba5d5761e2
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
