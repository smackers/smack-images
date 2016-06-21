#!/bin/bash

REPO=https://github.com/smackers/smack.git
BRANCH=develop
PREFIX=/usr/local
TMP=/tmp

cd ${PREFIX}/bin
mv boogie boogie-saved
mv corral corral-saved

cd ${TMP}
git clone ${REPO}
cd smack
git checkout ${BRANCH}
mkdir -p build
cd build
cmake ..
make install

cd ${PREFIX}/bin
mv boogie-saved boogie
mv corral-saved corral

rm -rf ${TMP}/*
