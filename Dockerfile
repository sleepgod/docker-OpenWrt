FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.03.13-0708/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=262791db3c632307e97c7ebcc621c8375f4a68942a15eff4af1b4858aab3b9e1
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
