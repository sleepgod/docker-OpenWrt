FROM alpine as builder
#FROM multiarch/alpine:armhf-latest-stable as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.01.30-0538/
ENV file=openwrt-bcm27xx-bcm2711-rpi-4-rootfs.tar.gz
ENV sha256=d59a48e56e1fd1521c89124f4ffb83b5064128d17a857f214b880feb3bdd3880
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
