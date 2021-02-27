FROM alpine as builder
ENV base=https://github.com/sleepgod/Actions-OpenWrt/releases/download/2021.02.27-0655/
ENV file=openwrt-x86-64-generic-rootfs.tar.gz
ENV sha256=4d236453a81e0741afa98c7d22979d06b03be53e0aaa6e9e15fe0dc796feae08
RUN wget -q "$base$file" && echo "$sha256  $file" | sha256sum -c
RUN mkdir /rootfs && tar xf "$file" -C /rootfs

FROM scratch
COPY --from=builder /rootfs/ /
CMD ["/bin/sh"]
