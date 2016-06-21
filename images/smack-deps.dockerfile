FROM smackers/smack-base
MAINTAINER Michael Emmi

ADD versions/boogie-commit /tmp/versions/boogie-commit
ADD versions/corral-commit /tmp/versions/corral-commit
ADD bin/install-deps.sh /tmp/install-deps.sh
RUN chmod u+x /tmp/install-deps.sh
RUN /tmp/install-deps.sh
