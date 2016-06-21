FROM ubuntu:14.04
MAINTAINER Michael Emmi

ADD versions/llvm-version /tmp/versions/llvm-version
ADD versions/mono-version /tmp/versions/mono-version
ADD bin/install-base.sh /tmp/install-base.sh
RUN chmod u+x /tmp/install-base.sh
RUN /tmp/install-base.sh
