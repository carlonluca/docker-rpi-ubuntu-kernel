# docker-rpi-ubuntu-kernel

Image to cross-build the Ubuntu kernel for the Raspberry Pi 4. The image contains all the needed tools here: https://hub.docker.com/repository/docker/carlonluca/docker-rpi-ubuntu-kernel.

## Usage

From the host:

```
mkdir workspace
cd workspace
git clone https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux-raspi/+git/hirsute src
[apply needed patches]
```

Now you can build the kernel by running the script in the container:

```
docker run --rm -it --name builder -v $PWD/workspace:/workspace \
    -v $PWD/build.sh:/workspace/build.sh carlonluca/docker-rpi-ubuntu-kernel:focal \
    /workspace/build.sh
```

in workspace/out you should get the packages to install in your pi:

```
$ ls -lh workspace/out/
total 55M
-rw-r--r-- 1 root root 787K 21 ago 00.35 linux-buildinfo-5.11.0-1016-raspi_5.11.0-1016.17_arm64.deb
-rw-r--r-- 1 root root 1,3M 21 ago 00.35 linux-headers-5.11.0-1016-raspi_5.11.0-1016.17_arm64.deb
-rw-r--r-- 1 root root 9,6M 21 ago 00.35 linux-image-5.11.0-1016-raspi_5.11.0-1016.17_arm64.deb
-rw-r--r-- 1 root root  31M 21 ago 00.35 linux-modules-5.11.0-1016-raspi_5.11.0-1016.17_arm64.deb
-rw-r--r-- 1 root root  12M 20 ago 23.49 linux-raspi-headers-5.11.0-1016_5.11.0-1016.17_arm64.deb
```
