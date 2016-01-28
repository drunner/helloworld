# A simple hello world example!

FROM debian
MAINTAINER j842

# we use non-root user in the container for security.
# dr expects uid 22022 and gid 22022.
RUN groupadd -g 22022 drgroup
RUN adduser --disabled-password --gecos '' -u 22022 --gid 22022 druser

# create the mount point and allow druser to write to it.
RUN mkdir /dr && chown druser:drgroup /dr

# add in the assets.
ADD ["./assets/bin","/usr/local/bin/"]
ADD ["./assets/forhost","/opt/forhost"]
RUN chown druser:drgroup /usr/local/bin/*
RUN chown druser:drgroup /opt/forhost/*

# expose volume and lock in druser.
VOLUME ["/dr"]
USER druser
