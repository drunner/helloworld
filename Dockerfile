# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

# we use non-root user in the container for security.

RUN groupadd -g 2000 dockergroup
RUN adduser --disabled-password --gecos '' -u 2000 --gid 2000 dockeruser

RUN mkdir /dr && chown dockeruser /dr

ADD ["./assets/bin","/usr/local/bin/"]
ADD ["./assets/opt","/opt/dr"]

RUN chown dockeruser /usr/local/bin/*
RUN chown dockeruser /opt/dr/*

VOLUME ["/dr"]
USER dockeruser

#CMD ["/usr/local/bin/simplesecrets"]
