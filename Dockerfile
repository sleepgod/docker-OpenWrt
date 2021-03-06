FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.03.06-0719/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=f747fc2906794b196b7292ab86e7a898758ec641ba3e423631a8962da85be87d
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
