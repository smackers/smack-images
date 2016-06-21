#!/bin/bash

PREFIX=/usr/local
TMP=/tmp

BOOGIE_COMMIT=$(cat ${TMP}/versions/boogie-commit)
CORRAL_COMMIT=$(cat ${TMP}/versions/corral-commit)

Z3_ZIP=https://github.com/Z3Prover/z3/releases/download/z3-4.4.1/z3-4.4.1-x64-ubuntu-14.04.zip
BOOGIE_REPO=https://github.com/boogie-org/boogie.git
CORRAL_REPO=https://github.com/boogie-org/corral.git

cd ${TMP}
wget ${Z3_ZIP} -O z3.zip
unzip z3.zip */z3
cp $(find . -name "z3") ${PREFIX}/bin/z3

cd ${TMP}
git clone ${BOOGIE_REPO} boogie
cd boogie
git reset --hard ${BOOGIE_COMMIT}
cd Source
wget https://nuget.org/nuget.exe
mono ./nuget.exe restore Boogie.sln
xbuild Boogie.sln /p:Configuration=Release
cp -r ../Binaries ${PREFIX}/lib/Boogie
ln -s ${PREFIX}/bin/z3 ${PREFIX}/lib/Boogie/z3.exe
echo '#!/bin/bash' > ${PREFIX}/bin/boogie
echo "mono ${PREFIX}/lib/Boogie/Boogie.exe \$@" >> ${PREFIX}/bin/boogie
chmod u+x ${PREFIX}/bin/boogie

cd ${TMP}
git clone ${CORRAL_REPO} corral
cd corral
git reset --hard ${CORRAL_COMMIT}
cp ${PREFIX}/lib/Boogie/*.{dll,exe} references
xbuild cba.sln /p:Configuration=Release
cp -r bin/Release ${PREFIX}/lib/Corral
ln -s ${PREFIX}/bin/z3 ${PREFIX}/lib/Corral/z3.exe
echo '#!/bin/bash' > ${PREFIX}/bin/corral
echo "mono ${PREFIX}/lib/Corral/corral.exe \$@" >> ${PREFIX}/bin/corral
chmod u+x ${PREFIX}/bin/corral
