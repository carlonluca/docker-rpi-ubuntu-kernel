#!/bin/bash

cd /workspace/src
mkdir -p /workspace/out
export CC=aarch64-linux-gnu-gcc
export $(dpkg-architecture -aarm64); export CROSS_COMPILE=aarch64-linux-gnu-
fakeroot debian/rules clean
fakeroot debian/rules binary-headers binary binary-perarch
mv ../*.deb ../out/
echo "Done ;-)"
