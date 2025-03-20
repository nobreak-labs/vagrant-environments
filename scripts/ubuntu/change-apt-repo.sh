#!/bin/bash

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
  sed -i 's|^URIs:.*|URIs: http://ftp.kaist.ac.kr/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources
elif [ "$ARCH" = "aarch64" ]; then
  sed -i 's|^URIs:.*|URIs: http://ftp.kaist.ac.kr/ubuntu-ports/|g' /etc/apt/sources.list.d/ubuntu.sources
fi
