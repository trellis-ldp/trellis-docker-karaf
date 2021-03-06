#!/usr/bin/env bash
# This file intended to be sourced

# . /build/config.sh

# Prevent initramfs updates from trying to run grub and lilo.
export INITRD=no
export DEBIAN_FRONTEND=noninteractive

minimal_apt_get_args='-y --no-install-recommends'


## Build time dependencies ##

# git and ca-certificates is needed for git clone; not building
# alternate would be to download a release tarball with curl or wget
# xz-utils is needed for tar to uncompress an .xz tarball
NGHTTP2_BUILD_PACKAGES="git ca-certificates curl xz-utils"

# Core list from docs
NGHTTP2_BUILD_PACKAGES="$NGHTTP2_BUILD_PACKAGES make binutils autoconf automake autotools-dev libtool pkg-config zlib1g-dev libssl-dev libxml2-dev libev-dev libevent-dev libjemalloc-dev libc-ares-dev"

# Optional:
#   libcunit1-dev - for tests
#   libjansson-dev - for HPACK tools
#   libjemalloc-dev - optional but recommended
#   cython python-dev - python bindings

# building the servers needs g++
NGHTTP2_BUILD_PACKAGES="$NGHTTP2_BUILD_PACKAGES g++"


## Run time dependencies ##
#   openssl and python are needed for OCSP /usr/share/nghttp2/fetch-ocsp-response
NGHTTP2_RUN_PACKAGES="libev4 libevent-2.0-5 libevent-openssl-2.0-5 libjemalloc1 libxml2 zlib1g openssl python libc-ares2"
