FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.03.27-0747/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=39baa2534bf516e62551bb3c64c577f01802f638f2f5b9be2207d47ba5f4521a
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
