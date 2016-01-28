# Ansible in a Docker container, accessed via ssh.

FROM debian
MAINTAINER j842

# we use non-root user in the container for security.

RUN groupadd -g 22022 drgroup
RUN adduser --disabled-password --gecos '' -u 22022 --gid 22022 druser

RUN mkdir /dr && chown druser:drgroup /dr

ADD ["./assets/bin","/usr/local/bin/"]
ADD ["./assets/forhost","/opt/forhost"]

RUN chown druser:drgroup /usr/local/bin/*
RUN chown druser:drgroup /opt/forhost/*

VOLUME ["/dr"]
USER druser

#CMD ["/usr/local/bin/simplesecrets"]
