# A simple hello world example!

   # - debian
   #FROM debian
# - alpine
FROM alpine

MAINTAINER j842

# we use non-root user in the container for security.
# dr expects uid 22022 and gid 22022.
   # - debian
   #RUN groupadd -g 22022 drgroup
   #RUN adduser --disabled-password --gecos '' -u 22022 --gid 22022 druser
# - alpine
RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN addgroup -S -g 22022 drgroup
RUN adduser -S -u 22022 -G drgroup -g '' druser

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
