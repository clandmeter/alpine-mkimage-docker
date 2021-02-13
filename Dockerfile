FROM arm32v7/alpine

WORKDIR /root

COPY patches/ /tmp/
COPY entrypoint.sh /usr/local/bin

RUN apk add git fakeroot abuild sudo alpine-conf

ENTRYPOINT entrypoint.sh
