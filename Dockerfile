# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

# we use non-root user in the container for security.
RUN adduser --disabled-password --gecos '' dockeruser

ADD ["./assets/bin","/usr/local/bin/"]
ADD ["./assets/opt","/opt/dr"]

RUN chown dockeruser /usr/local/bin/*
RUN chown dockeruser /opt/dr/*

RUN mkdir /dr && chown dockeruser /dr

VOLUME ["/dr"]
USER dockeruser

#CMD ["/usr/local/bin/simplesecrets"]
