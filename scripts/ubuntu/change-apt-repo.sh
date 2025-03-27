#!/bin/bash

# 프로비저닝 스크립트
CHANGE_APT_REPO = <<-SCRIPT
  ARCH=$(uname -m)
  RELEASE=$(lsb_release -cs)
  if [ "$RELEASE" = "jammy" ]; then
    # Ubuntu 22.04
    if [ "$ARCH" = "x86_64" ]; then
      sed -i 's/archive.ubuntu.com\\|kr.archive.ubuntu.com\\|security.ubuntu.com/ftp.kaist.ac.kr/g' /etc/apt/sources.list
    elif [ "$ARCH" = "aarch64" ]; then
      sed -i 's/ports.ubuntu.com/ftp.kaist.ac.kr/g' /etc/apt/sources.list
    fi
  elif [ "$RELEASE" = "noble" ]; then
    # Ubuntu 24.04
    if [ "$ARCH" = "x86_64" ]; then
      sed -i 's|^URIs:.*|URIs: http://ftp.kaist.ac.kr/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources
    elif [ "$ARCH" = "aarch64" ]; then
      sed -i 's|^URIs:.*|URIs: http://ftp.kaist.ac.kr/ubuntu-ports/|g' /etc/apt/sources.list.d/ubuntu.sources
    fi
  fi
SCRIPT