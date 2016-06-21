# SMACK Images

This repository contains scripts to build Docker images for SMACK.

To run SMACK from a pre-build [Docker][] container, just download the
[vsmack](bin/vsmack) script and put it in your executable path, ensure
[Docker][] is installed, and run `vsmack` directly on
your source files. For example,
````Shell
# fetch vsmack and set executable permission
wget -O ~/bin/vsmack https://raw.githubusercontent.com/smackers/smack-images/master/bin/vsmack
chmod u+x ~/bin/vsmack

# fetch a source file
wget https://raw.githubusercontent.com/smackers/smack/master/test/basic/simple.c

# run vsmack
vsmack simple.c
````

[Docker]: https://www.docker.com
