# alpine-mkimage-docker

alpine release scripts in docker with multiarch

## Enable multiarch via qemu user

For details see: https://github.com/multiarch/qemu-user-static

Run the following command to presistently have mutli arch support on your os

`docker run --rm --privileged multiarch/qemu-user-static --reset -p yes`

Verify it with: `docker run --rm -t arm64v8/alpine uname -m`

The result should be `aarch64`

To build a release, build this docker image and run it.

`docker build --tag mkimage-docker .`

`docker run --rm -v $PWD/out:/root/out mkimage-docker`
