#!/bin/sh


case $1 in
	x86_64|amd64)   DARCH=amd64;;
	x86|i386)       DARCH=i386;;
	armhf|arm32v6)  DARCH=arm32v6;;
	armv7|arm32v7)  DARCH=arm32v7;;
	aach64|arm64v8) DARCH=arm64v8;;
	ppc64le)        DARCH=ppc64le;;
	s390x)          DARCH=s390x;;
	*)              DARCH=all;;
esac

if [ "$DARCH" = all ]; then
	for arch in amd64 arm32v6 arm32v7 arm64v8 i386 ppc64le s390x; do
		docker build -t alpine-mkimage-docker-$arch --build-arg DARCH=$arch .
	done
else
	docker build -t alpine-mkimage-docker-$DARCH --build-arg DARCH=$DARCH .
fi



