#!/bin/sh

: ${PACKAGER:=alpinelinux}
: ${MIRROR:=https://dl-cdn.alpinelinux.org/alpine}
: ${RELEASE:=latest-stable}

abuild-keygen -ain

git clone --depth=1 git://git.alpinelinux.org/aports

find /tmp -type f -name "*.patch" | xargs -n1 git -C ~/aports apply

cd aports/scripts && ./mkimage.sh \
	--profile netboot \
	--repository "$MIRROR/$RELEASE"/main \
	--outdir /root/out

