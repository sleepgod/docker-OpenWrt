FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.04.03-0705/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=2be8f777c758b7596635bcaf22ce25ef4acb3c366f15439aaddb20f15d097549
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
