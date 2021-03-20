FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.03.20-0709/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=47f99e567ee2484ae0bb4a76d98d83581acd09764892fe9fe6c57531db67d463
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
