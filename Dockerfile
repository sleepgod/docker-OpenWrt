FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.01.24-1334/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=d199cd17e6ecf256785d031ac1e185fe68ca300b2b12ef4dc3e2e59e7350fec7
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
