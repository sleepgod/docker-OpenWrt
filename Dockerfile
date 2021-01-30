FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.01.30-0704/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=a8d23df2f53b9c86cbc1034b11e832fcef6fe6dc88e605c342580e7500fe606d
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
