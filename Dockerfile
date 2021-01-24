FROM multiarch/alpine:armhf-latest-stable as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.01.24-1304/
ENV file=openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz
ENV sha256=ea050d9e82e19be95605ba9c97b6c788f02ec12758ff2059828aa0d7f9b9604b
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
