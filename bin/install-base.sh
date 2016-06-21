#!/bin/bash

PREFIX=/usr
TMP=/tmp

LLVM_VERSION=$(cat ${TMP}/versions/llvm-version)
MONO_VERSION=$(cat ${TMP}/versions/mono-version)

PACKAGES="git cmake python-yaml python-psutil unzip wget"
PACKAGES+=" clang-${LLVM_VERSION} llvm-${LLVM_VERSION}"
PACKAGES+=" mono-complete libz-dev libedit-dev"

COMMANDS="clang clang++ llvm-config llvm-link llvm-dis"

apt-get update
apt-get install -y ${PACKAGES}

for cmd in ${COMMANDS}
do
  update-alternatives --install ${PREFIX}/bin/${cmd} ${cmd} ${PREFIX}/bin/${cmd}-${LLVM_VERSION} 20
done
