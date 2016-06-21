FROM smackers/smack-deps
MAINTAINER Michael Emmi

ADD bin/install-smack.sh /tmp/install-smack.sh
RUN chmod u+x /tmp/install-smack.sh
RUN /tmp/install-smack.sh

CMD ["smack", "-h"]
